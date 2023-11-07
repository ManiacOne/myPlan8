import 'package:my_plan8/src/features/authentication/domain/repository/authentication_repository.dart';

class GetOTP{
  final AuthenticationRepository authenticationRepository;
  const GetOTP(this.authenticationRepository);

  Future getOTP({required String userID})async{
    await authenticationRepository.getOTP(userID : userID);
  }
}