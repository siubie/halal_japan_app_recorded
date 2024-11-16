import 'package:dio/dio.dart';
import 'package:halal_japan_recorded/core/config/api_config.dart';
import 'package:halal_japan_recorded/core/network/dio_client.dart';

class ApiService {
  final DioClient _dioClient;

  ApiService() : _dioClient = DioClient();

  // // Example API methods
  // Future<Response> login(String email, String password) async {
  //   try {
  //     final response = await _dioClient.post(
  //       ApiConfig.login,
  //       data: {
  //         'email': email,
  //         'password': password,
  //       },
  //     );
  //     return response;
  //   } catch (e) {
  //     rethrow;
  //   }
  // }

  Future<Response> getProducts() async {
    try {
      final response = await _dioClient.get(ApiConfig.products);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
