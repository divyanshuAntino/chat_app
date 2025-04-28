import 'package:hive/hive.dart';

@HiveType(typeId: 1)
class User extends HiveObject {
  @HiveField(0)
  String uuid = '';
  @HiveField(1)
  String? firstName;
  @HiveField(2)
  String? lastName;
  @HiveField(3)
  String? phoneNumber;
  @HiveField(4)
  String? accessToken;
  @HiveField(5)
  String? refreshToken;
}
