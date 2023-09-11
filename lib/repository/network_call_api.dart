import 'dart:convert';
import 'dart:developer';
import '../models/album.dart';
import 'package:http/http.dart' as http;

class NetworkCallApi {
  static String baseUrl = 'https://jsonplaceholder.typicode.com';
  static String usersEndpoint = '/users';

  Future<Album?> getData() async {
    const url = 'https://jsonplaceholder.typicode.com/albums/1';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      print("jsonDecode(response.body) = ${jsonDecode(response.body)}");
      return Album.fromJson(jsonDecode(response.body));
    }
    return null;
  }

// Future<Album> getUsers() async {
//   try {
//     var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.usersEndpoint);
//     var response = await http.get(url);
//     if (response.statusCode == 200) {
//       Album _model = Album.fromJson(jsonDecode(response.body));
//       return _model;
//     }
//   } catch (e) {
//     log(e.toString());
//   }
// }
}
