import 'package:dio/dio.dart';

/// Configuration for ApiPackage
///
/// This class holds all configuration settings needed to
/// initialize and configure
/// the API client. It provides sensible defaults for timeouts and allows
/// customization
/// of headers and interceptors.
class ApiConfig {
  /// Creates an [ApiConfig] with the provided settings
  ///
  /// [baseUrl] is required. Connection and receive
  /// timeouts default to 30 seconds.
  /// [headers] and [interceptors] default to empty collections.
  const ApiConfig({
    required this.baseUrl,
    this.connectTimeout = const Duration(seconds: 30),
    this.receiveTimeout = const Duration(seconds: 30),
    this.headers = const {},
    this.interceptors = const [],
  });

  /// The base URL for all API requests
  final String baseUrl;

  /// The timeout duration for establishing a connection
  final Duration connectTimeout;

  /// The timeout duration for receiving a response
  final Duration receiveTimeout;

  /// Custom HTTP headers to include in all requests
  final Map<String, dynamic> headers;

  /// List of Dio interceptors for request/response handling
  final List<Interceptor> interceptors;

  /// Creates a copy of this config with optionally replaced values
  ///
  /// Returns a new [ApiConfig] instance with the specified fields replaced,
  /// while keeping all other fields unchanged.
  ApiConfig copyWith({
    String? baseUrl,
    Duration? connectTimeout,
    Duration? receiveTimeout,
    Map<String, dynamic>? headers,
    List<Interceptor>? interceptors,
  }) {
    return ApiConfig(
      baseUrl: baseUrl ?? this.baseUrl,
      connectTimeout: connectTimeout ?? this.connectTimeout,
      receiveTimeout: receiveTimeout ?? this.receiveTimeout,
      headers: headers ?? this.headers,
      interceptors: interceptors ?? this.interceptors,
    );
  }
}
