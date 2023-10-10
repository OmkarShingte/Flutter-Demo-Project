import 'package:flutter/material.dart';
import '../api_service/signin_service.dart';
import '../models/login.dart';

class SignInProvider extends ChangeNotifier {
  bool _mobileLogin = true;

  var emailIdController = TextEditingController();
  var passwordController = TextEditingController();
  var mobileController = TextEditingController();

  bool get mobileLogin => _mobileLogin;

  set mobileLogin(bool value) {
    _mobileLogin = value;
    notifyListeners();
  }

  late LoginUser? _login;

  LoginUser? get login => _login;

  set login(LoginUser? value) {
    _login = value;
    notifyListeners();
  }

  Future<bool> emailLogin(BuildContext context) async {
    _login = null;
    final response = await SignInService()
        .emailLogin(emailIdController.text, passwordController.text);
    _login = response!;
    print("object  ${_login?.status}");
    notifyListeners();
    if (_login?.status != 0) {
      return true;
    } else {
      return false;
    }
  }

  sendOtp(BuildContext context) async {
    if (mobileController.text.length != 10) {
      final response = await SignInService().sendOtp(mobileController.text);
      // if (response?.status == 1) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Center(child: Text("OTP")),
          content: TextFormField(
            decoration: const InputDecoration(
              enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFFEE4B2B))),
              hintText: 'Enter OTP',
              labelText: 'OTP',
              alignLabelWithHint: true,
              counterText: '',
            ),
            keyboardType: TextInputType.number,
            maxLength: 6,
          ),
        ),
      );
      // }
    }
  }
}
