import 'package:weather_app_clean_arch/core/utils/image_constant.dart';

import '../../home/domain/entities/weather.dart';
import 'package:flutter/material.dart';

int kelvinToCelsius(double kelvin) {
  return (kelvin - 273.15).round();
}

String getWeatherImage(String weatherStatus) {
  switch (weatherStatus) {
    case "Clear":
      return ImageConstant.icSkyClear;
    case "Clouds":
      return ImageConstant.icCloudySunny;
    case "Rain":
      return ImageConstant.icWeatherRain;
    case "Drizzle":
      return ImageConstant.icWeatherRain;
    case "Thunderstorm":
      return ImageConstant.icRainStorm;
    case "Snow":
      return ImageConstant.icSnowyCold;
    case "Mist":
    case "Fog":
      return ImageConstant.icWindWindy;
    case "Smoke":
    case "Haze":
    case "Dust":
    case "Sand":
      return ImageConstant.icWindWindy;
    case "Ash":
      return ImageConstant.icCloudsCloudy;
    case "Squall":
      return ImageConstant.icWindWindy;
    case "Tornado":
      return ImageConstant.icHurricane;
    default:
      return ImageConstant.icSkyClear; // Default image for undefined statuses
  }
}

Color getBackgroundColor(String weatherCondition) {
  switch (weatherCondition) {
    case 'clear sky':
      return Colors.blue;
    case 'few clouds':
      return Colors.lightBlueAccent;
    case 'scattered clouds':
      return Colors.grey.shade300;
    case 'broken clouds':
      return Colors.grey.shade600;
    case 'shower rain':
      return Colors.blueGrey;
    case 'rain':
      return Colors.indigo;
    case 'thunderstorm':
      return Colors.deepPurple;
    case 'snow':
      return Colors.white;
    case 'mist':
      return Colors.grey.shade400;
    default:
      return Colors.blueGrey.shade200; // Default color for unknown conditions
  }
}

Map<String, dynamic> listElementToJson(ListElement element) {
  return {
    'dt': element.dt,
    'main': mainToJson(element.main),
    'weather': element.weather.map((w) => weatherToJson(w)).toList(),
    'clouds': cloudsToJson(element.clouds),
    'wind': windToJson(element.wind),
    'visibility': element.visibility,
    'pop': element.pop,
    'sys': sysToJson(element.sys),
    'dt_txt': element.dtTxt.toIso8601String(),
  };
}

ListElement listElementFromJson(Map<String, dynamic> json) {
  return ListElement(
    dt: json['dt'],
    main: mainFromJson(json['main']),
    weather: List<Weather>.from(json['weather'].map((x) => weatherFromJson(x))),
    clouds: cloudsFromJson(json['clouds']),
    wind: windFromJson(json['wind']),
    visibility: json['visibility'],
    pop: json['pop'],
    sys: sysFromJson(json['sys']),
    dtTxt: DateTime.parse(json['dt_txt']),
  );
}

Map<String, dynamic> mainToJson(MainClass main) {
  return {
    'temp': main.temp,
    'pressure': main.pressure,
    'humidity': main.humidity,
    'feels_like': main.feelsLike,
    'temp_min': main.tempMin,
    'temp_max': main.tempMax,
    'sea_level': main.seaLevel,
    'grnd_level': main.grndLevel,
    'temp_kf': main.tempKf,
  };
}

MainClass mainFromJson(Map<String, dynamic> json) {
  return MainClass(
    temp: json['temp'],
    pressure: json['pressure'] ?? 0.0,
    humidity: json['humidity'],
    feelsLike: json['feels_like'] ?? 0.0,
    tempMin: json['temp_min'] ?? 0.0,
    tempMax: json['temp_max'] ?? 0.0,
    seaLevel: json['sea_level'] ?? 0.0,
    grndLevel: json['grnd_level'] ?? 0.0,
    tempKf: json['temp_kf'] ?? 0.0,
  );
}

Map<String, dynamic> weatherToJson(Weather weather) {
  return {
    'id': weather.id,
    'main': weather.main,
    'description': weather.description,
    'icon': weather.icon,
  };
}

Weather weatherFromJson(Map<String, dynamic> json) {
  return Weather(
    id: json['id'],
    main: json['main'],
    description: json['description'],
    icon: json['icon'],
  );
}

Map<String, dynamic> cloudsToJson(Clouds clouds) {
  return {
    'all': clouds.all,
  };
}

Clouds cloudsFromJson(Map<String, dynamic> json) {
  return Clouds(
    all: json['all'],
  );
}

Map<String, dynamic> windToJson(Wind wind) {
  return {
    'speed': wind.speed,
    'deg': wind.deg,
    'gust': wind.gust,
  };
}

Wind windFromJson(Map<String, dynamic> json) {
  return Wind(
    speed: json['speed'],
    deg: json['deg'],
    gust: json['gust'],
  );
}

Map<String, dynamic> sysToJson(Sys sys) {
  return {
    'pod': sys.pod,
  };
}

Sys sysFromJson(Map<String, dynamic> json) {
  return Sys(
    pod: json['pod'],
  );
}
