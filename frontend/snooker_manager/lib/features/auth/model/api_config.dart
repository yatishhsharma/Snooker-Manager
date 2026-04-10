class ApiConfig {
  static const String baseUrl = String.fromEnvironment(
    'API_URL',
    defaultValue: 'http://0.0.0.0:8000', // your local IP
  );
}
