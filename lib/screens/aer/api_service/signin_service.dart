import 'dart:convert';
import 'package:first/screens/aer/api_constants/api_list.dart';
import 'package:first/screens/aer/models/login.dart';
import '../../../models/album_model.dart';
import 'package:http/http.dart' as http;//The method 'post' was called on null.

class SignInService {

  Future<Album?> mobileLogin() async {
    const url = AerApi.login;
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      return Album.fromJson(jsonDecode(response.body));
    }
    return null;
  }

  Future<LoginUser?> emailLogin(String email, String password) async {
    final url =
        Uri.parse("https://oneplatform.anulom.com/api/v1/user_info/login");

    final requestBody = {
      "type": 'Self',
      "email": email,
      "password": password,
      "get_auth_token": AerApi.get_auth_token,
    };
    final requestBodyJson = json.encode(
        requestBody); //Bad state: Cannot set the body fields of a Request with content-type "application/json".

    try {
      final response = await http.post(
        url,
        body: requestBodyJson,
        headers: {
          "Content-Type": "application/json",
        },
      );

      print("Response body: ${response.body}");
      if (response.statusCode == 200) {
        return LoginUser.fromJson(jsonDecode(response.body));
      } else {
        print("LoginUser failed with status code: ${response.statusCode}");
        return null;
      }
    } catch (e) {
      print("Error during login: $e");
    }
  }

  Future<LoginUser?> sendOtp(String mobile) async {
    final url = Uri.parse(AerApi.getUrl(AerApi.login));

    final requestBody = {
      "type": 'OTP',
      "contact_no": mobile,
      "get_auth_token": AerApi.get_auth_token,
    };
    final requestBodyJson = json.encode(requestBody);

    try {
      final response = await http.post(
        url,
        body: requestBodyJson,
        headers: {
          // You may need to add headers if required by the API
          "Content-Type": "application/json",
        },
      );

      print("Response body: ${response.body}");
      if (response.statusCode == 200) {
        return LoginUser.fromJson(jsonDecode(response.body));
      } else {
        print("LoginUser failed with status code: ${response.statusCode}");
        return null;
      }
    } catch (e) {
      print("Error during login: $e");
    }
  }
}
