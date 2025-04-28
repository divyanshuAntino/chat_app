import 'package:chatapp/core/api_client/api_client.dart';
import 'package:chatapp/routes/api_routes.dart';

class AuthRepository {
  static final dioUtil = DioUtil();

  Future<dynamic> createUser(
      {required String email,
      required String password,
      required String name}) async {
    final body = {
      "userEmail": email,
      "userPassword": password,
      "Name": name,
    };
    final response = await dioUtil.post(ApiRoutes.createUser, body: body);
    return response;
  }

  Future<dynamic> loginUser({
    required String email,
    required String password,
  }) async {
    final body = {
      "userEmail": email,
      "userPassword": password,
    };
    final response = await dioUtil.post(ApiRoutes.loginUser, body: body);
    return response;
  }
}
