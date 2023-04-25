import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:http/io_client.dart';
import 'package:http_parser/http_parser.dart' as mime;

import '../../extensions/file_extention.dart';
import '../../flavors.dart' as flavors;
import '../../utils/console_output.dart';
import '../error_handler.dart';
import '../models/app_exceptions.dart';
import '../models/error_response.dart';

typedef RetryFunction = Future<dynamic> Function();

class ApiClient {
  ApiClient(
    this.errorHandler,
  );

  final ErrorHandler errorHandler;

  Future<dynamic> post({
    required String url,
    Object? bodyData,
    Map<String, String>? params,
    Map<String, String>? headers,
    Duration? timeout,
  }) async {
    var responseJson;
    final dio = await _getDioClient(
      requestType: RequestType.post,
      queryParameters: params ?? {},
      headers: headers,
      timeout: timeout,
    );
    retry() async {
      return await post(
        url: url,
        bodyData: bodyData,
        params: params,
        headers: headers,
      );
    }

    ;
    try {
      final body = jsonEncode(bodyData);
      log('ApiBaseHelper').d('POST: ${dio.options.baseUrl}$url BODY: $body HEADERS: ${dio.options.headers}');
      final response = await dio.post('$url', data: body);
      responseJson = await _returnDioResponse(
        response,
        retry: retry,
      );
    } catch (e) {
      responseJson = await _handleError(
        e,
        'POST: ${dio.options.baseUrl}$url BODY: $bodyData HEADERS: ${dio.options.headers}',
        retry: retry,
      );
    }
    return responseJson;
  }

  Future<dynamic> patch({
    required String url,
    Object? bodyData,
    Map<String, String>? params,
    Map<String, String>? headers,
  }) async {
    var responseJson;
    final dio = await _getDioClient(
      requestType: RequestType.patch,
      queryParameters: params ?? {},
      headers: headers,
    );
    retry() async {
      return await patch(
        url: url,
        bodyData: bodyData,
        params: params,
        headers: headers,
      );
    }

    ;
    try {
      final body = jsonEncode(bodyData);
      log('ApiBaseHelper').d('PATCH: ${dio.options.baseUrl}$url BODY: $body HEADERS: ${dio.options.headers}');
      final response = await dio.patch('$url', data: body);
      responseJson = await _returnDioResponse(
        response,
        retry: retry,
      );
    } catch (e) {
      responseJson = await _handleError(
        e,
        'PATCH: ${dio.options.baseUrl}$url BODY: $bodyData HEADERS: ${dio.options.headers}',
        retry: retry,
      );
    }
    return responseJson;
  }

  Future<dynamic> delete({
    required String url,
    Object? bodyData,
    Map<String, String>? headers,
  }) async {
    var responseJson;
    final dio = await _getDioClient(
      requestType: RequestType.post,
      queryParameters: {},
      headers: headers,
    );
    retry() async {
      return await delete(
        url: url,
        bodyData: bodyData,
        headers: headers,
      );
    }

    try {
      final body = jsonEncode(bodyData);
      log('ApiBaseHelper').d('DELETE: ${dio.options.baseUrl}$url BODY: $body HEADERS: ${dio.options.headers}');
      final response = await dio.delete('$url', data: body);
      responseJson = await _returnDioResponse(
        response,
        retry: retry,
      );
    } catch (e) {
      responseJson = await _handleError(
        e,
        'DELETE: ${dio.options.baseUrl}$url BODY: $bodyData HEADERS: ${dio.options.headers}',
        retry: retry,
      );
    }
    return responseJson;
  }

  Future<dynamic> get({
    required String url,
    Map<String, String>? headers,
    Map<String, String>? params,
    Duration? timeout,
  }) async {
    var responseJson;
    final dio = await _getDioClient(
      requestType: RequestType.get,
      queryParameters: params ?? {},
      headers: headers,
      timeout: timeout,
    );
    retry() async {
      return await get(
        url: url,
        params: params,
        headers: headers,
      );
    }

    try {
      log('ApiBaseHelper')
          .d('GET: ${dio.options.baseUrl}$url${dio.options.queryParameters} HEADERS: ${dio.options.headers}');
      final response = await dio.get(url);
      responseJson = await _returnDioResponse(
        response,
        retry: retry,
      );
    } catch (e) {
      responseJson = await _handleError(
        e,
        'GET: ${dio.options.baseUrl}$url${dio.options.queryParameters} HEADERS: ${dio.options.headers}',
        retry: retry,
      );
    }
    return responseJson;
  }

  Future<dynamic> multipartRequest({
    required String url,
    required File file,
    required String fileAccessToken,
  }) async {
    var responseJson;
    retry() async {
      return await multipartRequest(
        url: url,
        file: file,
        fileAccessToken: fileAccessToken,
      );
    }

    try {
      final formData = FormData.fromMap(
        {
          'file': await MultipartFile.fromFile(
            file.path,
            filename: file.name,
            contentType: mime.MediaType(
              'image',
              'jpg',
            ),
          ),
        },
      );
      final dio = await _getDioClient(
        requestType: RequestType.multiPart,
        queryParameters: {},
        headers: {'x-file-access-token': fileAccessToken},
      );
      log('ApiBaseHelper').d('MULTIPART POST: ${dio.options.baseUrl}$url HEADERS: ${dio.options.headers}');
      final response = await dio.post('$url', data: formData);
      responseJson = await _returnDioResponse(
        response,
        retry: retry,
      );
    } catch (error) {
      responseJson = await _handleError(
        error,
        url,
        retry: retry,
      );
    }
    return responseJson;
  }

  Future<dynamic> _returnDioResponse(
    Response response, {
    required RetryFunction retry,
  }) async {
    log('ApiBaseHelper').d(
      'STATUS_CODE: ${response.statusCode} '
      'RESPONSE: ${response.data}, '
      'HEADERS: ${response.headers} '
      'URI: ${response.realUri.toString()}',
    );
    switch (response.statusCode) {
      case 200:
        return response.data;
      case 206:
        errorHandler.handleError(
          response,
          errorHandlerMessage: 'ApiBaseHelper',
        );
        return response.data;
      case 201:
      case 204:
      case 304:
        if (response.data.isNotEmpty) {
          return response.data;
        } else {
          return true;
        }
      case 400:
      case 401:
      case 403:
        var responseJson = response.data;
        final errorResponse = ErrorResponse.fromJson(responseJson);
        throw AppException(
          errorResponse?.rebuild(
            (p0) => p0..url = response.realUri.toString(),
          ),
        );
      case 500:
      default:
        var responseJson = response.data;
        final errorResponse = ErrorResponse.fromJson(responseJson);
        throw AppException(
          errorResponse?.rebuild(
            (p0) => p0..url = response.realUri.toString(),
          ),
        );
    }
  }

  String get _connectionErrorMessage => 'Either there is an issue with the Internet connection, '
      'or the server is sleeping please try again later...';

  Future<dynamic> _handleError(
    Object error,
    String urlCalled, {
    required RetryFunction retry,
  }) async {
    log('ApiBaseHelper').e('ERROR $error URL $urlCalled');
    errorHandler.handleError(error, errorHandlerMessage: 'ApiBaseHelper');
    if (error is DioError) {
      switch (error.type) {
        case DioErrorType.cancel:
          throw _buildAppException(
            'Request to API server was cancelled.',
            statusCode: 502,
            url: urlCalled,
          );
        case DioErrorType.sendTimeout:
        case DioErrorType.connectTimeout:
        case DioErrorType.receiveTimeout:
        case DioErrorType.other:
          throw _buildAppException(
            '$_connectionErrorMessage',
            statusCode: 503,
            url: urlCalled,
          );
        case DioErrorType.response:
          throw _buildAppException(
            '${error.response?.data.toString()}',
            statusCode: error.response?.statusCode,
            url: urlCalled,
          );
      }
    } else {
      throw _buildAppException(
        'Unexpected error occurred.',
        statusCode: 1001,
        url: urlCalled,
      );
    }
  }

  AppException _buildAppException(
    String message, {
    int? statusCode,
    String? url,
  }) {
    return AppException(
      ErrorResponse(
        (b) => b
          ..message = message
          ..statusCode = statusCode ?? 1001
          ..url = url,
      ),
    );
  }

  IOClient getClient() {
    final proxy = Platform.isAndroid ? '192.168.0.103:9090' : 'localhost:8888';
    final httpClient = HttpClient();
    httpClient.findProxy = (uri) {
      return 'PROXY $proxy;';
    };
    httpClient.badCertificateCallback = ((cert, host, port) => Platform.isAndroid);

    return IOClient(httpClient);
  }

  Future<Dio> _getDioClient({
    Map<String, String>? headers,
    required Map<String, String> queryParameters,
    required RequestType requestType,
    Duration? timeout,
  }) async {
    final dio = Dio();
    dio.options.validateStatus = (status) {
      if (status == null) return false;
      return status >= 200 && status < 300 || status == 304;
    };
    dio.options.baseUrl = flavors.F.newsBaseUrl;
    dio.options.contentType = _getContentType(requestType);
    dio.options.queryParameters = queryParameters;
    dio.options.receiveTimeout = timeout?.inMilliseconds ?? const Duration(minutes: 1).inMilliseconds;
    dio.options.sendTimeout = timeout?.inMilliseconds ?? const Duration(minutes: 1).inMilliseconds;
    dio.options.connectTimeout = timeout?.inMilliseconds ?? const Duration(minutes: 1).inMilliseconds;
    dio.options.headers = {
      'Accept': 'application/json, text/plain, */*',
      if (headers != null) ...headers,
    };
    return dio;
  }

  String _getContentType(RequestType requestType) {
    switch (requestType) {
      case RequestType.get:
        return 'application/json';
      case RequestType.post:
        return 'application/json';
      case RequestType.put:
        return 'application/json';
      case RequestType.patch:
        return 'application/merge-patch+json';
      case RequestType.multiPart:
        return 'multipart/form-data';
    }
  }
}

enum RequestType { get, post, patch, put, multiPart }
