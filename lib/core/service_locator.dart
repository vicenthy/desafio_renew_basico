import 'package:get_it/get_it.dart';
import 'package:ryc_desafio_do_modulo_basico/actions/home.actions.dart';
import 'package:ryc_desafio_do_modulo_basico/core/repository/reward.repository.dart';
import 'package:ryc_desafio_do_modulo_basico/core/repository/task.repository.dart';
import 'package:ryc_desafio_do_modulo_basico/core/repository/user.repository.dart';
import 'package:ryc_desafio_do_modulo_basico/core/service/storage.service.dart';
import 'package:shared_preferences/shared_preferences.dart';
final getIt = GetIt.instance;


Future<void> setup() async {
  getIt.registerSingletonAsync<SharedPreferences>( () => SharedPreferences.getInstance());
  getIt.registerLazySingleton<StorageService>( () => StorageService());
  getIt.registerLazySingleton<RewardRepository>( () => RewardRepository());
  getIt.registerLazySingleton<UserRepository>( () => UserRepository());
  getIt.registerLazySingleton<TaskRepository>( () => TaskRepository());
  getIt.registerLazySingleton<HomeActions>(() => HomeActions());

}