import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:intl/intl.dart';

part 'date_selection_state.dart';

class DateCubit extends Cubit<List<String>> {
  DateCubit() : super([]);

  void fetchDates() {
    final DateTime today = DateTime.now();
    final DateTime tomorrow = today.add(const Duration(days: 1));
    final DateTime dayAfterTomorrow = today.add(const Duration(days: 2));

    final format = DateFormat('yyyy-MM-dd');
    emit([
      "Today: ${format.format(today)}",
      "Tomorrow: ${format.format(tomorrow)}",
      "Day After Tomorrow: ${format.format(dayAfterTomorrow)}",
    ]);
  }

  bool isDayTime() {
    final DateTime today = DateTime.now();
    bool isDayTime = today.hour >= 6 && today.hour < 18;
    return isDayTime;
  }
}
