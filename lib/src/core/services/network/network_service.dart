// ignore_for_file: join_return_with_assignment, overridden_fields

import 'dart:io';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import '../../../core/services/network/response_parser.dart';
import '../../base/error/base_error.dart';
import '../../base/model/base_model.dart';
import '../../exports/constants_exports.dart';
import 'IResponseModel.dart';

class NetworkService with DioMixin {
  static NetworkService? _instance;

  static NetworkService? get instance {
    _instance ??= NetworkService._init();
    return _instance;
  }

  NetworkService._init() {
    interceptors.add(InterceptorsWrapper());
    httpClientAdapter = IOHttpClientAdapter();
  }

  @override
  final BaseOptions options = BaseOptions(
      baseUrl: EndPointConstants.baseUrl,
      headers: {'Content-Type': 'application/json'});

  Future<IResponseModel<R>> send<T, R>(
    String path, {
    required HttpTypes type,
    required BaseModel<T> parseModel,
    dynamic data,
    Map<String, dynamic>? queryParameters,
    void Function(int, int)? onReceiveProgress,
  }) async {
    final response = await request<dynamic>(
      path,
      data: data,
      options: Options(
        method: type.name,
      ),
    );
    switch (response.statusCode) {
      case HttpStatus.ok:
      case HttpStatus.accepted:
        final model = responseParser<T, R>(parseModel, response.data);
        return ResponseModel<R>(data: model);
      default:
        return ResponseModel(
          error: BaseError(response.data),
        );
    }
  }
}
