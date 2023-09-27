import 'dart:convert';
import 'package:first/api_constants/api_constants.dart';
import 'package:first/models/number_model.dart';
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

  Future<Album?> getAlbu(String username, String password) async {
    const url = ApiConstants.getAlbum;
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      return Album.fromJson(jsonDecode(response.body));
    }
    return null;
  }

  Future<Numbers> getList(String page) async {
    final uri = Uri.parse(ApiConstants.getNumbers);
    final res = await http.get(uri);
    print("response----> $res");
    return Numbers.fromJson(jsonDecode(res.body));
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
