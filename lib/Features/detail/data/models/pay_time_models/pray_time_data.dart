import 'package:Qurane_app/Features/detail/data/models/pay_time_models/timings.dart';

class PrayerData {
  Timings timings;

  
  PrayerData({
    required this.timings,
   
  });
  
  factory PrayerData.fromJson(Map<String, dynamic> json) {
    return PrayerData(
      timings: Timings.fromJson(json['timings']),
    
    );
  }
}