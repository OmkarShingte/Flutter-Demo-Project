import 'package:fluttertoast/fluttertoast.dart';

class CustomToast {
  Future<bool?> customToast(
    String msg,
  ) {
    return Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
    );
  }
}
