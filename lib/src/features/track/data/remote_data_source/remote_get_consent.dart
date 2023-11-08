import 'package:my_plan8/core/client/http.dart';
import 'package:my_plan8/core/config/apis.dart';

class RemoteGetConsent{
  final HTTP http;
  const RemoteGetConsent(this.http);

  Future getConsent({required String authToken}) async{
    try {
      dynamic response = await http.get(API.getConsent, token: authToken);
      print(response);
    } catch (e) {
      
    }
  }

}