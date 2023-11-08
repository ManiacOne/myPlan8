import 'package:bloc/bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'splah_screen_state.dart';

class SplahScreenCubit extends Cubit<SplahScreenState> {
  SplahScreenCubit() : super(SplahScreenInitial());

  Future<void> getStringFromLocalStorage() async {
    emit(SplashScreenLoading());
    final prefs = await SharedPreferences.getInstance();
    String token = prefs.getString("authToken") ?? '';
    if (token == "") {
      emit(SplashScreenError());
    } else if (token.isNotEmpty) {
      print(token);
      emit(SplashScreenSuccess(token));
    }
  }
}
