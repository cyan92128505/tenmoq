import 'dart:async';
import 'dart:io';
import 'package:dio/dio.dart';

class WebClient {
  static String _accessToken;
  static Dio _dio = Dio(BaseOptions(
    connectTimeout: 5000,
    receiveTimeout: 5000,
    headers: {
      HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8',
    },
  ));

  Dio get dio {
    return _dio;
  }

  static void setToken(String accessToken) {
    _accessToken = accessToken;
    _dio.options.headers.addAll({
      'Authorization': 'Bearer $_accessToken',
    });
  }

  static void lock() {
    _dio.lock();
    _dio.interceptors.responseLock.lock();
    _dio.interceptors.errorLock.lock();
  }

  static void unlock() {
    _dio.unlock();
    _dio.interceptors.responseLock.unlock();
    _dio.interceptors.errorLock.unlock();
  }

  static void registerInterceptors(
      void Function(Completer completer) dispatchAccountAccessToken) {
    _dio.interceptors.add(InterceptorsWrapper(
      onError: (DioError error) async {
        if (error.response?.statusCode == 302) {
          return await process302(
            error: error,
            dispatchAccountAccessToken: dispatchAccountAccessToken,
          );
        }

        if (error.response?.statusCode == 401) {
          return await process401(
            error: error,
            dispatchAccountAccessToken: dispatchAccountAccessToken,
          );
        }

        return error;
      },
    ));
    _dio.interceptors.add(LogInterceptor());
  }

  const WebClient();

  static Future<dynamic> process401({
    DioError error,
    void Function(Completer completer) dispatchAccountAccessToken,
  }) async {
    RequestOptions options = error.response.request;
    int retryCounter = int.parse(options.headers['X-Retry'] ?? '0');
    print(' ========== X-Retry: $retryCounter ========== ');
    options.headers['X-Retry'] = (retryCounter + 1).toString();

    if (retryCounter > 3) {
      return error;
    }

    lock();

    final Completer<Null> completer = Completer<Null>();
    dispatchAccountAccessToken(completer);
    return await completer.future.then((_) {
      options.headers['Authorization'] = 'Bearer $_accessToken';

      unlock();
      // repeat
      return _dio.request(options.path, options: options);
    });
  }

  static Future<dynamic> process302({
    DioError error,
    void Function(Completer completer) dispatchAccountAccessToken,
  }) async {
    RequestOptions options = error.response.request;
    String _path = error.response.headers['location'][0];
    String cookies = '${error.response.headers['cookie'].toList().join(';')};';
    String setCookies =
        '${error.response.headers['set-cookie'].toList().join(';')};';

    options.headers.addAll({
      'cookie': '$cookies$setCookies;',
    });

    if (options.data != null) {
      return _dio.request(_path, data: options.data, options: options);
    }

    return _dio.request(_path, options: options);
  }

  Future<dynamic> get(String url) async {
    Response response = await _dio.get(
      url,
      options: Options(followRedirects: false),
    );
    return response.data;
  }

  Future<dynamic> post(String url, dynamic params) async {
    Response response = await _dio.post(
      url,
      data: params,
      options: Options(followRedirects: false),
    );
    return response.data;
  }

  Future<dynamic> postWithoutToken(String url, dynamic params) async {
    Dio _instance = Dio(BaseOptions(
      connectTimeout: 5000,
      receiveTimeout: 5000,
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8',
      },
    ));

    Response response = await _instance.post(url, data: params);
    return response.data;
  }

  static String prepareErrorMessage(dynamic error) {
    String _message;
    if (error is DioError) {
      _message = error.type.toString();
    } else if (error is Iterable<dynamic>) {
      _message = error.map((e) => e.message).toList().join('\n');
    } else if (error is String) {
      _message = error;
    }

    return _message;
  }
}
