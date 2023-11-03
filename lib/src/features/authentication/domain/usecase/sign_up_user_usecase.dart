import 'package:dartz/dartz.dart';
import 'package:my_plan8/core/failure/failure.dart';
import 'package:my_plan8/src/features/authentication/domain/repository/authentication_repository.dart';

class SignUpUserUsecase {
  final AuthenticationRepository authenticationRepository;
  const SignUpUserUsecase(this.authenticationRepository);

  Future<Either<Failure, bool>> signUpUser(
      {String? firstName,
      String? lastName,
      required String email,
      required String type,
      required String password,
      String? contactNumber,
      String? referralCode}) async {
    Either<Failure, bool> response = await authenticationRepository.signUpUser(
        email: email, type: type, password: password);
    return response;
  }
}
