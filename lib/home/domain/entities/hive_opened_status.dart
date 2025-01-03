import 'package:hive/hive.dart';
part 'hive_opened_status.g.dart';

@HiveType(typeId: 7)
class HiveOpenedStatus extends HiveObject {
  @HiveField(0)
  final String date;

  HiveOpenedStatus({
    required this.date,
  });

  factory HiveOpenedStatus.fromJson(Map<String, dynamic> json) {
    return HiveOpenedStatus(
      date: json['date'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'date': date,
    };
  }

  @override
  String toString() {
    return 'HiveOpenedStatus{date: $date}';
  }
}