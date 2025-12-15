import 'package:dio/dio.dart';

/// {@template base_api_version}
/// Base class for versioned API clients
/// {@endtemplate}
abstract class BaseApiVersion {
  /// {@macro base_api_version}
  BaseApiVersion({
    required Dio dio,
  }) : _dio = dio;

  final Dio _dio;

  /// Version prefix (e.g., 'v1', 'v2')
  String? get versionPrefix;

  /// Build full path with version prefix
  String buildPath(String endpoint) {
    if (versionPrefix == null || versionPrefix!.isEmpty) {
      return '/api$endpoint';
    }
    return '/api/$versionPrefix$endpoint';
  }

  /// GET request
  Future<Response<T>> get<T>(
    String endpoint, {
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) {
    return _dio.get<T>(
      buildPath(endpoint),
      queryParameters: queryParameters,
      options: options,
    );
  }

  /// POST request
  Future<Response<T>> post<T>(
    String endpoint, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) {
    return _dio.post<T>(
      buildPath(endpoint),
      data: data,
      queryParameters: queryParameters,
      options: options,
    );
  }

  /// PUT request
  Future<Response<T>> put<T>(
    String endpoint, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) {
    return _dio.put<T>(
      buildPath(endpoint),
      data: data,
      queryParameters: queryParameters,
      options: options,
    );
  }

  /// PATCH request
  Future<Response<T>> patch<T>(
    String endpoint, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) {
    return _dio.patch<T>(
      buildPath(endpoint),
      data: data,
      queryParameters: queryParameters,
      options: options,
    );
  }

  /// DELETE request
  Future<Response<T>> delete<T>(
    String endpoint, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) {
    return _dio.delete<T>(
      buildPath(endpoint),
      data: data,
      queryParameters: queryParameters,
      options: options,
    );
  }
}
