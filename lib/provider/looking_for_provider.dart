import 'package:first/api_service/network_call_service.dart';
import 'package:flutter/cupertino.dart';

import '../models/demo.dart';

class LookingForProvider extends ChangeNotifier {
  Demo? _demoNumbers;

  Demo? get demoNumbers => _demoNumbers;

  set demoNumbers(Demo? value) {
    _demoNumbers = value;
  }

  late List<Demo> list;

  Future<void> getList(String page) async {
    list.add(Demo(
        country: "11",
        listingType: "12",
        number: "13",
        rating: "14",
        type: "15"));
    list.add(Demo(
        country: "21",
        listingType: "22",
        number: "23",
        rating: "24",
        type: "25"));
    list.add(Demo(
        country: "31",
        listingType: "32",
        number: "33",
        rating: "34",
        type: "35"));
    list.add(Demo(
        country: "41",
        listingType: "42",
        number: "43",
        rating: "44",
        type: "45"));
    notifyListeners();
  }
}
