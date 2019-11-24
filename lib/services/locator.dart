import 'package:dear_diary/services/api_client.dart';
import 'package:dear_diary/services/diary_service.dart';
import 'package:dear_diary/services/user_service.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

Future<void> setupLocator() async {
  final apiClient = await apiClientSetup();

  locator.registerLazySingleton(() => DiaryService(apiClient));
  locator.registerLazySingleton(() => UserService(apiClient));
}
