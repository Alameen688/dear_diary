import 'package:dear_diary/services/api_service.dart';
import 'package:dear_diary/services/dialog_service.dart';
import 'package:dear_diary/services/entry_service.dart';
import 'package:dear_diary/services/user_service.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerSingleton<ApiService>(ApiService());
  locator.registerLazySingleton(() => EntryService());
  locator.registerLazySingleton(() => UserService());
  locator.registerLazySingleton(() => DialogService());
}
