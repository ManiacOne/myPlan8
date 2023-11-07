import 'package:get_it/get_it.dart';
import 'package:my_plan8/core/client/http.dart';
import 'package:my_plan8/src/features/authentication/data/remote_data_source/remote_authentication.dart';
import 'package:my_plan8/src/features/authentication/domain/repository/authentication_repository.dart';
import 'package:my_plan8/src/features/authentication/domain/usecase/sign_in_user.dart';
import 'package:my_plan8/src/features/authentication/domain/usecase/sign_up_user_usecase.dart';
import 'package:my_plan8/src/features/authentication/presentation/cubit/authentication_cubit.dart';
import 'package:my_plan8/src/features/user_profile/cubit/user_profile_cubit.dart';
import 'package:my_plan8/src/features/user_profile/data/remote_data_source/remote_user_profile.dart';
import 'package:my_plan8/src/features/user_profile/domain/user_profile_repository.dart';

final sl = GetIt.instance;

Future<void> init() async {
  final HTTP http = HTTP();

  sl
    /*===========================CUBIT=====================================*/
    ..registerFactory(() =>
        AuthenticationCubit(signInUserUsecase: sl(), signUpUserUsecase: sl()))
    ..registerFactory(() => UserProfileCubit(userProfileRepository: sl()))
    /*===========================USECASE===================================*/
    
    ..registerLazySingleton(() => SignInUserUsecase(sl()))
    ..registerLazySingleton(() => SignUpUserUsecase(sl()))
    
    /*===========================REPOSITORY================================*/
    
    ..registerLazySingleton(() => AuthenticationRepository(sl()))
    ..registerLazySingleton(() => UserProfileRepository(sl()))
    
    /*===========================REMOTE DATA SOURCE========================*/

    ..registerLazySingleton(() => RemoteAuthentication(http))
    ..registerLazySingleton(() => RemoteUserProfile(http));
}
