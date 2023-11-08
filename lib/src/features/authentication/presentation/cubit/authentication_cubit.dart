import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:my_plan8/core/failure/failure.dart';
import 'package:my_plan8/src/features/authentication/data/models/auth_token_model.dart';
import 'package:my_plan8/src/features/authentication/domain/usecase/sign_in_user_usecase.dart';
import 'package:my_plan8/src/features/authentication/domain/usecase/sign_up_user_usecase.dart';
import 'package:my_plan8/src/features/authentication/domain/usecase/verify_otp_usecase.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'authentication_state.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  AuthenticationCubit(
      {this.signUpUserUsecase, this.signInUserUsecase, this.verifyOTPUsecase})
      : super(AuthenticationInitial());

  SignUpUserUsecase? signUpUserUsecase;
  SignInUserUsecase? signInUserUsecase;
  VerifyOTPUsecase? verifyOTPUsecase;

  /*=================================SIGN UP===================================*/
  void signUpUser(
      {String? firstName,
      String? lastName,
      required String email,
      required String type,
      required String password,
      String? contactNumber,
      String? referralCode}) async {
    emit(AuthenticationLoading());
    if (email == "" || password == "") {
      emit(AuthenticationError(errorMessage: "Enter Valid Details"));
    } else {
      Either<Failure, AuthTokenModel> response = await signUpUserUsecase!
          .signUpUser(email: email, type: type, password: password);
      response.fold((l) {
        emit(AuthenticationError(errorMessage: l.failureMessage));
      }, (r) {
        emit(AuthenticationSuccess(authToken: r.token));
      });
    }
  }

  /*================================LOCAL SIGN IN===================================*/

  void signInUser(
      {required String email,
      required String password,
      required bool rememberMe}) async {
    emit(AuthenticationLoading());
    if (email == "" || password == "") {
      emit(AuthenticationError(errorMessage: "Enter Valid Details"));
    } else {
      Either<Failure, AuthTokenModel> response = await signInUserUsecase!
          .signInUser(email: email, password: password, rememberMe: rememberMe);
      response.fold((l) {
        emit(AuthenticationError(errorMessage: l.failureMessage));
      }, (r) async {
        await saveStringToLocalStorage("authToken", r.token!);
        emit(AuthenticationSuccess());
      });
    }
  }

  Future<void> saveStringToLocalStorage(String key, String value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
  }

  /*==============================VERIFY OTP==============================*/
  Future verifyOTP({required String otp, required String authToken}) async {
    emit(AuthenticationLoading());
    if (otp.length != 4) {
      emit(AuthenticationError(errorMessage: "please enter valid OTP"));
    } else {
      Either<Failure, bool> response = await verifyOTPUsecase!.verifyOTP(otp: otp, authToken: authToken);
      response.fold((l){
        emit(AuthenticationError(errorMessage: l.failureMessage));
      }, (r){
        emit(AuthenticationSuccess());
      });
    }
  }
}
