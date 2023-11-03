// import 'dart:html';
import 'dart:typed_data';
// import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
// import 'package:internet_connection_checker/internet_connection_checker.dart';
// import '../../../api/core/api_exporter.dart';
// import '../../../api/core/custom_response.dart';
// import '../../../locator/locator.dart';
// import '../../../res/colors.dart';
// import '../../../shared_widget/show_message.dart';

class MonitoringProvider extends ChangeNotifier {
  late Uint8List _imagePath;

  Uint8List get imageUnit => _imagePath;

  set imageUnit(Uint8List value) {
    _imagePath = value;
    notifyListeners();
  }

  bool _isCamera = true;

  bool get isCamera => _isCamera;

  set isCamera(bool value) {
    _isCamera = value;
    notifyListeners();
  }

  var _path;

  get path => _path;

  set path(value) {
    _path = value;
    notifyListeners();
  }


  bool _isLoading = false;

  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }
  Future<bool> uploadImage({required Uint8List imagePath}) async {
    bool isConnected = await InternetConnectionChecker().hasConnection;
    if (isConnected) {

      // FormData formData = FormData.fromMap({
      //   "file": MultipartFile.fromBytes(
      //     imagePath,
      //     filename: 'image.jpg',
      //   ),
      // });

      // final response = await api.uploadImage(formData: formData);
      // if (response.status == Status.ERROR) {
      //   // ShowMessage.show(response.message, bgColor: AppColors().failureBGColor);
      //   return false;
      // } else {
      //   return true;
      // }
      return true;
    } else {
      // ShowMessage.show("Please check your internet connection !");
      return true;
    }
  }
}
