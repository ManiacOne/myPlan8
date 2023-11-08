import 'package:bloc/bloc.dart';
import 'package:my_plan8/src/features/track/domain/usecase/getConsent.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'track_state.dart';

class TrackCubit extends Cubit<TrackState> {
  TrackCubit({this.consentUsecase}) : super(TrackInitial());

  ConsentUsecase? consentUsecase;

  void getConsent() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString("authToken") ?? "";
    await consentUsecase!.getConsent(authToken: token);
  }

  void verifyMobile({required String mobileNumber})async{
    if(mobileNumber == "" || mobileNumber.length < 10 || mobileNumber.length > 10 ){
      emit(TrackError(errorMessage: "Invalid Mobile number"));
    }else{
      print(mobileNumber);
      emit(TrackSuccess());
    }
  }

}
