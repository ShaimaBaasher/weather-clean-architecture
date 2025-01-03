import 'package:hive/hive.dart';
part 'hive_main_class.g.dart';

@HiveType(typeId: 1)
class HiveMainClass extends HiveObject {
  @HiveField(0)
  final double temp;
  @HiveField(1)
  final int pressure;
  @HiveField(2)
  final int humidity;
  @HiveField(3)
  final int feelsLike;
  @HiveField(4)
  final int tempMin;
  @HiveField(5)
  final int tempMax;
  @HiveField(6)
  final int seaLevel;
  @HiveField(7)
  final int grndLevel;
  @HiveField(8)
  final int tempKf;

  HiveMainClass({
    required this.temp,
    required this.pressure,
    required this.humidity,
    required this.feelsLike,
    required this.tempMin,
    required this.tempMax,
    required this.seaLevel,
    required this.grndLevel,
    required this.tempKf,
  });
}

@HiveType(typeId: 2)
class HiveWeather extends HiveObject {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String main;
  @HiveField(2)
  final String description;
  @HiveField(3)
  final String icon;

  HiveWeather({
    required this.id,
    required this.main,
    required this.description,
    required this.icon,
  });
}

@HiveType(typeId: 3)
class HiveClouds extends HiveObject {
  @HiveField(0)
  final int all;

  HiveClouds({
    required this.all,
  });
}

@HiveType(typeId: 4)
class HiveWind extends HiveObject {
  @HiveField(0)
  final double speed;
  @HiveField(1)
  final int deg;
  @HiveField(3)
  final double gust;

  HiveWind({
    required this.speed,
    required this.deg,
    required this.gust,
  });
}

@HiveType(typeId: 5)
class HiveSys extends HiveObject {
  @HiveField(0)
  final String pod;

  HiveSys({
    required this.pod,
  });
}


@HiveType(typeId: 6)
class HiveListElement extends HiveObject {
  @HiveField(0)
  final int dt;
  @HiveField(1)
  final HiveMainClass main;
  @HiveField(2)
  final List<HiveWeather> weather;
  @HiveField(3)
  final HiveClouds clouds;
  @HiveField(4)
  final HiveWind wind;
  @HiveField(5)
  final int visibility;
  @HiveField(6)
  final dynamic pop;
  @HiveField(7)
  final HiveSys sys;
  @HiveField(8)
  final DateTime dtTxt;

  HiveListElement({
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

}