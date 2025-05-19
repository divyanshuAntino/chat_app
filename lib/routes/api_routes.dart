import 'dart:io';

abstract class ApiRoutes {
  static final ngRok =
      // Platform.isAndroid ? 'http://10.0.2.2:8000' :
      'http://127.0.0.1:8000';
  static const devURL = '';

  static final baseURL = ngRok;
  static final mainUrl = '$baseURL/api/user';
  static final createUser = '$mainUrl/createUser';
  static final loginUser = '$mainUrl/login';
  static final getAllUser = '$mainUrl/get-user';
  static final getUserProfile = '$mainUrl/user-profile';
}
