import 'package:dio/dio.dart';
import 'package:halal_japan_recorded/core/config/api_config.dart';
import 'package:halal_japan_recorded/core/network/dio_client.dart';

class ApiService {
  final DioClient _dioClient;

  ApiService() : _dioClient = DioClient();

  Future<Response> getProducts() async {
    try {
      final response = await _dioClient.get(ApiConfig.products);
      return response;
    } on DioException catch (e) {
      // Handle Dio-specific exceptions if needed
      rethrow;
    } catch (e) {
      // Handle other exceptions
      throw Exception('Unknown error occurred');
    }
  }
}
