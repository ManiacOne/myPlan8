import 'package:my_plan8/core/client/http.dart';
import 'package:my_plan8/core/config/apis.dart';
import 'package:my_plan8/src/features/authentication/data/models/auth_token_model.dart';

class RemoteAuthentication {
  final HTTP http;
  const RemoteAuthentication(this.http);

  /*=============SIGN UP=======================*/
  Future signUpUser(
      {String? firstName,
      String? lastName,
      required String email,
      required String type,
      required String password,
      String? contactNumber,
      String? referralCode}) async {
    try {
      dynamic response = await http.post(API.signUp, body: {
        if (firstName != null) "firstName": firstName,
        if (lastName != null) "lastName": lastName,
        "email": email,
        "type": "LOCAL",
        "password": password,
        "concentApproval": "PENDING",
        if (referralCode != null) "referralCode": referralCode,
        if (contactNumber != null) "contactNo": contactNumber,
      });
      if (response is! String && response.data["status"] == true) {
        print(response.data);
        AuthTokenModel data = AuthTokenModel.fromJson(response.data["result"]);
        return data;
      } else if (response is! String && response.data["status"] == false) {
        throw response.data["message"];
      } else {
        throw response;
      }
    } catch (e) {
      rethrow;
    }
  }

  /*================SIGN IN============================*/

  Future<AuthTokenModel> signInUser(
      {required String email,
      required String password,
      required bool rememberMe}) async {
    try {
      dynamic response = await http.post(API.signInLocal, body: {
        "email": email,
        "password": password,
        "rememberMe": rememberMe
      });
      if (response is! String && response.data["status"] == true) {
        AuthTokenModel data = AuthTokenModel.fromJson(response.data["result"]);
        return data;
      } else {
        throw response;
      }
    } catch (e) {
      rethrow;
    }
  }

  void getOTP({required String userID}) async {
    await http.post("$API.getOtp/$userID");
  }

  void getUserProfile({required String token}) async {
    await http.get(API.userProfile, token: token);
  }

  Future<bool> verifyOTP(
      {required String otp, required String authToken}) async {
    try {
      dynamic response = await http.post(API.verifyOTP,
          body: {"otp": otp}, authToken: authToken);
      if (response is! String && response.data["status"] == true) {
        return true;
      } else {
        throw response;
      }
    } catch (e) {
      rethrow;
    }
  }
}
