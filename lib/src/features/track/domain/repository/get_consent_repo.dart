import 'package:my_plan8/src/features/track/data/remote_data_source/remote_get_consent.dart';

class GetConsentRepository{
  final RemoteGetConsent remoteGetConsent;
  const GetConsentRepository(this.remoteGetConsent);

  Future getConsent({required String authToken}) async{
    remoteGetConsent.getConsent(authToken:authToken);
  }
}