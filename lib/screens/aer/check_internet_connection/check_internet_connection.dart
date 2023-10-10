import 'package:connectivity_plus/connectivity_plus.dart';

Future<bool> isConnected() async{
  final connectivityResult = await (Connectivity().checkConnectivity());
  if (connectivityResult == ConnectivityResult.mobile) {
    return true;
  } else if (connectivityResult == ConnectivityResult.wifi) {
    return true;
  } else if (connectivityResult == ConnectivityResult.ethernet) {
    return true;
  } else if (connectivityResult == ConnectivityResult.vpn) {
    return true;
  } else if (connectivityResult == ConnectivityResult.bluetooth) {
    return true;
  } else if (connectivityResult == ConnectivityResult.other) {
    return true;
  } else if (connectivityResult == ConnectivityResult.none) {
    return false;
  }
  return false;
}
