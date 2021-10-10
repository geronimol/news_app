import 'package:dio/dio.dart';

abstract class HttpService {
  Future<Response> getRequest(String url);
}