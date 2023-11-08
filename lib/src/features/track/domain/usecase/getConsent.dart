import 'package:my_plan8/src/features/track/domain/repository/get_consent_repo.dart';

class ConsentUsecase{
  final GetConsentRepository getConsentRepository;
  const ConsentUsecase(this.getConsentRepository);

  Future getConsent({required String authToken})async{
    await getConsentRepository.getConsent(authToken : authToken);
    
  }
}