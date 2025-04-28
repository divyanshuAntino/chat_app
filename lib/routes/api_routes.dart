abstract class ApiRoutes {
  static const ngRok = 'http://127.0.0.1:8000';
  static const devURL = '';

  static final baseURL = ngRok;
  static final mainUrl = '$baseURL/api/user';
  static final createUser = '$mainUrl/createUser';
  static final loginUser = '$mainUrl/login';
  static final getAllUser = '$mainUrl/get-user';
  static final getUserProfile = '$mainUrl/user-profile';
}
