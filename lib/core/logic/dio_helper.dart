import 'package:dio/dio.dart';

class DioHelper {
  static final _dio = Dio(
    BaseOptions(baseUrl: "https://cosmatics.growfet.com"),
  );

  static Future<CustomResp> getData(
    String path, {
    Map<String, dynamic>? params,
  }) async {
    try {
      final resp = await _dio.get(path, queryParameters: params);
      return CustomResp(
        isSuccess: true,
        data: resp.data,
        statusCode: resp.statusCode,
      );
    } on DioException catch (ex) {
      return CustomResp(
        isSuccess: false,
        data: ex.response?.data,
        statusCode: ex.response?.statusCode,
      );
    }
  }

  static Future<CustomResp> sendData(
    String path, {
    Map<String, dynamic>? data,
  }) async {
    try {
      final resp = await _dio.post(path, data: data);
      return CustomResp(
        isSuccess: true,
        data: resp.data,
        statusCode: resp.statusCode,
      );
    } on DioException catch (ex) {
      return CustomResp(
        isSuccess: false,
        data: ex.response?.data,
        statusCode: ex.response?.statusCode,
      );
    }
  }
}

class CustomResp {
  bool isSuccess;
  dynamic data;
  int? statusCode;

  CustomResp({required this.isSuccess, required this.data, this.statusCode}) {
    print("loay$data");
  }
}
