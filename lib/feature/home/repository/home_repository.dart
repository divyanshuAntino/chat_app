import 'package:chatapp/core/api_client/api_client.dart';
import 'package:chatapp/routes/api_routes.dart';

class HomeRepository {
  static final dio = DioUtil();
  Future<dynamic> getUserProfile() async {
    final response = await dio.get(ApiRoutes.getUserProfile);
    return response;
  }
}
