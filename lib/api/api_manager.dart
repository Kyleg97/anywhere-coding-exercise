import 'dart:developer';
import 'package:dio/dio.dart';

class ApiManager {
  static final ApiManager _singleton = ApiManager.internal();

  factory ApiManager() {
    return _singleton;
  }

  ApiManager.internal();

  final BaseOptions options = BaseOptions(
    sendTimeout: const Duration(seconds: 10),
    connectTimeout: const Duration(seconds: 10),
  );

  late Dio _dio;

  static bool _init = false;
  Future init() async {
    if (_init) return;
    log("Initializing api manager...");
    _dio = Dio(options); //..interceptors.add(ErrorInterceptor());
    _init = true;
    return _dio;
  }

  Dio get dio => _dio;
}
