class API {
  static const String baseUrl = "https://devapi.myplan8.earth/v1/api";

  /*===================AUTHENTICATION=========================*/
  static const String user = "/user";
  static const String signUp = "/user/sign-up";
  static const String signInLocal = "/user/login/local";
  static const String signInGoogle = "/user/login/google";
  static const String forgotPass = "/user/forgot-password";
  static const String getOtp = "/user/resend-otp";
  static const String verifyOTP = "/user/verify-otp";
  static const String userProfile = "/user/details/profile";

  /*======================TRACK===============================*/
  static const String getConsent = "/track/automatic/consent";
}
