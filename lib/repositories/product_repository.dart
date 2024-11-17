import 'package:halal_japan_recorded/core/network/exeption/api_exeption.dart';
import 'package:halal_japan_recorded/core/services/api_service.dart';
import 'package:halal_japan_recorded/models/product_response.dart';

class ProductRepository {
  final ApiService _apiService;

  ProductRepository() : _apiService = ApiService();

  Future<ProductResponse> fetchProducts() async {
    return _handleApiCall(() async {
      final response = await _apiService.getProducts();
      return ProductResponse.fromJson(response.data);
    });
  }

  Future<T> _handleApiCall<T>(Future<T> Function() apiCall) async {
    try {
      return await apiCall();
    } on BadRequestException {
      throw Exception('Invalid request');
    } on UnauthorizedException {
      throw Exception('Access denied');
    } on NotFoundException {
      throw Exception('Resource not found');
    } on InternalServerErrorException {
      throw Exception('Internal server error');
    } on NoInternetConnectionException {
      throw Exception('No internet connection');
    } catch (e) {
      throw Exception('Unknown error occurred');
    }
  }
}
