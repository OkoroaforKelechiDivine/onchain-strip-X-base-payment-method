import 'package:connectivity/connectivity.dart';

class ConnectivityUtil {
  static Future<ConnectivityResult> checkConnectivity() async {
    final connectivityResult = await Connectivity().checkConnectivity();
    return connectivityResult;
  }
}