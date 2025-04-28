import 'package:chatapp/core/api_client/api_client.dart';
import 'package:chatapp/feature/add/model/add_model.dart';
import 'package:equatable/equatable.dart';

class AddState extends Equatable {
  final ApiStatus apiStatus;
  final AddUserModel? addUserModel;
  const AddState({
    required this.apiStatus,
    this.addUserModel,
  });
  factory AddState.init() {
    return AddState(
      apiStatus: ApiStatus.int,
      addUserModel: null,
    );
  }
  AddState copyWith({
    ApiStatus? apiStatus,
    AddUserModel? addUserModel,
  }) {
    return AddState(
      apiStatus: apiStatus ?? this.apiStatus,
      addUserModel: addUserModel ?? this.addUserModel,
    );
  }

  @override
  List<Object?> get props => [
        apiStatus,
        addUserModel,
      ];
}
