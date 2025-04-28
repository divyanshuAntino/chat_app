import 'dart:developer';

import 'package:chatapp/core/api_client/api_result.dart';
import 'package:chatapp/core/api_client/retry_on_connection_change_interceptor.dart';
import 'package:chatapp/routes/app_routes.dart';
import 'package:chatapp/routes/routes.dart';
import 'package:chatapp/utils/storage_utils.dart';
import 'package:dio/dio.dart';

import 'api_exception.dart';
import 'header_interceptor.dart';

typedef JsonMap = Map<String, dynamic>;

enum ApiStatus {
  int,
  loading,
  success,
  failed,
}

extension ApiStatusExtension on ApiStatus {
  bool get isLoading {
    return this == ApiStatus.loading;
  }
}

class DioUtil {
  static final DioUtil _instance = DioUtil.internal();
  static late Dio _dio;
  static ApiResult apiResult = ApiResult();

  DioUtil.internal() {
    final authInterceptor = AuthInterceptor();
    final retryInterceptor = RetryOnConnectionChangeInterceptor(
      interceptors: [
        authInterceptor,
      ],
    );
    _dio = Dio()
      ..interceptors.add(authInterceptor)
      ..interceptors.add(retryInterceptor)
      ..interceptors.add(
        LogInterceptor(
          responseBody: true,
          logPrint: _log,
          requestBody: true,
        ),
      );
  }

  factory DioUtil() => _instance;

  final CancelToken _cancelToken = CancelToken();

  Future get(
    url, {
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParams,
  }) async {
    try {
      url = url;
      Response response = await _dio.get(
        url,
        queryParameters: queryParams,
        options: Options(headers: headers),
        cancelToken: _cancelToken,
      );
      return response.data;
    } catch (error) {
      return _handleError(url, error);
    }
  }

  Future<dynamic> post(
    url, {
    JsonMap? body,
    FormData? formData,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParams,
    Function(int, int)? onSendProgres,
  }) async {
    try {
      url = url;
      Response response = await _dio.post(
        url,
        data: formData ?? body,
        queryParameters: queryParams,
        options: Options(headers: headers),
        cancelToken: _cancelToken,
        onSendProgress: onSendProgres,
      );
      return response.data;
    } catch (error) {
      return _handleError(url, error);
    }
  }

  Future update(
    String url, {
    JsonMap? body,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParams,
  }) async {
    try {
      url = url;
      Response response = await _dio.put(
        url,
        data: body,
        queryParameters: queryParams,
        options: Options(headers: headers),
        cancelToken: _cancelToken,
      );
      return response.data;
    } catch (error) {
      return _handleError(url, error);
    }
  }

  Future delete(
    String url, {
    JsonMap? body,
    Map<String, dynamic>? header,
  }) async {
    try {
      url = url;
      Response response = await _dio.delete(
        url,
        data: body,
        options: Options(headers: header),
        cancelToken: _cancelToken,
      );
      return response.data;
    } catch (error) {
      return _handleError(url, error);
    }
  }

  // Future uploadMediaRequest(
  //   String url, {
  //   required String filePath,
  //   Map<String, dynamic>? queryParam,
  //   Function(int, int)? onSendProgres,
  // }) async {
  //   Map<String, dynamic> headerWithToken = {
  //     'accept': 'application/json',
  //     'Content-Type': 'application/json',
  //   };
  //   // FormData formData = FormData();
  //   // for (var element in imagePath) {
  //   //   log('elemen  $element');
  //   //   final filename = element.split('/').last.split('.').first;
  //   //   formData.files.add(MapEntry(
  //   //       'image',
  //   //       await MultipartFile.fromFile(
  //   //         element,
  //   //         filename: filename,
  //   //       )));
  //   // }
  //
  //   final mimeTypeData = lookupMimeType(filePath)?.split('/');
  //   final fileSize = App.services.fileService
  //       .getFileSizeFromByte(bytes: File(filePath).lengthSync());
  //   FormData formData = FormData.fromMap({
  //     'file': await MultipartFile.fromFile(
  //       filePath,
  //       filename: filePath.split('/').last.split('.').first,
  //       contentType:
  //           MediaType(mimeTypeData?[0] ?? '', filePath.split('.').last),
  //     ),
  //     'mime_type': MediaType(mimeTypeData?[0] ?? '', filePath.split('.').last),
  //     'file_size': fileSize,
  //     // 'type': type,
  //   });
  //   log('form data$formData');
  //
  //   try {
  //     url = url;
  //     Response response = await _dio.post(
  //       url,
  //       data: formData,
  //       options: Options(headers: headerWithToken),
  //       cancelToken: _cancelToken,
  //       queryParameters: queryParam,
  //       onSendProgress: onSendProgres,
  //     );
  //     return response.data;
  //   } catch (error) {
  //     return _handleError(url, error);
  //   }
  // }

  Future<Map<String, dynamic>> _handleError(String path, Object error) {
    if (error is DioException) {
      final method = error.requestOptions.method;
      final response = error.response;

      apiResult.setStatusCode(response?.statusCode);
      final data = response?.data;
      int? statusCode = response?.statusCode;
      if (statusCode == 403) {
        SecureStorage.instance.deleteAll();
        AppRoutes.appRouter.pushReplacement(Routes.auth);
      }
      String? errorMessage;
      try {
        errorMessage = data['message'] ?? '';
        if ((errorMessage ?? '').isEmpty) {
          errorMessage = data['error'];
        }
      } catch (e) {
        errorMessage = 'Something went wrong';
      }

      throw ApiException(
        errorMessage: errorMessage,
        path: path,
        info: 'received server error $statusCode while $method data',
        response: data,
        statusCode: statusCode,
        method: method,
      );
    } else {
      int errorCode = 0; //We will send a default error code as 0

      throw ApiException(
        path: path,
        info: 'received server error $errorCode',
        response: error.toString(),
        statusCode: errorCode,
        method: '',
      );
    }
  }

  void _log(Object object) {
    log('$object');
  }

  Future download(String url,
      {required String path,
      void Function(int, int)? onReceiveProgress}) async {
    try {
      await Dio().download(
        url,
        path,
        onReceiveProgress: onReceiveProgress,
        cancelToken: _cancelToken,
        options: Options(followRedirects: false),
      );
    } catch (error) {
      return _handleError(url, error);
    }
  }

  Future<dynamic> put(
    url, {
    JsonMap? body,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParams,
  }) async {
    try {
      url = url;
      Response response = await _dio.put(
        url,
        data: body,
        queryParameters: queryParams,
        options: Options(headers: headers),
        cancelToken: _cancelToken,
      );
      return response.data;
    } catch (error) {
      return _handleError(url, error);
    }
  }

  Future<dynamic> patch(
    url, {
    JsonMap? body,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParams,
  }) async {
    try {
      url = url;
      Response response = await _dio.patch(
        url,
        data: body,
        queryParameters: queryParams,
        options: Options(headers: headers),
        cancelToken: _cancelToken,
      );
      return response.data;
    } catch (error) {
      return _handleError(url, error);
    }
  }
}
