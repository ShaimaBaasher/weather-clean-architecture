import '../../../core/usecase/usecase.dart';
import '../../../core/utils/typedaf.dart';
import '../repositories/weather_repo.dart';

class ClearWeatherData extends UseCaseWithoutParams<dynamic> {
  final WeatherRepo _repository;

  ClearWeatherData(this._repository);

  @override
  ResultFuture<dynamic> call() async => _repository.clearWeatherData();
}
