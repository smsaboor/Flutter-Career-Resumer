import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:resume_creator/utils/shared_preference/shared_prefer.dart';

class InternetConnectivity {
  static InternetConnectivity? _instance;
  InternetConnectivity._();

  factory InternetConnectivity() => _instance ??= InternetConnectivity._();
  static bool isConnected = false;

  static Future<bool> checkConnection() async{
    isConnected = false;
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      isConnected = true;
      // I am connected to a mobile network.
    } else if (connectivityResult == ConnectivityResult.wifi) {
      isConnected = true;
      // I am connected to a wifi network.
    } else if (connectivityResult == ConnectivityResult.none) {
      isConnected = false;
    } else {
      isConnected = false;
    }
    return isConnected;
  }
}
