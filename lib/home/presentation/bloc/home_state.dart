
import 'package:equatable/equatable.dart';

import '../../domain/entities/weather.dart';

class HomeState extends Equatable {
  const HomeState();
  @override
  List<Object> get props => [];
}

class GettingWeather extends HomeState {
  const GettingWeather();
}

class WeatherLoaded extends HomeState {
  const WeatherLoaded(this.weather);
  final List<ListElement> weather;

  @override
  List<Object> get props => [];
}

class AuthError extends HomeState {
  const AuthError(this.message);
  final String message;

  @override
  List<String> get props => [message];
}