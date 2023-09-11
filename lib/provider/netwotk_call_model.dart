import 'package:first/repository/network_call_api.dart';
import 'package:flutter/cupertino.dart';

import '../models/album.dart';

class NetworkCallModel extends ChangeNotifier {
  Album? _album;
  Album? get album => _album;
  set album(Album? value) {
    _album = value;
  }

  Future<void> getAllTodos() async {
    final response = await NetworkCallApi().getData();
    print("response = $response");
    _album = response!;
    notifyListeners();
  }
}
