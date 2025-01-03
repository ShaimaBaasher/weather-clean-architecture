
import '../../../core/usecase/usecase.dart';
import '../../../core/utils/typedaf.dart';
import '../entities/weather.dart';
import '../repositories/weather_repo.dart';

class GetLocalWeather extends UseCaseWithParams<dynamic, String> {
  const GetLocalWeather(this._repository);

  final WeatherRepo _repository;

  @override
  ResultFuture<List<ListElement>> call(String params) async => _repository.getWeatherData(params);
}