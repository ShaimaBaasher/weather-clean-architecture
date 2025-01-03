import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_clean_arch/home/presentation/bloc/home_event.dart';

import '../../../core/utils/font_styles.dart';
import '../bloc/home_bloc.dart';
import '../bloc/home_state.dart';
import '../widgets/weather_widget.dart';

class Home extends StatefulWidget {
  Home({super.key, this.date = '', this.isDayTime = false});

  String date;
  bool isDayTime;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    context.read<HomeBloc>().add(GetWeatherEvent(
        date: widget.date)); // Fetch Weather Data from Api or Local Storage
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: widget.isDayTime
                ? Colors.black
                : Colors.white, // Set back button color
          ),
          elevation: 0, // Remove shadow
          backgroundColor: Colors.transparent, // Make background transparent
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: widget.isDayTime
                    ? [Colors.blue, Colors.blue.shade400]
                    : [Colors.black, Colors.black87],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
        ),
        body: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            return  Container(
              decoration: state is AuthError ? null : BoxDecoration(
                gradient: LinearGradient(
                  colors: widget.isDayTime
                      ? [Colors.blue, Colors.lightBlueAccent]
                      : [Colors.black, Colors.grey],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 24.0, horizontal: 10),
                child: BlocConsumer<HomeBloc, HomeState>(
                  listener: (context, state) {
                    if (state is AuthError) {
                      ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(content: Text(state.message)));
                    }
                  },
                  builder: (context, state) {
                    return state is GettingWeather
                        ? const Center(child: CircularProgressIndicator())
                        : state is WeatherLoaded
                            ? state.weather.isEmpty
                                ? Center(
                                    child: Text(
                                        'No Weather Data Available For ${widget.date}',
                                        style: fontStyle()),
                                  )
                                : Column(
                                    children: [
                                      Expanded(
                                        child: ListView.builder(
                                          physics:
                                              const BouncingScrollPhysics(),
                                          // Add some bounce effect
                                          scrollDirection: Axis.horizontal,
                                          itemCount: state.weather.length,
                                          itemBuilder: (ctx, i) {
                                            return SizedBox(
                                              width: MediaQuery.of(ctx)
                                                  .size
                                                  .width, // Takes full width of the screen
                                              child: WeatherWidget(
                                                model: state.weather[i],
                                                isDayTime: widget.isDayTime,
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                    ],
                                  )
                            : const SizedBox.shrink();
                  },
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
