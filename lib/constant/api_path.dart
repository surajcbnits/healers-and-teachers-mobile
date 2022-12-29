class ApiPath {
  static String devEnv = 'DEV';
  static String prodEnv = 'PROD';
  static String serverDomain = 'https://api.healersandteachers.com/';

  static String baseUrl() {
    if (const String.fromEnvironment('ENVIRONMENT') == prodEnv) {
      return '${serverDomain}api';
    } else {
      return 'http://localhost:8080/api';
      // return 'http://192.168.8.158:8080/api';
    }
  }
}
