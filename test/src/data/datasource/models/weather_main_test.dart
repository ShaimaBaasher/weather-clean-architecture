import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:weather_app_clean_arch/core/utils/typedaf.dart';
import 'package:weather_app_clean_arch/home/data/models/weather_model.dart';
import 'package:weather_app_clean_arch/home/domain/entities/weather.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  var tModel = WeatherMainModel.empty();

  test('should be a subclass of [WeatherMain] entity', () {
    var tModel = WeatherMain.empty();
    expect(tModel, isA<WeatherMain>());
  });

  final tJson = fixture('weather.json');
  final tMap = jsonDecode(tJson) as DataMap;


  group('fromMap', () {
    test('should return a [WeatherMainModel] with the right data', () {
      final result = WeatherMainModel.fromMap(tMap);
      expect(result, tModel);
    });
  });

  group('fromJson', () {
    test('should return a [WeatherMainModel] with the right data', () {
      final result = WeatherMainModel.fromJson(tJson);
      expect(result, tModel);
    });
  });

  group('toMap', () {
    test('should return a [Map] with the right data', () {
      final result = tModel.toMap();
      expect(result, tMap);
    });
  });

  // cod: "200", message: 1, cnt: 0, list: [], city: City.empty()
  group('toJson', () {
    test('should return a [JSON] with the right data', () {
      final result = tModel.toJson();
      final tJson = jsonEncode(tMap);
      expect(result, tJson);
    });
  });

  group('copyWith', () {
    test('should return a [WeatherMainModel] with different data', () {
      final result = tModel.copyWith(cod: '300');
      expect(result.cod, '300');
    });
  });
}
