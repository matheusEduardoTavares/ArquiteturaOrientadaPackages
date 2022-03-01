import 'package:business_layer/app/core/rest_client/rest_client_response.dart';

class RestClientException implements Exception {
  RestClientException({
    required this.error,
    this.statusCode,
    this.message,
    this.response,
  });

  final int? statusCode;
  final String? message;
  final dynamic error;
  final RestClientResponse? response;
}
