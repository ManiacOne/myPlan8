import 'package:dartz/dartz.dart';
import 'package:my_plan8/core/failure/failure.dart';
import 'package:my_plan8/src/features/authentication/domain/repository/authentication_repository.dart';

class VerifyOTPUsecase {
  final AuthenticationRepository authenticationRepository;
  const VerifyOTPUsecase(this.authenticationRepository);

  Future<Either<Failure, bool>> verifyOTP(
      {required String otp, required String authToken}) async {
    return authenticationRepository.verifyOTP(otp: otp, authToken: authToken);
  }
}
