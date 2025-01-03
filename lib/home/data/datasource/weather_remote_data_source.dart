import 'package:http/http.dart' as http;
import 'package:http_interceptor/http/intercepted_client.dart';
import 'package:weather_app_clean_arch/home/data/models/weather_model.dart';

import '../../../core/errors/exceptions.dart';
import '../../../core/network/logging_interceptor.dart';
import '../../../core/utils/constaints.dart';
import 'package:flutter/material.dart';

import '../../domain/entities/weather.dart';

InterceptedClient client = InterceptedClient.build(
  interceptors: [LoggingInterceptor()],
);

abstract class WeatherRemoteDataSource {
  Future<WeatherMain> getWeather(String date);
}

class WeatherRemoteSourceImpl implements WeatherRemoteDataSource {
  const WeatherRemoteSourceImpl(this._client);

  final http.Client _client;

  @override
  Future<WeatherMainModel> getWeather(String date) async {

    try {
      final result = await _client.get(
        Uri.parse('$kBaseUrl$kGetWeatherEndPoint'),
      );
      debugPrint(Uri.parse('$kBaseUrl$kGetWeatherEndPoint').toString());

      final weatherData = WeatherMainModel.fromJson(result.body);

      // Filter the data by the provided date
      final filteredList = weatherData.list
          .where((element) => element.dtTxt.toIso8601String().split('T').first == date)
          .toList();

      // Return a new WeatherMainModel with the filtered list
      return WeatherMainModel(list: filteredList, cod: weatherData.cod, message: weatherData.message, cnt: weatherData.cnt, city: weatherData.city);
    } on ApiException {
      rethrow;
    } catch (e) {
      throw ApiException(message: e.toString(), statusCode: 505);
    }
  }
}
