import 'package:dartz/dartz.dart';
import 'package:my_plan8/core/failure/failure.dart';
import 'package:my_plan8/src/features/authentication/data/models/auth_token_model.dart';
import 'package:my_plan8/src/features/authentication/data/remote_data_source/remote_authentication.dart';

class AuthenticationRepository {
  final RemoteAuthentication remoteAuthentication;
  const AuthenticationRepository(this.remoteAuthentication);

  Future<Either<Failure, AuthTokenModel>> signUpUser(
      {String? firstName,
      String? lastName,
      required String email,
      required String type,
      required String password,
      String? contactNumber,
      String? referralCode}) async {
    try {
      AuthTokenModel response = await remoteAuthentication.signUpUser(
          email: email, type: type, password: password);
      return Right(response);
    } catch (e) {
      return Left(ErrorMessage(failureMessage: e.toString()));
    }
  }

  Future<Either<Failure, AuthTokenModel>> signInUser(
      {required String email,
      required String password,
      required bool rememberMe}) async {
    try {
      AuthTokenModel response = await remoteAuthentication.signInUser(
          email: email, password: password, rememberMe: rememberMe);
      return Right(response);
    } catch (e) {
      return Left(ErrorMessage(failureMessage: e.toString()));
    }
  }

  Future getOTP({required String userID}) async {
    remoteAuthentication.getOTP(userID: userID);
  }

  Future<Either<Failure, bool>> verifyOTP(
      {required String otp, required String authToken}) async {
    try {
      bool response =
          await remoteAuthentication.verifyOTP(otp: otp, authToken: authToken);
      return Right(response);
    } catch (e) {
      return Left(ErrorMessage(failureMessage: e.toString()));
    }
  }
}
