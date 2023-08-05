import 'package:Qurane_app/Features/detail/data/models/pay_time_models/pray_time_data.dart';

class PrayerTimes {
  int code;
  String status;
  List<PrayerData> data;
  
  PrayerTimes({
    required this.code,
    required this.status,
    required this.data,
  });
  
  factory PrayerTimes.fromJson(Map<String, dynamic> json) {
    return PrayerTimes(
      code: json['code'],
      status: json['status'],
      data: List<PrayerData>.from(json['data'].map((x) => PrayerData.fromJson(x))),
    );
  }
}