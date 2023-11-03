import 'package:fluttertoast/fluttertoast.dart';

class ToastMessage {
  static toast16({required String toastMessage}) {
    return Fluttertoast.showToast(msg: toastMessage, fontSize: 16);
  }
}
