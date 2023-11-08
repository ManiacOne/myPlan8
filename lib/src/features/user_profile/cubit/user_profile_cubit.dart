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
        emit(UserProfileSuccess(r));
      });
    }
  }

  Future updateUserProfile(
      {required String userId, required String consentStatus}) async {
    final prefs = await SharedPreferences.getInstance();
    String token = prefs.getString("authToken") ?? '';
    if (token == "") {
    } else {
      Either<Failure, bool> response = await userProfileRepository!
          .updateUserProfile(userId: userId, consentStatus: consentStatus, authToken : token);
      response.fold((l) {
        print(l.failureMessage);
      }, (r) {
        //emit(state)
      });
    }
  }

  Future<String> getAuthToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString("authToken") ?? "";
    return token;
  }
}
