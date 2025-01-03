import 'package:equatable/equatable.dart';

import '../../domain/entities/weather.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class GetWeatherEvent extends HomeEvent {
  final String date;
  const GetWeatherEvent({this.date = ''});
}

class ClearLocalWeatherEvent extends HomeEvent {
  const ClearLocalWeatherEvent();
}
