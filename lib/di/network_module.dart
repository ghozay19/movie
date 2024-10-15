import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:injectable/injectable.dart';

import '../core/constant/api_endpoints.dart';

@module
abstract class NetworkModule {
  @lazySingleton
  Dio get dio => Dio(
        BaseOptions(
          baseUrl: ApiEndpoints.baseURL,
          headers: {
            'Authorization': 'Bearer ${dotenv.env['API_KEY']}',
            'accept': 'application/json',
          },
        ),
      );
}
