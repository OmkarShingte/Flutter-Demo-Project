import 'package:connectivity_plus/connectivity_plus.dart';

class InternetConnectivity {
  static bool isDataConnected = false;

    static Future<bool> isConnected() async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      isDataConnected = true;
    } else if (connectivityResult == ConnectivityResult.wifi) {
      isDataConnected = true;
    } else if (connectivityResult == ConnectivityResult.ethernet) {
      isDataConnected = true;
    } else if (connectivityResult == ConnectivityResult.vpn) {
      isDataConnected = true;
    } else if (connectivityResult == ConnectivityResult.bluetooth) {
      isDataConnected = true;
    } else if (connectivityResult == ConnectivityResult.other) {
      isDataConnected = true;
    } else if (connectivityResult == ConnectivityResult.none) {
      isDataConnected = false;
    }
    return isDataConnected;
  }
}
