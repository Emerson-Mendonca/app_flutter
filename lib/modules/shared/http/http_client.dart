import 'dart:developer';

import 'package:dio/dio.dart';

class HttpClientAdapterDio {
  final String _baseURL = 'https://639091b30bf398c73a8bfa13.mockapi.io/api/v1/';
  Dio _dio = Dio();

  HttpClientAdapterDio({required Dio dio}) {
    _dio = dio;
    _dio.options.baseUrl = _baseURL;
  }

  Future<dynamic> get(String path) async {
    try {
      final response = await _dio.get(path);
      log('data: $response');
      return response.data;
    } on DioError catch (e) {
      throw Exception(e);
    }
  }
}
