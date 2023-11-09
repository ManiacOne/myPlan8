import 'package:dartz/dartz.dart';
import 'package:my_plan8/core/failure/failure.dart';
import 'package:my_plan8/src/features/track/data/remote_data_source/remote_get_consent.dart';

class GetConsentRepository {
  final RemoteGetConsent remoteGetConsent;
  const GetConsentRepository(this.remoteGetConsent);

  Future<Either<Failure, String>> getConsent(
      {required String authToken}) async {
    try {
      String response = await remoteGetConsent.getConsent(authToken: authToken);
      return Right(response);
    } catch (e) {
      return Left(ErrorMessage(failureMessage: e.toString()));
    }
  }
}
