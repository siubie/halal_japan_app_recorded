import 'package:halal_japan_recorded/core/services/api_service.dart';

class ProductRepository {
  final ApiService _apiService;

  ProductRepository() : _apiService = ApiService();

  // Future<UserModel> login(String email, String password) async {
  //   try {
  //     final response = await _apiService.login(email, password);
  //     return UserModel.fromJson(response.data);
  //   } on DioException catch (e) {
  //     throw AppException.fromDioError(e);
  //   } catch (e) {
  //     throw AppException(message: e.toString());
  //   }
  // }
}
