import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:my_plan8/core/failure/failure.dart';
import 'package:my_plan8/src/features/user_profile/data/models/user_profile_model.dart';
import 'package:my_plan8/src/features/user_profile/domain/user_profile_repository.dart';

part 'user_profile_state.dart';

class UserProfileCubit extends Cubit<UserProfileState> {
  UserProfileCubit({this.userProfileRepository}) : super(UserProfileInitial());

  UserProfileRepository? userProfileRepository;

  Future<String> getUserProfile({required String authToken}) async {
    String userId = "";
    Either<Failure, UserProfileModel> response =
        await userProfileRepository!.getUserProfile(authToken: authToken);
    response.fold((l) {}, (r) {
      userId = r.userId!;
    });
    return userId;
  }
}
