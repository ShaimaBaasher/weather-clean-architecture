
import '../../../core/usecase/usecase.dart';
import '../../../core/utils/typedaf.dart';
import '../entities/weather.dart';
import '../repositories/weather_repo.dart';

class GetWeather extends UseCaseWithParams<WeatherMain, String> {
  const GetWeather(this._repository);

  final WeatherRepo _repository;

  @override
  ResultFuture<WeatherMain> call(String params) async => _repository.getWeather(params);

}