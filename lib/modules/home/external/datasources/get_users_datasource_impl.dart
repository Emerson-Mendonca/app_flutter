import 'dart:developer';

import 'package:app_flutter/modules/home/infra/datasources/get_users_datasource.dart';
import 'package:app_flutter/modules/shared/http/http_client.dart';

class GetUsersDataSourceImpl implements GetUsersDataSource {
  GetUsersDataSourceImpl(
    this._httpClientAdapterDio,
  );
  final HttpClientAdapterDio _httpClientAdapterDio;

  @override
  Future<List<Map<String, dynamic>>> getUsers() async {
    final response = await _httpClientAdapterDio.get('/users');
    log('data: $response');
    return List.from(response);
  }
}
