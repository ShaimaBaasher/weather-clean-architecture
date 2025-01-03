import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_clean_arch/home/presentation/bloc/home_bloc.dart';

import '../home/presentation/bloc/home_event.dart';
import '../home/presentation/view/home.dart';
import 'cubit/date_selection_cubit.dart';

class DateSelection extends StatefulWidget {
  const DateSelection({super.key});

  @override
  State<DateSelection> createState() => _DateSelectionState();
}

class _DateSelectionState extends State<DateSelection> {
  bool isDayTime = false;

  @override
  void initState() {
    isDayTime = context.read<DateCubit>().isDayTime();
    context.read<HomeBloc>().add(const ClearLocalWeatherEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: isDayTime
                ? [Colors.blue, Colors.lightBlueAccent]
                : [Colors.black, Colors.grey],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Greeting Section
            const SizedBox(
              height: 60,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "How are you doing today ?",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: isDayTime ? Colors.black54 : Colors.white),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "which date you would like to check out the weather ?",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: isDayTime ? Colors.black54 : Colors.white),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),

            // Animated List of Dates
            Expanded(
              child: BlocBuilder<DateCubit, List<String>>(
                builder: (context, dates) {
                  return ListView.builder(
                    itemCount: dates.length,
                    itemBuilder: (context, index) {
                      return AnimatedContainer(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeInOut,
                        margin: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 16),
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              blurRadius: 8,
                              offset: const Offset(2, 4), // Shadow position
                            ),
                          ],
                        ),
                        child: InkWell(
                          onTap: () {
                            final selectedDate = dates[index].split(': ').last;
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Home(date: selectedDate, isDayTime: isDayTime,),
                              ),
                            );
                          },
                          child: Text(
                            dates[index],
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
