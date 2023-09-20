import 'enum/environment.dart';

class EnvironmentInitializer{
  static late Map<String, dynamic> _config;

  static void setEnvironment(Environment env) {
    switch (env) {
      case Environment.DEV:
        _config = _BaseUrlConfig.debugConstants;
        break;
      case Environment.PROD:
        _config = _BaseUrlConfig.prodConstants;
        break;
      case Environment.QA:
        _config = _BaseUrlConfig.qaConstants;
        break;
    }
  }
  static get BASE_URL {
    return _config[_BaseUrlConfig.BASE_URL];
  }
}

class _BaseUrlConfig {
  static const BASE_URL = 'BaseUrl';

  static Map<String, dynamic> debugConstants = {
    BASE_URL: "https://dzbilqfc4qszv.cloudfront.net",
  };

  static Map<String, dynamic> prodConstants = {
    BASE_URL: "Prod Base URL",
  };

  static Map<String, dynamic> qaConstants = {
    BASE_URL: "QA Base URL",
  };
}