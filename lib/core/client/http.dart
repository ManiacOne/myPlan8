import 'package:dio/dio.dart';
import 'package:my_plan8/core/config/apis.dart';
import 'package:my_plan8/core/failure/network_exceptions.dart';

class HTTP {
  final _dio = Dio(BaseOptions(
      baseUrl: API.baseUrl,
      connectTimeout: const Duration(seconds: 60),
      contentType: Headers.jsonContentType));

  Future<dynamic> post(String uri,
      {Map<String, dynamic>? body, String? authToken}) async {
    try {
      Response response = await _dio.post(uri,
          data: body,
          options: Options(headers: {"Authorization": "Bearer $authToken"}));
      return response;
    } on DioException catch (e) {
      NetworkException networkException = NetworkException();
      return networkException.dioErrorfunc(e);
      //rethrow;
    }
  }

  Future<dynamic> get(String uri, {String? token}) async {
    try {
      Response response = await _dio.get(uri,
          options: Options(headers: {"Authorization": "Bearer $token"}));
      return response;
    } on DioException catch (e) {
      print(e);
      NetworkException networkException = NetworkException();
      return networkException.dioErrorfunc(e);
    }
  }

  Future<dynamic> put(String uri, Map<String, dynamic> body,
      {String? authToken}) async {
    try {
      Response response = await _dio.put(
        uri,
        data: body,
        options: Options(
          headers: {
            "Authorization" : "Bearer $authToken"
          }
        )
      );
      return response;
    } on DioException catch (e) {
      NetworkException networkException = NetworkException();
      return networkException.dioErrorfunc(e);
    }
  }
}
