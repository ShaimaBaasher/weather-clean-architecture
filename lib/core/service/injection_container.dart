import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app_clean_arch/home/domain/usecase/clear_weather_data.dart';

import '../../date_selection/cubit/date_selection_cubit.dart';
import '../../home/data/datasource/weather_local_data_source.dart';
import '../../home/data/datasource/weather_remote_data_source.dart';
import '../../home/data/models/hive_opened_status_model.dart';
import '../../home/data/repositories/weather_repository_implementation.dart';
import '../../home/domain/entities/hive_main_class.dart';
import '../../home/domain/entities/hive_opened_status.dart';
import '../../home/domain/repositories/weather_repo.dart';
import '../../home/domain/usecase/get_local_weather.dart';
import '../../home/domain/usecase/get_status_weather.dart';
import '../../home/domain/usecase/get_weather.dart';
import '../../home/domain/usecase/store_status_data.dart';
import '../../home/domain/usecase/store_weather_data.dart';
import '../../home/presentation/bloc/home_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Initialize Hive
  await Hive.initFlutter();
  // Register the adapters
  Hive.registerAdapter(HiveOpenedStatusAdapter());
  Hive.registerAdapter(HiveListElementAdapter());
  // Register all necessary Hive adapters
  Hive.registerAdapter(HiveMainClassAdapter());
  Hive.registerAdapter(HiveWeatherAdapter());
  Hive.registerAdapter(HiveCloudsAdapter());
  Hive.registerAdapter(HiveWindAdapter());
  Hive.registerAdapter(HiveSysAdapter());

  // AppLogic
  sl
    ..registerFactory(() => HomeBloc(
        getWeather: sl(),
        getLocalWeather: sl(),
        storeWeatherData: sl(),
        getStatusWeather: sl(),
        storeStatusData: sl(), clearWeatherData: sl()))
    ..registerLazySingleton(() => DateCubit())
  // UseCases
    ..registerLazySingleton(() => StoreStatusData(sl()))
    ..registerLazySingleton(() => GetStatusWeather(sl()))
    ..registerLazySingleton(() => GetWeather(sl()))
    ..registerLazySingleton(() => GetLocalWeather(sl()))
    ..registerLazySingleton(() => StoreWeatherData(sl()))
    ..registerLazySingleton(() => ClearWeatherData(sl()))
    // Repositories
    ..registerLazySingleton<WeatherRepo>(
        () => WeatherRepositoryImplementation(sl(), sl()))
    // DataSources
    ..registerLazySingleton<WeatherRemoteDataSource>(
        () => WeatherRemoteSourceImpl(sl()))
    ..registerLazySingleton<WeatherLocalDataSource>(
        () => LocalStorageSourceImpl())
    // External Dependencies
    ..registerLazySingleton(http.Client.new);
}
