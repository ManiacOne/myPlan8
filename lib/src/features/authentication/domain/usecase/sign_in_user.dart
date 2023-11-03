import 'package:dartz/dartz.dart';
import 'package:my_plan8/core/failure/failure.dart';
import 'package:my_plan8/src/features/authentication/data/models/auth_token_model.dart';
import 'package:my_plan8/src/features/authentication/domain/repository/authentication_repository.dart';

class SignInUserUsecase {
  final AuthenticationRepository authenticationRepository;
  const SignInUserUsecase(this.authenticationRepository);

  Future<Either<Failure, AuthTokenModel>> signInUser(
      {required String email,
      required String password,
      required bool rememberMe}) async {
    Either<Failure, AuthTokenModel> response = await authenticationRepository
        .signInUser(email: email, password: password, rememberMe: rememberMe);
    return response;
  }
}
