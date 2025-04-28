import 'package:chatapp/core/api_client/api_client.dart';
import 'package:chatapp/feature/home/model/user_model.dart';
import 'package:equatable/equatable.dart';

class HomeState extends Equatable {
  final ApiStatus apiStatus;
  final UserProfile? userProfile;
  const HomeState({
    required this.apiStatus,
    this.userProfile,
  });
  factory HomeState.init() {
    return HomeState(
      apiStatus: ApiStatus.int,
      userProfile: null,
    );
  }
  HomeState copyWith({
    ApiStatus? apiStatus,
    UserProfile? userProfile,
  }) {
    return HomeState(
      apiStatus: apiStatus ?? this.apiStatus,
      userProfile: userProfile ?? this.userProfile,
    );
  }

  @override
  List<Object?> get props => [apiStatus, userProfile];
}
