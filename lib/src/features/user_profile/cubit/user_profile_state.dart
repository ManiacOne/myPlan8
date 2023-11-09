part of 'user_profile_cubit.dart';

abstract class UserProfileState {}

final class UserProfileInitial extends UserProfileState {}

final class UserProfileLoading extends UserProfileState {}

final class UserProfileSuccess extends UserProfileState {
  final UserProfileModel userProfile;
  UserProfileSuccess(this.userProfile);
} 

final class UserMobileSucess extends UserProfileState {} 

final class UserProfileNavigate extends UserProfileState{}

final class UserProfileError extends UserProfileState {
  final String errorMessage;
  UserProfileError(this.errorMessage);
}
