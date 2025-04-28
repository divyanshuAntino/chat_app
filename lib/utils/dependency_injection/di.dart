import 'package:chatapp/service/hive/hive.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.I;
void setupLocator() {
  locator.registerSingleton<HiveBoxService>(HiveBoxService());
}
