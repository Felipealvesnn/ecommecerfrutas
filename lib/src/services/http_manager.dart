import 'package:dio/dio.dart';
import 'package:get/get_connect.dart';

abstract class HttpMethods {
  static const String post = 'POST';
  static const String get = 'GET';
  static const String put = 'PUT';
  static const String patch = 'PATCH';
  static const String delete = 'DELETE';
}

class HttpManager {
  static Future<Map> restRequest({
    required String url,
    required String method,
    Map? headers,
    Map? body,
  }) async {
    // Headers da requisição
    final defaultHeaders = headers?.cast<String, String>() ?? {}
      ..addAll({
        'content-type': 'application/json',
        'accept': 'application/json',
        'X-Parse-Application-Id': 'wK7GcEjr2V4br5q5mlR1kybQ5dvxMFDX0qtE1d6Y',
        'X-Parse-REST-API-Key': '2kahi62fkWePLWAwC7k8aMrtQkobogcgkruMxbeB',
      });

    Dio dio = Dio();

    try {
      final response = await dio.request(
        url,
        options: Options(
          headers: defaultHeaders,
          method: method,
        ),
        data: body,
      );

      // Retorno do resultado do backend
      return response.data;
    } on DioException catch (error) {
      // Retorno do erro do dio request
      return error.response?.data ?? {};
    } catch (error) {
      // Retorno de map vazio para error generalizado
      return {'error': error};
    }
  }
}



//http com request do proprio getx
class HttpManagers extends GetConnect {
  static Future<Map> restRequest({
    required String url,
    required String method,
    Map? headers,
    Map? body,
  }) async {
    // Headers da requisição
    final defaultHeaders = headers?.cast<String, String>() ?? {}
      ..addAll({
        'content-type': 'application/json',
        'accept': 'application/json',
        'X-Parse-Application-Id': 'wK7GcEjr2V4br5q5mlR1kybQ5dvxMFDX0qtE1d6Y',
        'X-Parse-REST-API-Key': '2kahi62fkWePLWAwC7k8aMrtQkobogcgkruMxbeB',
      });

    try {
      final response = await HttpManagers().request(
        url,
         method,
        headers: defaultHeaders,
        body: body,
      );

      // Retorno do resultado do backend
      return response.body;
    } catch (error) {
      // Trate o erro aqui, retornando um Map vazio ou algum outro tratamento de erro
      return {'error': error.toString()};
    }
  }
}
