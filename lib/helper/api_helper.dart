import 'package:dio/dio.dart';

import '../constant/api_path.dart';

class ApiHelper {
  static late Dio dio;
  static String devEnv = 'DEV';
  static String prodEnv = 'PROD';

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: ApiPath.baseUrl(),
        // receiveDataWhenStatusError: true,
        // receiveTimeout: 7000,
        // sendTimeout: 7000,
      ),
    );
  }

  static Future<Response?> getData({
    required String url,
    Map<String, dynamic>? query,
    String? token,
  }) async {
    print("${ApiPath.baseUrl()}");
    try {
      final Response response = await dio.get(url,
          queryParameters: query,
          options: Options(headers: {
            'Authorization': 'Bearer $token',
            'Content-Type': 'application/json',
          }));

      return response;
    } on DioError catch (e) {
      return e.response;
    }
  }

  static Future<Response?> postData({
    required String url,
    required Map<String, dynamic> data,
    Map<String, dynamic>? query,
    String? token,
  }) async {
    try {
      final Response response = await dio.post(url,
          queryParameters: query,
          data: data,
          options: Options(headers: {
            'Authorization': 'Bearer $token',
            'Content-Type': 'application/json',
          }));

      return response;
    } on DioError catch (e) {
      return e.response;
    }
  }

  static Future<Response?> putData({
    required String url,
    required Map<String, dynamic> data,
    Map<String, dynamic>? query,
    String? token,
  }) async {
    try {
      final Response response = await dio.put(url,
          queryParameters: query,
          data: data,
          options: Options(headers: {
            'Authorization': 'Bearer $token',
            'Content-Type': 'application/json',
          }));

      return response;
    } on DioError catch (e) {
      return e.response;
    }
  }

  static Future<Response?> deleteData({
    required String url,
    String? token,
  }) async {
    try {
      final Response response = await dio.delete(
        url,
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
            'Content-Type': 'application/json',
          },
        ),
      );

      return response;
    } on DioError catch (e) {
      return e.response;
    }
  }
}
