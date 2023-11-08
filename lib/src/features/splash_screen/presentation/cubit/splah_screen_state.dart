part of 'splah_screen_cubit.dart';

abstract class SplahScreenState {}

final class SplahScreenInitial extends SplahScreenState {}

final class SplashScreenLoading extends SplahScreenState {}

final class SplashScreenError extends SplahScreenState {}

final class SplashScreenSuccess extends SplahScreenState {
  final String authToken;
  SplashScreenSuccess(this.authToken);
}
