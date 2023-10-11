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

  Future<int?> emailLogin() async {
    _login = null;
    final response = await SignInService()
        .emailLogin(emailIdController.text, passwordController.text);
    _login = response!;
    print("object  ${_login?.status}");
    notifyListeners();
    return _login?.status;
  }

  Future<int?> sendOtp() async {
    final response = await SignInService().sendOtp(mobileController.text);
    _login = response!;
    return response.status;
  }
}
