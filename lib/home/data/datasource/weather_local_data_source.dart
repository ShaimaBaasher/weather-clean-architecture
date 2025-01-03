import 'dart:developer';

import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import '../../../core/service/local_cache.dart';
import '../../../core/utils/constaints.dart';
import '../../domain/entities/hive_opened_status.dart';
import '../../domain/entities/weather.dart';
import '../models/hive_main_class_model.dart';
import '../models/weather_model.dart';

abstract class WeatherLocalDataSource {
  Future<dynamic> saveWeatherData(List<ListElement> data);
  Future<List<ListElement>> getWeatherData(String key);
  Future<void> clearWeatherData();
  Future<List<dynamic>> getStatusOpened(String date);
  Future<void> saveStatus(List<HiveOpenedStatus> value);
}

class LocalStorageSourceImpl implements WeatherLocalDataSource {

  LocalStorageSourceImpl();

  @override
  Future<void> clearWeatherData() async {
    DateTime currentDate = DateTime.now();
    String formattedDate = "${currentDate.year}-${currentDate.month}-${currentDate.day}";
    var lastClearedDate = await CacheHelper.getDataFromSharedPref(key: lastSaveWeatherClearedDate);

    if (lastClearedDate != formattedDate) {
      var weatherDataBox = await Hive.openBox<List<dynamic>>(weatherData);
      var statusDataBox = await Hive.openBox<List<dynamic>>(statusData);

      // Clear all in both boxes
      await weatherDataBox.clear();
      await statusDataBox.clear();

      await weatherDataBox.close();
      await statusDataBox.close();
    }
  }

  @override
  Future<dynamic> saveWeatherData(List<ListElement> data) async {
    // Open the Hive box
    var callHistoryBox = await Hive.openBox<List<dynamic>>(weatherData);

    // Convert ListElement to HiveListElementModel
    final statusList = data
        .map((element) => HiveListElementModel.fromListElementModel(element))
        .toList();

    // Retrieve existing weather data, or initialize an empty list if not present
    var callHistory = callHistoryBox.get(weatherData, defaultValue: <HiveListElementModel>[]);

    // Add new status data to the existing list
    callHistory?.addAll(statusList);

    // Save the updated list back to the Hive box
    await callHistoryBox.put(weatherData, callHistory ?? []);
    await callHistoryBox.close();

    // Get current date to use for clearing data later
    DateTime currentDate = DateTime.now();
    String formattedDate = "${currentDate.year}-${currentDate.month}-${currentDate.day}";
    await CacheHelper.setDataToSharedPref(key: lastSaveWeatherClearedDate, value: formattedDate);

  }

  @override
  Future<List<ListElementModel>> getWeatherData(String key) async {
    // Open the Hive box
    var callHistoryBox = await Hive.openBox<List<dynamic>>(weatherData);

    // Retrieve the list of HiveOpenedStatus from the box
    var callHistory = callHistoryBox.get(weatherData);

    // Handle null or empty callHistory
    if (callHistory == null || callHistory.isEmpty) {
      log('No weather data found for the key: $key');
      return [];
    }

    final format = DateFormat('yyyy-MM-dd');

    // Filter weather by date
    final filteredStatuses = callHistory
        .where((status) => format.format(status.dtTxt) == key)
        .toList();

    // Convert HiveListElement to ListElementModel using the mapper
    final result = filteredStatuses
        .map((hiveElement) => ListElementModel.fromListElementModel(hiveElement))
        .toList();

    await callHistoryBox.close();

    return result;
  }

  @override
  Future<List<dynamic>> getStatusOpened(String date) async {
    var callHistoryBox = await Hive.openBox<List<dynamic>>(statusData);

    var callHistory = callHistoryBox.get(
      statusData,
    );

    await callHistoryBox.close();

    // Filter the statuses by date
    final filteredStatuses = callHistory?.where((status) => status.date == date).toList();
    return filteredStatuses ?? [];
  }

  @override
  Future<void> saveStatus(List<HiveOpenedStatus> value) async {
    // Convert the HiveOpenedStatusModel to HiveOpenedStatus
    final statusList = value.map((element) => HiveOpenedStatus(date: element.date)).toList();

    // Open the Hive box
    var callHistoryBox = await Hive.openBox<List<dynamic>>(statusData);

    // Retrieve existing call history, or initialize an empty list if not present
    var callHistory = callHistoryBox.get(statusData, defaultValue: <HiveOpenedStatus>[]);

    // Add new statuses to the existing call history
    callHistory?.addAll(statusList);

    // Save the updated list back to the Hive box
    await callHistoryBox.put(statusData, callHistory ?? []);
    await callHistoryBox.close();
  }

}
