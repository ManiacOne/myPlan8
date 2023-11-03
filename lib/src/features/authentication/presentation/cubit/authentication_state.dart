part of 'authentication_cubit.dart';

abstract class AuthenticationState {}

final class AuthenticationInitial extends AuthenticationState {}

final class AuthenticationLoading extends AuthenticationState{}

final class AuthenticationSuccess extends AuthenticationState{}

final class AuthenticationError extends AuthenticationState{
  final String errorMessage;
  AuthenticationError({required this.errorMessage});
}
