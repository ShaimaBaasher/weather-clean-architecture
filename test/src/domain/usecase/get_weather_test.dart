import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/intl.dart';
import 'package:mocktail/mocktail.dart';
import 'package:weather_app_clean_arch/home/domain/entities/weather.dart';
import 'package:weather_app_clean_arch/home/domain/repositories/weather_repo.dart';
import 'package:weather_app_clean_arch/home/domain/usecase/get_weather.dart';

import 'weather_repository.mock.dart';

void main() {
  late WeatherRepo repository;
  late GetWeather usecase;

  setUp(() {
    repository = MockWeatherRepo();
    usecase = GetWeather(repository);
  });

  final theresponse = WeatherMain.empty();
  final DateTime today = DateTime.now();
  final DateTime tomorrow = today.add(const Duration(days: 1));
  final format = DateFormat('yyyy-MM-dd');

  test('should call the [WeatherRepo.getWeather] and return [WeatherMain]',
          () async {
        when(() => repository.getWeather(format.format(tomorrow)))
            .thenAnswer((_) async => Right(theresponse));

        final result = await usecase.call(format.format(tomorrow));

        expect(result, Right(theresponse));
        verify(() => repository.getWeather(format.format(tomorrow))).called(1);
        verifyNoMoreInteractions(repository);
      });
}
