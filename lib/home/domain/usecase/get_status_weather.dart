
import 'package:weather_app_clean_arch/home/domain/entities/hive_opened_status.dart';

import '../../../core/usecase/usecase.dart';
import '../../../core/utils/typedaf.dart';
import '../repositories/weather_repo.dart';

class GetStatusWeather extends UseCaseWithParams<dynamic, String> {
  const GetStatusWeather(this._repository);

  final WeatherRepo _repository;

  @override
  ResultFuture<List<dynamic>> call(String params) async => _repository.getStatusOpened(params);
}