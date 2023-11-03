class AuthTokenModel {
  String? token;

  AuthTokenModel({this.token});

  AuthTokenModel.fromJson(Map<String, dynamic> json) {
    token = json['data'];
  }
}
