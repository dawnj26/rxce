import 'package:api_package/src/config/api_config.dart';
import 'package:api_package/src/versions/api_v1.dart';
import 'package:dio/dio.dart';

/// {@template api_package}
/// API Client Package
/// {@endtemplate}
class ApiPackage {
  /// Private constructor
  ApiPackage._internal(ApiConfig config) {
    _dio = Dio(
      BaseOptions(
        baseUrl: config.baseUrl,
        connectTimeout: config.connectTimeout,
        receiveTimeout: config.receiveTimeout,
        headers: config.headers,
      ),
    );

    // Add interceptors
    config.interceptors.forEach(_dio.interceptors.add);

    // Initialize versioned clients
    v1 = ApiV1(_dio);
  }
  static ApiPackage? _instance;

  /// API v1 client
  late final ApiV1 v1;
  late final Dio _dio;

  /// Initialize the singleton instance
  static void initialize(ApiConfig config) {
    if (_instance != null) {
      throw StateError('ApiPackage has already been initialized');
    }
    _instance = ApiPackage._internal(config);
  }

  /// Get the singleton instance
  static ApiPackage get instance {
    if (_instance == null) {
      throw StateError(
        'ApiPackage has not been initialized. Call initialize() first.',
      );
    }
    return _instance!;
  }

  /// Check if instance is initialized
  static bool get isInitialized => _instance != null;

  /// Access the raw Dio instance if needed
  Dio get dio => _dio;

  /// Reset instance (useful for testing)
  static void reset() {
    _instance?._dio.close();
    _instance = null;
  }
}
