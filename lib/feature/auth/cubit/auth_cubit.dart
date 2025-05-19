import 'dart:developer';

import 'package:chatapp/constant/constant.dart';
import 'package:chatapp/core/api_client/api_client.dart';
import 'package:chatapp/feature/auth/cubit/auth_state.dart';
import 'package:chatapp/feature/auth/model/auth_model.dart';
import 'package:chatapp/feature/auth/repository/auth_repository.dart';
import 'package:chatapp/routes/app_routes.dart';
import 'package:chatapp/routes/routes.dart';
import 'package:chatapp/utils/storage_utils.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthState.init());
  AuthRepository authRepository = AuthRepository();
  void createUser() async {
    emit(
      state.copyWith(
        apiStatus: ApiStatus.loading,
      ),
    );
    try {
      final response = await authRepository.createUser(
        email: state.emailController.value.text,
        password: state.passwordController.value.text,
        name: state.nameController.value.text,
      );
      final data = AuthModel.fromJson(response);
      emit(
        state.copyWith(
          authModel: data,
          apiStatus: ApiStatus.success,
        ),
      );
      AppRoutes.appRouter.push("/home");
      handelNavigation(accessToken: data.data?.token?.accessToken ?? '');
      resetAuthCubit();
    } catch (e) {
      log(e.toString());
      emit(
        state.copyWith(
          apiStatus: ApiStatus.failed,
        ),
      );
    }
  }

  void loginUser() async {
    emit(
      state.copyWith(
        apiStatus: ApiStatus.loading,
      ),
    );
    try {
      final response = await authRepository.loginUser(
        email: state.emailController.value.text,
        password: state.passwordController.value.text,
      );
      final data = AuthModel.fromJson(response);
      emit(
        state.copyWith(
          authModel: data,
          apiStatus: ApiStatus.success,
        ),
      );

      handelNavigation(
          accessToken: data.data?.token?.accessToken ?? '',
          userId: data.data?.user?.id ?? '');
      AppRoutes.appRouter.push("/home");
    } catch (e) {
      log(e.toString());
      emit(
        state.copyWith(
          apiStatus: ApiStatus.failed,
        ),
      );
    }
  }

  void handelNavigation({
    String? accessToken,
    String? userId,
  }) async {
    if (accessToken != null) {
      saveTokenInStorage(
        accessToken: accessToken,
        userId: userId ?? '',
      );
    }

    if (accessToken?.isEmpty == true || accessToken == null) {
      AppRoutes.appRouter.go(Routes.auth);
    } else {
      AppRoutes.appRouter.pushReplacement(
        Routes.home,
      );
    }
  }

  void saveTokenInStorage({
    required String accessToken,
    required String userId,
  }) {
    emit(state.copyWith(accessToken: accessToken, userId: userId));
    SecureStorage.instance.write(
      AppStrings.accessToken,
      accessToken,
    );
    SecureStorage.instance.write(
      AppStrings.userId,
      userId,
    );
  }

  // check if token is present or not
  Future<String?> getTokenFromStorage() async {
    final accessToken = await SecureStorage.instance.read(
      AppStrings.accessToken,
    );
    final userid = await SecureStorage.instance.read(
      AppStrings.userId,
    );

    handelNavigation(
      accessToken: accessToken,
      userId: userid,
    );

    return null;
  }

  void resetAuthCubit() {
    emit(AuthState.init());
  }

  Future<void> logout() async {
    await SecureStorage.instance.deleteAll();
    emit(AuthState.init());
    AppRoutes.appRouter.pushReplacement(Routes.auth);
  }
}
