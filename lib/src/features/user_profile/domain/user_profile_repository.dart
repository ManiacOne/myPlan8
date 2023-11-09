import 'package:dartz/dartz.dart';
import 'package:my_plan8/core/failure/failure.dart';
import 'package:my_plan8/src/features/user_profile/data/models/user_profile_model.dart';
import 'package:my_plan8/src/features/user_profile/data/remote_data_source/remote_user_profile.dart';

class UserProfileRepository {
  final RemoteUserProfile remoteUserProfile;
  const UserProfileRepository(this.remoteUserProfile);

  Future<Either<Failure, UserProfileModel>> getUserProfile(
      {required String authToken}) async {
    try {
      UserProfileModel response =
          await remoteUserProfile.getUserProfile(authToken: authToken);
      return Right(response);
    } catch (e) {
      return Left(ErrorMessage(failureMessage: e.toString()));
    }
  }

  Future<Either<Failure, bool>> updateUserProfile(
      {required String userId,  String? consentStatus, required String authToken, int? mobileNumber}) async {
    try {
      bool response = await remoteUserProfile.updateUserProfile(
          userId: userId, consentStatus: consentStatus, authToken : authToken, mobileNumber: mobileNumber);
      return Right(response);
    } catch (e) {
      return Left(ErrorMessage(failureMessage: e.toString()));
    }
  }
}
