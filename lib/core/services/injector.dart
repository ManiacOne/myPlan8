import 'package:get_it/get_it.dart';
import 'package:my_plan8/core/client/http.dart';
import 'package:my_plan8/src/features/authentication/data/remote_data_source/remote_authentication.dart';
import 'package:my_plan8/src/features/authentication/domain/repository/authentication_repository.dart';
import 'package:my_plan8/src/features/authentication/domain/usecase/sign_in_user_usecase.dart';
import 'package:my_plan8/src/features/authentication/domain/usecase/sign_up_user_usecase.dart';
import 'package:my_plan8/src/features/authentication/domain/usecase/verify_otp_usecase.dart';
import 'package:my_plan8/src/features/authentication/presentation/cubit/authentication_cubit.dart';
import 'package:my_plan8/src/features/track/data/remote_data_source/remote_get_consent.dart';
import 'package:my_plan8/src/features/track/domain/repository/get_consent_repo.dart';
import 'package:my_plan8/src/features/track/domain/usecase/getConsent.dart';
import 'package:my_plan8/src/features/track/presentation/cubit/track_cubit.dart';
import 'package:my_plan8/src/features/user_profile/cubit/user_profile_cubit.dart';
import 'package:my_plan8/src/features/user_profile/data/remote_data_source/remote_user_profile.dart';
import 'package:my_plan8/src/features/user_profile/domain/user_profile_repository.dart';

final sl = GetIt.instance;

Future<void> init() async {
  final HTTP http = HTTP();

  sl
    /*===========================CUBIT=====================================*/
    ..registerFactory(() =>
        AuthenticationCubit(signInUserUsecase: sl(), signUpUserUsecase: sl(), verifyOTPUsecase: sl()))
    ..registerFactory(() => UserProfileCubit(userProfileRepository: sl()))
    ..registerFactory(() => TrackCubit(consentUsecase: sl()))
    /*===========================USECASE===================================*/
    
    ..registerLazySingleton(() => SignInUserUsecase(sl()))
    ..registerLazySingleton(() => SignUpUserUsecase(sl()))
    ..registerLazySingleton(() => VerifyOTPUsecase(sl()))
    ..registerLazySingleton(() => ConsentUsecase(sl()))
    /*===========================REPOSITORY================================*/
    
    ..registerLazySingleton(() => AuthenticationRepository(sl()))
    ..registerLazySingleton(() => UserProfileRepository(sl()))
    ..registerLazySingleton(() => GetConsentRepository(sl()))
    /*===========================REMOTE DATA SOURCE========================*/

    ..registerLazySingleton(() => RemoteGetConsent(http))
    ..registerLazySingleton(() => RemoteAuthentication(http))
    ..registerLazySingleton(() => RemoteUserProfile(http));
}
