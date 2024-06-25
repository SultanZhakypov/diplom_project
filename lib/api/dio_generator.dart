import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class DioSettings {
  DioSettings() {
    setup();
  }
  Dio dio = Dio(
    BaseOptions(
      baseUrl: 'https://diplom-4585-default-rtdb.firebaseio.com/',
      contentType: 'application/json',
      connectTimeout: const Duration(seconds: 45),
      receiveTimeout: const Duration(seconds: 45),
      headers: {
        'Accept': 'application/json',
        'auth': 'AIzaSyCRzDpbb01R5k1gucmq81a4zIA3uQEVjLo',
      },
    ),
  );

  void setup() {
    final interceptors = dio.interceptors;

    interceptors.clear();

    final logInterceptor = LogInterceptor(
      request: true,
      requestBody: true,
      requestHeader: true,
      responseBody: true,
      responseHeader: true,
    );

    final headerInterceptors = QueuedInterceptorsWrapper(
      onRequest: (options, handler) {
        return handler.next(options);
      },
      onError: (DioException err, handler) {
        handler.next(err);
      },
      onResponse: (response, handler) {
        return handler.next(response);
      },
    );

    interceptors.addAll([if (kDebugMode) logInterceptor, headerInterceptors]);
  }
}
