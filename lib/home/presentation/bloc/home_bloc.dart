import 'dart:async';

import 'package:bloc/bloc.dart';

import '../../data/models/hive_opened_status_model.dart';
import '../../domain/entities/hive_opened_status.dart';
import '../../domain/usecase/clear_weather_data.dart';
import '../../domain/usecase/get_local_weather.dart';
import '../../domain/usecase/get_status_weather.dart';
import '../../domain/usecase/get_weather.dart';
import '../../domain/usecase/store_status_data.dart';
import '../../domain/usecase/store_weather_data.dart';
import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetWeather _getWeather;
  final GetLocalWeather _getLocalWeather;
  final StoreWeatherData _storeWeatherData;
  final GetStatusWeather _getStatusWeather;
  final StoreStatusData _storeStatusData;
  final ClearWeatherData _clearWeatherData;

  HomeBloc({
    required GetWeather getWeather,
    required GetLocalWeather getLocalWeather,
    required StoreWeatherData storeWeatherData,
    required GetStatusWeather getStatusWeather,
    required StoreStatusData storeStatusData,
    required ClearWeatherData clearWeatherData,
  })  : _getWeather = getWeather,
        _getLocalWeather = getLocalWeather,
        _storeWeatherData = storeWeatherData,
        _getStatusWeather = getStatusWeather,
        _storeStatusData = storeStatusData,
        _clearWeatherData = clearWeatherData,
        super(const HomeState()) {
    on<GetWeatherEvent>(_getWeatherHandler);
    on<ClearLocalWeatherEvent>(_clearWeatherHandler);
  }

  Future<void> _getWeatherHandler(
      GetWeatherEvent event, Emitter<HomeState> emitter) async {
    emit(const GettingWeather());

    // Check local storage first
    final localResult = await _getLocalWeather(event.date);
    localResult.fold(
      (failure) => emit(AuthError(failure.errorMessage)),
      (localWeather) async {
        if (localWeather.isNotEmpty) {
          emit(WeatherLoaded(localWeather));
        } else {
          // Fetch from remote API
          final remoteResult = await _getWeather(event.date);
          remoteResult.fold(
            (failure) => emit(AuthError(failure.errorMessage)),
            (remoteWeather) async {
              // Save data on first click and retrieve data from the second click

              _storeWeatherData(remoteWeather.list);

              // Save data on second click and retrieve data from the third click

              // final statusOpened = await _getStatusWeather(event.date);
              // statusOpened.fold((failure) => emit(AuthError(failure.errorMessage)),
              //         (localStatusWeather) {
              //   if (localStatusWeather.isNotEmpty) {
              //     _storeWeatherData(remoteWeather.list);
              //   } else {
              //     // save in
              //     _storeStatusData([HiveOpenedStatusModel(date: event.date)]);
              //   }
              // });

              return emit(WeatherLoaded(remoteWeather.list));

              // Save the fetched data locally
            },
          );
        }
      },
    );
  }

  Future<void> _clearWeatherHandler(ClearLocalWeatherEvent event, Emitter<HomeState> emitter) async {
      await _clearWeatherData();
  }
}
