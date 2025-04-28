import 'package:chatapp/core/api_client/api_client.dart';
import 'package:chatapp/feature/home/domain/home_state.dart';
import 'package:chatapp/feature/home/model/user_model.dart';
import 'package:chatapp/feature/home/repository/home_repository.dart';
import 'package:chatapp/shared/extension/common_extension.dart';
import 'package:chatapp/utils/toast_utils.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeState.init());
  HomeRepository homeRepository = HomeRepository();
  void getUserProfile() async {
    emit(
      state.copyWith(
        apiStatus: ApiStatus.loading,
      ),
    );
    try {
      final response = await homeRepository.getUserProfile();
      final data = UserProfile.fromJson(response);
      emit(
        state.copyWith(
          apiStatus: ApiStatus.success,
          userProfile: data,
        ),
      );
    } catch (e) {
      ToastUtil.showAPIErrorToast(message: e.getErrorMessage);
      emit(
        state.copyWith(
          apiStatus: ApiStatus.failed,
        ),
      );
    }
  }
}
