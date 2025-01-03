import 'package:hive/hive.dart';

import '../../domain/entities/hive_main_class.dart';
import '../../domain/entities/weather.dart';

class HiveMainClassModel extends HiveMainClass {
  HiveMainClassModel(
      {required super.temp,
      required super.pressure,
      required super.humidity,
      required super.feelsLike,
      required super.tempMin,
      required super.tempMax,
      required super.seaLevel,
      required super.grndLevel,
      required super.tempKf});

  factory HiveMainClassModel.fromMap(Map<String, dynamic> map) {
    return HiveMainClassModel(
      temp: map['temp'] as double,
      pressure: map['pressure'] as int,
      humidity: map['humidity'] as int,
      feelsLike: map['feelsLike'] as int,
      tempMin: map['tempMin'] as int,
      tempMax: map['tempMax'] as int,
      seaLevel: map['seaLevel'] as int,
      grndLevel: map['grndLevel'] as int,
      tempKf: map['tempKf'] as int,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'temp': temp,
      'feels_like': feelsLike,
      'temp_min': tempMin,
      'temp_max': tempMax,
      'pressure': pressure,
      'sea_level': seaLevel,
      'grnd_level': grndLevel,
      'humidity': humidity,
      'tempKf': tempKf,
    };
  }

  factory HiveMainClassModel.fromMainClass(MainClass mainClass) {
    return HiveMainClassModel(
        temp: mainClass.temp,
        pressure: mainClass.pressure,
        humidity: mainClass.humidity,
        feelsLike: 0,
        tempMin: 0,
        tempMax: 0,
        seaLevel: mainClass.seaLevel,
        grndLevel: mainClass.grndLevel,
        tempKf: 0);
  }
}

class HiveWeatherModel extends HiveWeather {
  HiveWeatherModel(
      {required super.id,
      required super.main,
      required super.description,
      required super.icon});

  factory HiveWeatherModel.fromWeather(Weather weather) {
    return HiveWeatherModel(
      id: weather.id,
      main: weather.main,
      description: weather.description,
      icon: weather.icon,
    );
  }
}

class HiveSysModel extends HiveSys {
  HiveSysModel({required super.pod});

  factory HiveSysModel.fromSys(Sys sys) {
    return HiveSysModel(pod: sys.pod);
  }
}

class HiveCloudsModel extends HiveObject {
  final int all;

  HiveCloudsModel({
    required this.all,
  });
}

class HiveWindModel extends HiveWind {
  HiveWindModel(
      {required super.speed, required super.deg, required super.gust});

  factory HiveWindModel.fromWeather(Wind wind) {
    return HiveWindModel(speed: wind.speed, deg: wind.deg, gust: wind.gust);
  }
}

class HiveListElementModel extends HiveListElement {
  HiveListElementModel(
      {required super.dt,
      required super.main,
      required super.weather,
      required super.clouds,
      required super.wind,
      required super.visibility,
      required super.pop,
      required super.sys,
      required super.dtTxt});

  // Factory method for mapping from app model
  factory HiveListElementModel.fromListElementModel(ListElement element) {
    return HiveListElementModel(
      dt: element.dt,
      main: HiveMainClassModel.fromMainClass(element.main),
      weather:
          element.weather.map((w) => HiveWeatherModel.fromWeather(w)).toList(),
      clouds: HiveClouds(all: element.clouds.all),
      wind: HiveWind(
          speed: element.wind.speed,
          deg: element.wind.deg,
          gust: element.wind.gust),
      visibility: element.visibility,
      pop: element.pop,
      sys: HiveSys(pod: element.sys.pod),
      dtTxt: element.dtTxt,
    );
  }
}
