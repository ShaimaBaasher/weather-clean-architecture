// To parse this JSON data, do
//
//     final weatherModel = weatherModelFromJson(jsonString);

import 'dart:convert';

import 'package:equatable/equatable.dart';

class WeatherMain extends Equatable {
  final String cod;
  final int message;
  final int cnt;
  final List<ListElement> list;
  final City city;

  WeatherMain({
    required this.cod,
    required this.message,
    required this.cnt,
    required this.list,
    required this.city,
  });

  WeatherMain.empty()
      : this(cod: "200", message: 1, cnt: 0, list: [], city: City.empty());

  @override
  List<Object?> get props => [];
}

class City extends Equatable {
  final int id;
  final String name;
  final Coord coord;
  final String country;
  final int population;
  final int timezone;
  final int sunrise;
  final int sunset;

  City({
    required this.id,
    required this.name,
    required this.coord,
    required this.country,
    required this.population,
    required this.timezone,
    required this.sunrise,
    required this.sunset,
  });

  // Empty constructor
  City.empty()
      : this(
          id: 1,
          name: '_empty.name',
          coord: Coord.empty(),
          country: '_empty.country',
          population: 1,
          timezone: 1,
          sunrise: 1,
          sunset: 1,
        );

  @override
  List<Object?> get props => [
        id,
        name,
      ];
}

class Coord extends Equatable {
  final double lat;
  final double lon;

  const Coord({
    required this.lat,
    required this.lon,
  });

  const Coord.empty() : this(lon: 0.0, lat: 0.0);

  @override
  List<Object?> get props => [lat, lon];
}

class ListElement extends Equatable {
  final int dt;
  final MainClass main;
  final List<Weather> weather;
  final Clouds clouds;
  final Wind wind;
  final int visibility;
  final dynamic pop;
  final Sys sys;
  final DateTime dtTxt;

  ListElement({
    required this.dt,
    required this.main,
    required this.weather,
    required this.clouds,
    required this.wind,
    required this.visibility,
    required this.pop,
    required this.sys,
    required this.dtTxt,
  });

  @override
  List<Object?> get props => [];
}

class Clouds extends Equatable {
  final int all;

  Clouds({
    required this.all,
  });

  @override
  List<Object?> get props => [];
}

class MainClass extends Equatable {
  final double temp;
  final double feelsLike;
  final double tempMin;
  final double tempMax;
  final int pressure;
  final int seaLevel;
  final int grndLevel;
  final int humidity;
  final double tempKf;

  MainClass({
    required this.temp,
    required this.feelsLike,
    required this.tempMin,
    required this.tempMax,
    required this.pressure,
    required this.seaLevel,
    required this.grndLevel,
    required this.humidity,
    required this.tempKf,
  });

  @override
  List<Object?> get props => [];
}

class Sys extends Equatable {
  final String pod;

  Sys({
    required this.pod,
  });

  @override
  List<Object?> get props => [];
}

// enum Pod {
//   D,
//   N
// }
//
// final podValues = EnumValues({
//   "d": Pod.D,
//   "n": Pod.N
// });

class Weather extends Equatable {
  final int id;
  final String main;
  final String description;
  final String icon;

  Weather({
    required this.id,
    required this.main,
    required this.description,
    required this.icon,
  });

  @override
  List<Object?> get props => [];
}

// enum Description {
//   BROKEN_CLOUDS,
//   CLEAR_SKY,
//   FEW_CLOUDS,
//   OVERCAST_CLOUDS,
//   SCATTERED_CLOUDS
// }
//
// final descriptionValues = EnumValues({
//   "broken clouds": Description.BROKEN_CLOUDS,
//   "clear sky": Description.CLEAR_SKY,
//   "few clouds": Description.FEW_CLOUDS,
//   "overcast clouds": Description.OVERCAST_CLOUDS,
//   "scattered clouds": Description.SCATTERED_CLOUDS
// });
//
// enum MainEnum {
//   CLEAR,
//   CLOUDS
// }
//
// final mainEnumValues = EnumValues({
//   "Clear": MainEnum.CLEAR,
//   "Clouds": MainEnum.CLOUDS
// });

class Wind extends Equatable {
  final double speed;
  final int deg;
  final double gust;

  Wind({
    required this.speed,
    required this.deg,
    required this.gust,
  });

  @override
  List<Object?> get props => [];
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
