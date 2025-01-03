import '../../../core/usecase/usecase.dart';
import '../../../core/utils/typedaf.dart';
import '../entities/weather.dart';
import '../repositories/weather_repo.dart';

class StoreWeatherData extends UseCaseWithParams<dynamic, List<ListElement>> {
  final WeatherRepo _repository;

  StoreWeatherData(this._repository);

  @override
  ResultVoid call(List<ListElement> params) async => _repository.saveWeatherData(params);
}
