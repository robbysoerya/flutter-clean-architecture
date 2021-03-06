import 'package:get_it/get_it.dart';
import 'package:portfolio/src/core/network/api_service.dart';
import 'package:portfolio/src/core/utils/sharedpref.dart';
import 'package:portfolio/src/screens/profile/data/datasources/profile_local_datasource.dart';
import 'package:portfolio/src/screens/profile/data/datasources/profile_remote_local_datasource.dart';
import 'package:portfolio/src/screens/profile/data/repositories/profile_repository_impl.dart';
import 'package:portfolio/src/screens/profile/domain/repositories/profile_repository.dart';
import 'package:portfolio/src/screens/profile/domain/usecases/profile_usecase.dart';
import 'package:portfolio/src/screens/profile/presentation/bloc/profile_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

// Dependency injection
Future<void> init() async {
  sl.registerFactory(() => ProfileBloc(fetchProjects: sl()));

// Use cases
  sl.registerLazySingleton(() => FetchProjects(profileRepository: sl()));

// Repositories
  sl.registerLazySingleton<ProfileRepository>(() => ProfileRepositoryImpl(
      profileLocalDataSource: sl(), profileRemoteDataSource: sl()));

// Data sources
  sl.registerLazySingleton<ProfileLocalDataSource>(
      () => ProfileLocalDataSourceImpl(sharedPreferences: sl()));
  sl.registerLazySingleton<ProfileRemoteDataSource>(
      () => ProfileRemoteDataSourceImpl(apiService: sl()));

// Utils
  sl.registerLazySingleton<SharedPref>(() => SharedPrefImpl(prefs: sl()));

// External
  final SharedPreferences sharedPreferences =
      await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => ApiService());
}
