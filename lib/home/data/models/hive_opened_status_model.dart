
import '../../domain/entities/hive_opened_status.dart';

class HiveOpenedStatusModel extends HiveOpenedStatus {
  HiveOpenedStatusModel({required super.date});

  factory HiveOpenedStatusModel.fromJson(Map<String, dynamic> json) {
    return HiveOpenedStatusModel(
      date: json['date'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'date': date,
    };
  }
}