import 'dart:convert';
import 'package:first/api_constants/api_constants.dart';
import '../models/album_model.dart';
import 'package:http/http.dart' as http;

class NetworkCallService {
  Future<Album?> getAlbum() async {
    const url = ApiConstants.getAlbum;
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    if (response.statusCode == 200) {
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
