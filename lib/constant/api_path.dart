import 'dart:io';

class ApiPath {
  static String devEnv = 'DEV';
  static String prodEnv = 'PROD';
  static String baseURL = 'https://api.healersandteachers.com/';

  static String baseUrl() {
    if (const String.fromEnvironment('ENVIRONMENT') == prodEnv) {
      return '${baseURL}api';
    } else {
      return Platform.isIOS
          ? 'http://localhost:8080/api'
          : 'http://10.0.2.2:8080/api';
      // return '${baseURL}api';
      // return 'http://192.168.8.158:8080/api';
    }
  }
}
