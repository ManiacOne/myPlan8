import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:my_plan8/core/failure/failure.dart';
import 'package:my_plan8/src/features/track/domain/usecase/getConsent.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'track_state.dart';

class TrackCubit extends Cubit<TrackState> {
  TrackCubit({this.consentUsecase}) : super(TrackInitial());

  ConsentUsecase? consentUsecase;

  Future<String> getConsent() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = await prefs.getString("authToken") ?? "";
    String consentHandle = "";
    Either<Failure, String> response = await consentUsecase!.getConsent(authToken: token);
    response.fold((l){
      consentHandle = "";
      emit(TrackError(errorMessage: l.failureMessage));
    }, (r){
      consentHandle = r;
      emit(TrackSuccess(consentHandle: r));
    });
    return consentHandle;
  }

}
