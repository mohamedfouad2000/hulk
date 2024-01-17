import 'package:dio/dio.dart';

class DioHelper {
  static Dio? dio;
  static init() {
    print("dio Init");
    dio = Dio(BaseOptions(
      baseUrl: 'https://greenhulk.dev.tqnia.me/api/products/',
      receiveDataWhenStatusError: true,
    ));
  }

  static Future<Response> postData({
    required String url,
    required Map<String, dynamic> data,
  }) async {
    dio!.options.headers = {
      'lang': 'en',
      'Content-Type': 'application/json',
    };
    return await dio!.post(url, data: data);
  }

  static Future<Response> getData({
    required String url,
    required Map<String, dynamic> data,
    String lang = 'en',
  }) async {
    dio!.options.headers = {
      'lang': lang,
    };
    return await dio!.get(url, data: data);
  }
}
