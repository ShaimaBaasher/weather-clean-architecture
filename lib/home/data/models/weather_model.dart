import 'dart:convert';

import '../../../core/utils/typedaf.dart';
import '../../domain/entities/hive_main_class.dart';
import '../../domain/entities/weather.dart';
import 'hive_main_class_model.dart';

class WeatherMainModel extends WeatherMain {
  WeatherMainModel({
    required String cod,
    required int message,
    required int cnt,
    required List<ListElement> list,
    required City city,
  }) : super(
          cod: cod,
          message: message,
          cnt: cnt,
          list: list,
          city: city,
        );

  factory WeatherMainModel.fromJson(String source) =>
      WeatherMainModel.fromMap(jsonDecode(source) as Map<String, dynamic>);

  WeatherMainModel.empty()
      : this(
          cod: "200",
          message: 1,
          cnt: 0,
          list: [],
          city: CityModel.empty(),
        );

  factory WeatherMainModel.fromMap(Map<String, dynamic> map) {
    return WeatherMainModel(
      cod: map['cod'] as String,
      message: map['message'] as int,
      cnt: map['cnt'] as int,
      list: List<ListElementModel>.from(map['list']
          .map((x) => ListElementModel.fromMap(x as Map<String, dynamic>))),
      city: CityModel.fromMap(map['city'] as Map<String, dynamic>),
    );
  }

  WeatherMainModel copyWith({
    String? cod,
    int? message,
    int? cnt,
    List<ListElement>? list,
    City? city,
  }) {
    return WeatherMainModel(
      cod: cod ?? this.cod,
      message: message ?? this.message,
      cnt: cnt ?? this.cnt,
      list: list ?? this.list,
      city: city ?? this.city as CityModel,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'cod': cod,
      'message': message,
      'cnt': cnt,
      'list': list.map((x) => (x as ListElementModel).toMap()).toList(),
      'city': (city as CityModel).toMap(),
    };
  }

  @override
  String toString() {
    return 'WeatherMainModel{cod: $cod, message: $message, cnt: $cnt, list: $list, city: $city}';
  }

  String toJson() => jsonEncode(toMap());
}

class CityModel extends City {
  CityModel({
    required int id,
    required String name,
    required CoordModel coord,
    required String country,
    required int population,
    required int timezone,
    required int sunrise,
    required int sunset,
  }) : super(
          id: id,
          name: name,
          coord: coord,
          country: country,
          population: population,
          timezone: timezone,
          sunrise: sunrise,
          sunset: sunset,
        );

  factory CityModel.empty() {
    return CityModel(
      id: 1,
      name: '_empty.name',
      coord: CoordModel.empty(),
      country: '_empty.country',
      population: 1,
      timezone: 1,
      sunrise: 1,
      sunset: 1,
    );
  }

  factory CityModel.fromMap(Map<String, dynamic> map) {
    return CityModel(
      id: map['id'] as int,
      name: map['name'] as String,
      coord: CoordModel.fromMap(map['coord'] as Map<String, dynamic>),
      country: map['country'] as String,
      population: map['population'] as int,
      timezone: map['timezone'] as int,
      sunrise: map['sunrise'] as int,
      sunset: map['sunset'] as int,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'coord': (coord as CoordModel).toMap(),
      'country': country,
      'population': population,
      'timezone': timezone,
      'sunrise': sunrise,
      'sunset': sunset,
    };
  }

  String toJson() => jsonEncode(toMap());
}

class CoordModel extends Coord {
  CoordModel({
    required double lon,
    required double lat,
  }) : super(
          lon: lon,
          lat: lat,
        );

  factory CoordModel.empty() {
    return CoordModel(
      lon: 0.0,
      lat: 0.0,
    );
  }

  factory CoordModel.fromMap(Map<String, dynamic> map) {
    return CoordModel(
      lon: map['lon'] as double,
      lat: map['lat'] as double,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'lon': lon,
      'lat': lat,
    };
  }

  String toJson() => jsonEncode(toMap());
}

class ListElementModel extends ListElement {
  ListElementModel(
      {required super.dt,
      required super.main,
      required super.weather,
      required super.clouds,
      required super.wind,
      required super.visibility,
      required super.pop,
      required super.sys,
      required super.dtTxt});

  factory ListElementModel.fromJson(String source) =>
      ListElementModel.fromMap(jsonDecode(source) as DataMap);

  ListElementModel copyWith({
    int? dt,
    MainClass? main,
    List<Weather>? weather,
    Clouds? clouds,
    Wind? wind,
    int? visibility,
    int? pop,
    Sys? sys,
    DateTime? dtTxt,
  }) {
    return ListElementModel(
      dt: dt ?? this.dt,
      main: main ?? this.main,
      weather: weather ?? this.weather,
      clouds: clouds ?? this.clouds,
      wind: wind ?? this.wind,
      visibility: visibility ?? this.visibility,
      pop: pop ?? this.pop,
      sys: sys ?? this.sys,
      dtTxt: dtTxt ?? this.dtTxt,
    );
  }

  factory ListElementModel.fromListElementModel(HiveListElement element) {
    return ListElementModel(
      dt: element.dt,
      main: MainClassModel.fromMainClass(element.main),
      weather: element.weather.map((w) => WeatherModel.fromWeather(w)).toList(),
      clouds: Clouds(all: element.clouds.all),
      wind: Wind(
          speed: element.wind.speed,
          deg: element.wind.deg,
          gust: element.wind.gust),
      visibility: element.visibility,
      pop: element.pop,
      sys: Sys(pod: element.sys.pod),
      dtTxt: element.dtTxt,
    );
  }

  DataMap toMap() => {
        'dt': dt,
        'main': main,
        'weather': weather,
        'clouds': clouds,
        'wind': wind,
        'visibility': visibility,
        'pop': pop,
        'sys': sys,
        'dtTxt': dtTxt,
      };

  ListElementModel.fromMap(Map<String, dynamic> map)
      : this(
          dt: map['dt'] as int? ?? 0,
          main: MainClassModel.fromMap(map['main'] as Map<String, dynamic>),
          weather: (map['weather'] as List<dynamic>?)
                  ?.map((item) =>
                      WeatherModel.fromMap(item as Map<String, dynamic>))
                  .toList() ??
              [],
          clouds: CloudsModel.fromMap(map['clouds'] as Map<String, dynamic>),
          wind: WindModel.fromMap(map['wind'] as Map<String, dynamic>),
          visibility: map['visibility'] as int? ?? 0,
          pop: (map['pop'] as num?)?.toDouble() ?? 0.0,
          sys: SysModel.fromMap(map['sys'] as Map<String, dynamic>),
          dtTxt: DateTime.tryParse(map['dt_txt'] as String? ?? '') ??
              DateTime.fromMillisecondsSinceEpoch(0),
        );

  String toJson() => jsonEncode(toMap());

  @override
  String toString() {
    return 'ListElementModel(dt: $dt, main: $main, weather: $weather, clouds: $clouds, wind: $wind, visibility: $visibility, pop: $pop, sys: $sys, dtTxt: $dtTxt)';
  }
}

class CloudsModel extends Clouds {
  CloudsModel({required super.all});

  factory CloudsModel.fromJson(String source) =>
      CloudsModel.fromMap(jsonDecode(source) as DataMap);

  CloudsModel copyWith({
    int? all,
  }) {
    return CloudsModel(
      all: all ?? this.all,
    );
  }

  DataMap toMap() {
    return {
      'all': all,
    };
  }

  CloudsModel.fromMap(DataMap map)
      : this(
          all: map['all'] as int,
        );

  String toJson() => jsonEncode(toMap());

  @override
  String toString() {
    return 'CloudsModel{all: $all}';
  }
}

class MainClassModel extends MainClass {
  @override
  String toString() {
    return 'MainClassModel(temp: $temp, feelsLike: $feelsLike, tempMin: $tempMin, tempMax: $tempMax, pressure: $pressure, seaLevel: $seaLevel, grndLevel: $grndLevel, humidity: $humidity, tempKf: $tempKf)';
  }

  MainClassModel(
      {required super.temp,
      required super.feelsLike,
      required super.tempMin,
      required super.tempMax,
      required super.pressure,
      required super.seaLevel,
      required super.grndLevel,
      required super.humidity,
      required super.tempKf});

  factory MainClassModel.fromJson(String source) =>
      MainClassModel.fromMap(jsonDecode(source) as DataMap);

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

  MainClassModel.fromMap(DataMap map)
      : this(
          temp: map['temp'].toDouble() as double,
          feelsLike: map['feels_like']?.toDouble() as double,
          tempMin: map['temp_min'].toDouble() as double,
          tempMax: map['temp_max'].toDouble() as double,
          pressure: map['pressure'] as int,
          seaLevel: map['sea_level'] as int,
          grndLevel: map['grnd_level'] as int,
          humidity: map['humidity'] as int,
          tempKf: map['temp_kf'].toDouble() as double,
        );

  MainClassModel copyWith({
    double? temp,
    double? feelsLike,
    double? tempMin,
    double? tempMax,
    int? pressure,
    int? seaLevel,
    int? grndLevel,
    int? humidity,
    double? tempKf,
  }) {
    return MainClassModel(
      temp: temp ?? this.temp,
      feelsLike: feelsLike ?? this.feelsLike,
      tempMin: tempMin ?? this.tempMin,
      tempMax: tempMax ?? this.tempMax,
      pressure: pressure ?? this.pressure,
      seaLevel: seaLevel ?? this.seaLevel,
      grndLevel: grndLevel ?? this.grndLevel,
      humidity: humidity ?? this.humidity,
      tempKf: tempKf ?? this.tempKf,
    );
  }

  factory MainClassModel.fromMainClass(HiveMainClass mainClass) {
    return MainClassModel(
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

  String toJson() => jsonEncode(toMap());
}

class SysModel extends Sys {
  factory SysModel.fromJson(String source) =>
      SysModel.fromMap(jsonDecode(source) as DataMap);

  SysModel({required super.pod});

  DataMap toMap() {
    return {
      'pod': pod,
    };
  }

  SysModel.fromMap(DataMap map)
      : this(
          pod: map['pod'] as String,
        );

  SysModel copyWith({
    String? pod,
  }) {
    return SysModel(
      pod: pod ?? this.pod,
    );
  }

  String toJson() => jsonEncode(toMap());
}

class WeatherModel extends Weather {
  WeatherModel(
      {required super.id,
      required super.main,
      required super.description,
      required super.icon});

  factory WeatherModel.fromJson(String source) =>
      WeatherModel.fromMap(jsonDecode(source) as DataMap);

  DataMap toMap() {
    return {
      'id': id,
      'main': main,
      'description': description,
      'icon': icon,
    };
  }

  WeatherModel.fromMap(DataMap map)
      : this(
          id: map['id'] as int,
          main: map['main'] as String,
          description: map['description'] as String,
          icon: map['icon'] as String,
        );

  WeatherModel copyWith({
    int? id,
    String? main,
    String? description,
    String? icon,
  }) {
    return WeatherModel(
      id: id ?? this.id,
      main: main ?? this.main,
      description: description ?? this.description,
      icon: icon ?? this.icon,
    );
  }

  @override
  String toString() {
    return 'WeatherModel(id: $id, main: $main, description: $description, icon: $icon)';
  }

  factory WeatherModel.fromWeather(HiveWeather weather) {
    return WeatherModel(
      id: weather.id,
      main: weather.main,
      description: weather.description,
      icon: weather.icon,
    );
  }

  String toJson() => jsonEncode(toMap());
}

class WindModel extends Wind {
  WindModel({required super.speed, required super.deg, required super.gust});

  factory WindModel.fromJson(String source) =>
      WindModel.fromMap(jsonDecode(source) as DataMap);

  WindModel copyWith({
    double? speed,
    int? deg,
    double? gust,
  }) {
    return WindModel(
      speed: speed ?? this.speed,
      deg: deg ?? this.deg,
      gust: gust ?? this.gust,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'speed': speed,
      'deg': deg,
      'gust': gust,
    };
  }

  WindModel.fromMap(Map<String, dynamic> map)
      : this(
          speed: map['speed'].toDouble() as double,
          deg: map['deg'] as int,
          gust: map['gust'].toDouble() as double,
        );

  @override
  String toString() {
    return 'WindModel(speed: $speed, deg: $deg, gust: $gust)';
  }

  String toJson() => jsonEncode(toMap());
}
