import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:my_plan8/core/failure/failure.dart';
import 'package:my_plan8/src/features/user_profile/data/models/user_profile_model.dart';
import 'package:my_plan8/src/features/user_profile/domain/user_profile_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'user_profile_state.dart';

class UserProfileCubit extends Cubit<UserProfileState> {
  UserProfileCubit({this.userProfileRepository}) : super(UserProfileInitial());

  UserProfileRepository? userProfileRepository;
  String userId = "";

  Future getUserProfile() async {
    emit(UserProfileLoading());
    final prefs = await SharedPreferences.getInstance();
    String token = prefs.getString("authToken") ?? '';
    if (token == "") {
      emit(UserProfileError("Your session has expired"));
    } else {
      Either<Failure, UserProfileModel> response =
          await userProfileRepository!.getUserProfile(authToken: token);
      response.fold((l) {
        emit(UserProfileError(l.failureMessage));
      }, (r) {
        userId = r.userId!;
        emit(UserProfileSuccess(r));
      });
    }
  }

  Future updateUserProfile(
      {required String userId,
      String? consentStatus,
      String? mobileNumber,
      required bool isMobile}) async {
    if (isMobile && mobileNumber!=null) {
      if (mobileNumber == "" ||
          mobileNumber.length < 10 ||
          mobileNumber.length > 10) {
        emit(UserProfileError("Invalid Mobile number"));
      } else {
        final prefs = await SharedPreferences.getInstance();
        String token = prefs.getString("authToken") ?? '';
        if (token == "") {
        } else {
          Either<Failure, bool> response = await userProfileRepository!
              .updateUserProfile(
                  userId: userId, authToken: token, mobileNumber: int.parse(mobileNumber));
          response.fold((l) {
            emit(UserProfileError(l.failureMessage));
          }, (r) {
            emit(UserMobileSucess());
          });
        }
      }
    } else {
      final prefs = await SharedPreferences.getInstance();
      String token = prefs.getString("authToken") ?? '';
      if (token == "") {
      } else {
        Either<Failure, bool> response = await userProfileRepository!
            .updateUserProfile(
                userId: userId, consentStatus: consentStatus, authToken: token);
        response.fold((l) {
          print(l.failureMessage);
        }, (r) {
          //emit(state)
        });
      }
    }
  }

  Future<String> getAuthToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString("authToken") ?? "";
    return token;
  }
}
