import 'package:flutter/cupertino.dart';
import '../api_service/network_call_service.dart';
import '../models/album_model.dart';

class NetworkCallModel extends ChangeNotifier {
  Album? _album;

  Album? get album => _album;

  set album(Album? value) {
    _album = value;
  }

  Future<void> getAlbum() async {
    final response = await NetworkCallService().getAlbum();
    print("response = $response");
    _album = response!;
    notifyListeners();
  }
  Future<void> verifyLogin(String username, String password) async {
    final response = await NetworkCallService().getAlbu(username, password);
    print("response = $response");
    _album = response!;
    notifyListeners();
  }
}
