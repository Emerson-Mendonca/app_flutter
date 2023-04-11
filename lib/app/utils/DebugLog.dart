import 'package:dog/dog.dart';
import 'package:get/get.dart';

class DebugLog {
  void d(Response<dynamic>? response) {
    dog.i({
      'Request': {
        'Headers': response!.request?.headers.toString(),
        'Response': response.request!.bodyBytes.toString()
      },
      'Response': {
        'Headers': response.headers.toString(),
        'Response': response.body.toString(),
      }
    },
        tag: 'HTTP Status: ' +
            response.statusCode.toString() +
            ' Method: ' +
            response.request!.method.toString().toUpperCase(),
        title: response.request!.url.toString());
  }

  void v(String url) {
    dog.d(url);
  }

  void error(Response<dynamic>? response) {
    dog.e({
      'Request': {
        'Headers': response!.request?.headers.toString(),
        'Response': response.request!.bodyBytes.toString()
      },
      'Response': {
        'Headers': response.headers.toString(),
        'Response': response.body.toString(),
      }
    },
        tag: 'HTTP Status: ' +
            response.statusCode.toString() +
            ' Method: ' +
            response.request!.method.toString().toUpperCase(),
        title: response.request!.url.toString());
  }
}
