import 'package:business_layer/app/core/rest_client/rest_client.dart';
import 'package:business_layer/app/core/rest_client/rest_client_exception.dart';
import 'package:business_layer/app/core/rest_client/rest_client_response.dart';
import 'package:business_layer/business_layer.dart';
import 'package:dio/dio.dart';

class DioRestClient implements RestClient {
  late final Dio _instance;
  final Environments _environments;

  DioRestClient({
    required Environments environments,
    BaseOptions? options,
  }) : _environments = environments {
    _instance = Dio(options ?? _defaultOptions);
  }

  BaseOptions get _defaultOptions => BaseOptions(
    baseUrl: _environments.getValue('base_url') ?? '',
    connectTimeout: 60000,
    sendTimeout: 60000,
  );

  @override
  Future<RestClientResponse<T>> delete<T>({required String path, data, Map<String, dynamic>? queryParameters, Map<String, dynamic>? headers}) async {
    try{
      final response = await _instance.delete(
        path,
        data: data,
        queryParameters: queryParameters,
        options: Options(
          headers: headers,
        ),
      );

      return _dioResponseConverter<T>(response);
    }
    on DioError catch (e) {
      throw RestClientException(
        error: e.error,
        message: e.response?.statusMessage,
        response: _dioErrorResponseConverter(e.response),
        statusCode: e.response?.statusCode,
      );
    }
  }

  @override
  Future<RestClientResponse<T>> get<T>({required String path, Map<String, dynamic>? headers, Map<String, dynamic>? queryParameters}) async {
    try{
      final response = await _instance.get(
        path,
        queryParameters: queryParameters,
        options: Options(
          headers: headers,
        ),
      );

      return _dioResponseConverter<T>(response);
    }
    on DioError catch (e) {
      throw RestClientException(
        error: e.error,
        message: e.response?.statusMessage,
        response: _dioErrorResponseConverter(e.response),
        statusCode: e.response?.statusCode,
      );
    }
  }

  @override
  Future<RestClientResponse<T>> post<T>({required String path, required data, Map<String, dynamic>? queryParameters, Map<String, dynamic>? headers}) async {
    try{
      final response = await _instance.post(
        path,
        data: data,
        queryParameters: queryParameters,
        options: Options(
          headers: headers,
        ),
      );

      return _dioResponseConverter<T>(response);
    }
    on DioError catch (e) {
      throw RestClientException(
        error: e.error,
        message: e.response?.statusMessage,
        response: _dioErrorResponseConverter(e.response),
        statusCode: e.response?.statusCode,
      );
    }
  }

  @override
  Future<RestClientResponse<T>> put<T>({required String path, required data, Map<String, dynamic>? queryParameters, Map<String, dynamic>? headers}) async {
    try{
      final response = await _instance.put(
        path,
        data: data,
        queryParameters: queryParameters,
        options: Options(
          headers: headers,
        ),
      );

      return _dioResponseConverter<T>(response);
    }
    on DioError catch (e) {
      throw RestClientException(
        error: e.error,
        message: e.response?.statusMessage,
        response: _dioErrorResponseConverter(e.response),
        statusCode: e.response?.statusCode,
      );
    }
  }

  @override
  Future<RestClientResponse<T>> request<T>({required String path, required String method, data, Map<String, dynamic>? queryParameters, Map<String, dynamic>? headers}) async {
    try{
      final response = await _instance.request(
        path,
        data: data,
        queryParameters: queryParameters,
        options: Options(
          headers: headers,
          method: method,
        ),
      );

      return _dioResponseConverter<T>(response);
    }
    on DioError catch (e) {
      throw RestClientException(
        error: e.error,
        message: e.response?.statusMessage,
        response: _dioErrorResponseConverter(e.response),
        statusCode: e.response?.statusCode,
      );
    }
  }

  RestClientResponse<T> _dioResponseConverter<T>(Response response) {
    return RestClientResponse<T>(
      data: response.data,
      statusCode: response.statusCode,
      statusMessage: response.statusMessage,
    );
  }

  RestClientResponse? _dioErrorResponseConverter(Response? response) {
    return RestClientResponse(
      data: response?.data,
      statusCode: response?.statusCode,
      statusMessage: response?.statusMessage,
    );
  }
  
}