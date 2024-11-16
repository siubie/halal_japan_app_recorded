class ApiConfig {
  static const String baseUrl =
      'https://halaljapan.dosenngoding.com/api'; // Replace with your API URL

  // API Endpoints
  static const String products = '/products';

  // API Timeouts
  static const int connectTimeout = 30000; // 30 seconds
  static const int receiveTimeout = 30000; // 30 seconds

  // API Headers
  static Map<String, String> get headers => {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      };
}
