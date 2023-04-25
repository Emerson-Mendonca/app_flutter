import 'package:app_flutter/app/shared/http/http_client.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';

const successMessage = {'message': 'Success'};
const errorMessage = {'message': 'error'};
const testPath = '/test';
const baseUrl = 'https://example.com';
const testData = {'data': 'sample data'};
const header = {'Content-Type': 'application/json'};

void main() {
  late Dio dio;
  late Dio dioDioMock;
  late DioAdapter dioAdapter;
  late HttpClientAdapterDio httpClientAdapterDio;

  setUp(() {
    dio = Dio(BaseOptions(baseUrl: baseUrl));
    dioAdapter = DioAdapter(dio: dio, matcher: const UrlRequestMatcher());
    dio.httpClientAdapter = dioAdapter;
    httpClientAdapterDio = HttpClientAdapterDio(dio: dio);
  });

  group('- Get Method', () {
    test('- Get Method Success test', () async {
      dioAdapter.onGet(
        '$baseUrl$testPath',
        (request) {
          return request.reply(200, successMessage);
        },
        data: null,
        queryParameters: {},
        headers: header,
      );

      Map<String, dynamic> response =
          await httpClientAdapterDio.get('$baseUrl$testPath');

      expect(response, successMessage);
    });

    test('- Get Method Exception test', () async {
      final dioErrorAdapter = DioError(
        error: {'message': 'Some beautiful error!'},
        requestOptions: RequestOptions(path: '/foo'),
        response: Response(
          statusCode: 500,
          requestOptions: RequestOptions(path: '/foo'),
        ),
        type: DioErrorType.badResponse,
      );

      dioAdapter.onGet(
        '$baseUrl$testPath',
        (request) => request.throws(
          401,
          dioErrorAdapter,
        ),
      );

      expect(() async => await httpClientAdapterDio.get('$baseUrl$testPath'),
          throwsA(isA<Exception>()));
    });
  });
}
