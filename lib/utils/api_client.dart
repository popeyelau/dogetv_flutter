import 'dart:io';
import 'package:dio/dio.dart';

class APIClient {
  Dio dio;

  factory APIClient() => _getInstance();
  static APIClient get instace => _getInstance();
  static APIClient _instance;

  APIClient._internal() {
    if (dio == null) {
      BaseOptions options = BaseOptions(baseUrl: "https://tv.popeye.vip");
      dio = Dio(options);
      dio = Dio(BaseOptions(
        baseUrl: "https://tv.popeye.vip",
        connectTimeout: 10000,
        receiveTimeout: 10000,
      ));
      dio.interceptors
          .add(InterceptorsWrapper(onRequest: (RequestOptions options) {
        print("\n================== 请求数据 ==========================");
        print("url = ${options.uri.toString()}");
        print("headers = ${options.headers}");
        print("params = ${options.data}");
      }, onResponse: (Response response) {
        print("\n================== 响应数据 ==========================");
        print("code = ${response.statusCode}");
        print("data = ${response.data}");
        print("\n");
      }, onError: (DioError e) {
        print("\n================== 错误响应数据 ======================");
        print("type = ${e.type}");
        print("message = ${e.message}");
        print("stackTrace = ${e.stackTrace}");
        print("\n");
      }));
    }
  }

  static APIClient _getInstance() {
    if (_instance == null) {
      _instance = APIClient._internal();
    }
    return _instance;
  }

  Future get(String url,
      {Map data, Options options, CancelToken cancelToken}) async {
    return _request(url, "GET",
        data: data, options: options, cancelToken: cancelToken);
  }

  //post方法
  Future post(String url,
      {Map data, Options options, CancelToken cancelToken}) async {
    return _request(url, "POST",
        data: data, options: options, cancelToken: cancelToken);
  }

  Future _request(String url, String type,
      {Map data, Options options, CancelToken cancelToken}) async {
    try {
      Response response;
      if (type == "GET") {
        response = await dio.get(url,
            queryParameters: data, options: options, cancelToken: cancelToken);
      } else if (type == "POST") {
        if (options == null) {
          options = Options()
            ..contentType =
                ContentType.parse("application/x-www-form-urlencoded");
        }
        response = await dio.post(url, data: data, options: options);
      }

      if (response.statusCode != 200) {
        var errorMsg = "网络请求错误，状态码:${response.statusCode}";
        return new Future.error(errorMsg);
      } else {
        return response.data;
      }
    } catch (e) {
      return new Future.error(e.toString());
    }
  }
}
