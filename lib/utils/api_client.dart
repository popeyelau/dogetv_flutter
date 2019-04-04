import 'dart:io';

import 'package:dio/dio.dart';

typedef NetworkError(String errorMsg);
typedef NetworkSuccess(Map<String, dynamic> data);

class APIClient {
  Dio dio;

  factory APIClient() => _getInstance();
  static APIClient get instace => _getInstance();
  static APIClient _instance;

  APIClient._internal() {
    if (dio == null) {
      BaseOptions options = BaseOptions(baseUrl: "https://tv.popeye.vip");
      dio = Dio(options);
    }
  }

  static APIClient _getInstance() {
    if (_instance == null) {
      _instance = APIClient._internal();
    }
    return _instance;
  }

  //get方法返回一个map的future类型
  Future get(String url,
      {Map data,
      Options options,
      CancelToken cancelToken,
      NetworkError onError}) async {
    print("GET:$url");
    return _request(url, "GET",
        data: data,
        options: options,
        cancelToken: cancelToken,
        onError: onError);
  }

  //post方法
  Future post(String url,
      {Map data,
      Options options,
      CancelToken cancelToken,
      NetworkSuccess onSuccess,
      NetworkError onError}) async {
    return _request(url, "POST",
        data: data,
        options: options,
        cancelToken: cancelToken,
        onError: onError);
  }

  Future _request(String url, String type,
      {Map data,
      Options options,
      CancelToken cancelToken,
      NetworkError onError}) async {
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

      print("response:$response");
      print("response:statusCode${response.statusCode}");

      if (response.statusCode != 200) {
        var errorMsg = "网络请求错误，状态码:${response.statusCode}";
        return new Future.error(errorMsg);
      } else {
        return response.data;
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
