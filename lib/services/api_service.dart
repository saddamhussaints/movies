// dio_service.dart
import 'package:dio/dio.dart';
import 'package:my_movies/constants/utils.dart';

class ApiService {
  static final Dio _dio = Dio(BaseOptions(
    baseUrl: '${baseUrl}',
    connectTimeout: Duration(seconds: 5000),
    receiveTimeout: Duration(seconds: 3000),
  ));

  // Configure Dio with interceptors
  static Dio get dio {
    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        options.headers['Authorization'] = 'Bearer ${Token}';
        return handler.next(options);
      },
      onResponse: (response, handler) {
        return handler.next(response);
      },
      onError: (DioError e, handler) {
        return handler.next(e);
      },
    ));
    return _dio;
  }
}
