import 'package:business_layer/app/core/rest_client/rest_client_response.dart';

abstract class RestClient {
  Future<RestClientResponse<T>> post<T>({
      required String path,
      required dynamic data,
      Map<String, dynamic>? queryParameters,
      Map<String, dynamic>? headers,
    }
  );

  Future<RestClientResponse<T>> get<T>({
    required String path,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParameters,
  });

  Future<RestClientResponse<T>> put<T>({
      required String path,
      required dynamic data,
      Map<String, dynamic>? queryParameters,
      Map<String, dynamic>? headers,
    }
  );

  Future<RestClientResponse<T>> delete<T>({
      required String path,
      dynamic data,
      Map<String, dynamic>? queryParameters,
      Map<String, dynamic>? headers,
    }
  );

  Future<RestClientResponse<T>> request<T>({
      required String path,
      required String method,
      dynamic data,
      Map<String, dynamic>? queryParameters,
      Map<String, dynamic>? headers,
    }
  );
}