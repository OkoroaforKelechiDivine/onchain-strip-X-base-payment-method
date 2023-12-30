import 'package:flutter/foundation.dart' as Foundation;

class Endpoints {
  //static const baseUrl = 'https://payme-api-dev.systemshift.africa';
  //LiVE ENDPOINT
  static const baseUrl = Foundation.kDebugMode
      ? 'https://payme-api-dev.systemshift.africa'
      : 'https://payme-api.systemshift.africa';
}
