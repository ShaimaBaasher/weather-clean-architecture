import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/utils/font_styles.dart';
import '../../../core/utils/helper.dart';
import '../../domain/entities/weather.dart';

class WeatherWidget extends StatelessWidget {
  ListElement model;
  bool isDayTime;

  WeatherWidget({super.key, required this.model, required this.isDayTime});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        model.weather[0].description,
                        style: fontStyle(isMediumFont: true, fontSize: 26, color: isDayTime ? Colors.black : Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: SvgPicture.asset(
                  getWeatherImage(model.weather[0].main),
                  width: 300,
                  height: 300,
                  semanticsLabel: getWeatherImage(model.weather[0].description),
                ),
              ),
            ],
          ),
        ),
        Row(
          children: [
            Expanded(
              child: Column(
                children: [
                  Text('Dubai', style: fontStyle(isMediumFont: true, color: isDayTime ? Colors.black : Colors.white)),
                  Text('${kelvinToCelsius(model.main.temp)}',
                      style: fontStyle(fontSize: 40, isSemiBold: true, color: isDayTime ? Colors.black : Colors.white)),
                ],
              ),
            ),
            const SizedBox(width: 20),
            Flexible(
              child: TempsWidget(title: 'Wind', temp: '${model.wind.speed}'),
            ),
            const SizedBox(width: 5),
            Flexible(
              child: TempsWidget(
                title: 'Humidity',
                temp: '${model.main.humidity}',
                isPercent: true,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class TempsWidget extends StatelessWidget {
  const TempsWidget({
    super.key,
    required this.title,
    required this.temp,
    this.isPercent = false,
  });

  final String title;
  final String temp;
  final bool isPercent;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          side: const BorderSide(width: 1, color: Color(0x191C1C1C)),
          borderRadius: BorderRadius.circular(7.50),
        ),
        shadows: const [
          BoxShadow(
            color: Color(0x0C000000),
            blurRadius: 10,
            offset: Offset(0, 4),
            spreadRadius: 0,
          )
        ],
      ),
      child: Column(
        children: [
          FittedBox(
              child: Text(
                title,
                style: fontStyle(isfontLight: true),
              )),
          const SizedBox(
            height: 5,
          ),
          isPercent
              ? FittedBox(
              child: Text('$temp%', style: fontStyle(isMediumFont: true)))
              : FittedBox(
              child: Text('${temp}km/h',
                  style: fontStyle(isMediumFont: true))),
        ],
      ),
    );
  }
}
