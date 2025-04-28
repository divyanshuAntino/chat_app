import 'package:chatapp/core/api_client/api_client.dart';
import 'package:chatapp/routes/api_routes.dart';

class AddRepository {
  static final dio = DioUtil();
  Future<dynamic> getAllUser() async {
    final response = await dio.get(ApiRoutes.getAllUser);
    return response;
  }
}
