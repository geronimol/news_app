import 'package:dio/dio.dart';
import 'package:news_app/constants.dart';
import 'package:news_app/services/http_service.dart';

class HttpServiceImpl implements HttpService{
  late Dio _dio;

  HttpServiceImpl() {
    _dio = Dio(BaseOptions(
        baseUrl: kBaseUrl,
        headers: {
          'Authorization' : 'Bearer $kApiKey',
        }
    ));

    initializeInterceptors();
  }

  initializeInterceptors() {
    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        print('REQUEST[${options.method}] => PATH: ${options.path}');
        return handler.next(options);
      },
      onResponse: (response, handler) {
        print('RESPONSE[${response.statusCode}] ${response.statusMessage} ${response.data}');
        return handler.next(response);
      },
      onError: (error, handler) {
        print(error.message);
        return handler.next(error);
      },
    ));
  }

  @override
  Future<Response> getRequest(String url) async {
    Response response;

    try {
      response = await _dio.get(url);
    } on DioError catch (e) {
      print(e.message);
      throw Exception(e.message);
    }

    return response;
  }

}