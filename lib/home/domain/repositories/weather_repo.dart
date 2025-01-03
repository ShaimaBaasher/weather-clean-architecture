
import '../../../core/utils/typedaf.dart';
import '../entities/hive_opened_status.dart';
import '../entities/weather.dart';

abstract class WeatherRepo {
  const WeatherRepo();

  ResultFuture<WeatherMain> getWeather(String date);
  ResultVoid saveWeatherData(List<ListElement> data);
  ResultFuture<List<ListElement>> getWeatherData(String key);
  ResultFuture<List<dynamic>> getStatusOpened(String date);
  ResultVoid saveStatus(List<HiveOpenedStatus> value);
  ResultVoid clearWeatherData();
}