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
    print(token);
    await consentUsecase!.getConsent(authToken: token);
  }
}
