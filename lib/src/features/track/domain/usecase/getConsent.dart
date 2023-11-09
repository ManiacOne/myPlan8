import 'package:dartz/dartz.dart';
import 'package:my_plan8/core/failure/failure.dart';
import 'package:my_plan8/src/features/track/domain/repository/get_consent_repo.dart';

class ConsentUsecase {
  final GetConsentRepository getConsentRepository;
  const ConsentUsecase(this.getConsentRepository);

  Future<Either<Failure, String>> getConsent(
      {required String authToken}) async {
    return await getConsentRepository.getConsent(authToken: authToken);
  }
}
