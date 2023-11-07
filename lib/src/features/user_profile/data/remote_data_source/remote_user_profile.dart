import 'package:my_plan8/core/client/http.dart';
import 'package:my_plan8/core/config/apis.dart';
import 'package:my_plan8/src/features/user_profile/data/models/user_profile_model.dart';

class RemoteUserProfile {
  final HTTP http;
  const RemoteUserProfile(this.http);

  Future getUserProfile({required String authToken}) async {
    try {
      dynamic response = await http.get(API.userProfile, token: authToken);
      if(response is! String && response.data["status"] == true){
        UserProfileModel data = UserProfileModel.fromJson(response);
        return response;
      }else{
        throw response;
      }
    } catch (e) {
      rethrow;
    }
  }
}
