import 'package:dartz/dartz.dart';

import '../../../../core/errors/exceptions.dart';
import '../../../core/errors/failure.dart';
import '../../../core/utils/typedaf.dart';
import '../../domain/entities/hive_opened_status.dart';
import '../../domain/entities/weather.dart';
import '../../domain/repositories/weather_repo.dart';
import '../datasource/weather_local_data_source.dart';
import '../datasource/weather_remote_data_source.dart';

class WeatherRepositoryImplementation implements WeatherRepo {
  const WeatherRepositoryImplementation(this._repository, this._repositoryLocal);

  final WeatherRemoteDataSource _repository;
  final WeatherLocalDataSource _repositoryLocal;

  @override
  ResultFuture<WeatherMain> getWeather(String date) async {
    try {
      final result = await _repository.getWeather(date);
      return Right(result);
    } on ApiException catch (e) {
      return Left(ApiFailure.fromException(e));
    }
  }

  @override
  ResultVoid clearWeatherData() async {
    try {
      final result = await _repositoryLocal.clearWeatherData();
      return const Right(null);
    } on ApiException catch (e) {
      return Left(ApiFailure.fromException(e));
    }
  }

  @override
  ResultFuture<List<ListElement>> getWeatherData(String key) async {
    try {
      final result = await _repositoryLocal.getWeatherData(key);
      return Right(result);
    } on ApiException catch (e) {
      return Left(ApiFailure.fromException(e));
    }
  }

  @override
  ResultDynamic saveWeatherData(List<ListElement> data) async {
    try {
      final result = await _repositoryLocal.saveWeatherData(data);
      return Right(result);
    } on ApiException catch (e) {
      return Left(ApiFailure.fromException(e));
    }
  }

  @override
  ResultFuture<List<dynamic>> getStatusOpened(String date) async {
    try {
      final result = await _repositoryLocal.getStatusOpened(date);
      return Right(result);
    } on ApiException catch (e) {
      return Left(ApiFailure.fromException(e));
    }
  }

  @override
  ResultVoid saveStatus(List<HiveOpenedStatus> value) async {
    try {
      final result = await _repositoryLocal.saveStatus(value);
      return Right(result);
    } on ApiException catch (e) {
      return Left(ApiFailure.fromException(e));
    }
  }

}
