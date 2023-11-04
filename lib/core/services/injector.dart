import 'package:get_it/get_it.dart';
import 'package:my_plan8/core/client/http.dart';
import 'package:my_plan8/src/features/authentication/data/remote_authentication.dart';
import 'package:my_plan8/src/features/authentication/domain/repository/authentication_repository.dart';
import 'package:my_plan8/src/features/authentication/domain/usecase/sign_in_user.dart';
import 'package:my_plan8/src/features/authentication/domain/usecase/sign_up_user_usecase.dart';
import 'package:my_plan8/src/features/authentication/presentation/cubit/authentication_cubit.dart';

final sl = GetIt.instance;

Future<void> init() async {
  final HTTP http = HTTP();

  sl
    /*===========================CUBIT=====================================*/
    ..registerFactory(() =>
        AuthenticationCubit(signInUserUsecase: sl(), signUpUserUsecase: sl()))
    /*===========================USECASE===================================*/
    
    ..registerLazySingleton(() => SignInUserUsecase(sl()))
    ..registerLazySingleton(() => SignUpUserUsecase(sl()))
    
    /*===========================REPOSITORY================================*/
    
    ..registerLazySingleton(() => AuthenticationRepository(sl()))
    
    /*===========================REMOTE DATA SOURCE========================*/

    ..registerLazySingleton(() => RemoteAuthentication(http));
}
