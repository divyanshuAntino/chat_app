import 'package:chatapp/core/api_client/api_client.dart';
import 'package:chatapp/feature/add/domain/add_state.dart';
import 'package:chatapp/feature/add/model/add_model.dart';
import 'package:chatapp/feature/add/repository/add_repository.dart';
import 'package:chatapp/shared/extension/common_extension.dart';
import 'package:chatapp/utils/toast_utils.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddCubit extends Cubit<AddState> {
  AddCubit() : super(AddState.init());
  AddRepository addRepository = AddRepository();
  void getAllUser() async {
    emit(
      state.copyWith(
        apiStatus: ApiStatus.loading,
      ),
    );
    try {
      final response = await addRepository.getAllUser();
      final data = AddUserModel.fromJson(response);
      emit(
        state.copyWith(
          addUserModel: data,
        ),
      );
      emit(
        state.copyWith(
          apiStatus: ApiStatus.success,
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
