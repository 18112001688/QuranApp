import 'package:Qurane_app/Features/detail/data/models/pay_time_models/prayer_times.dart';
import 'package:Qurane_app/core/utlity/failure.dart';
import 'package:dartz/dartz.dart';


abstract class PryTimeRepo { 
 Future<Either<Failure,PrayerTimes>> fetchPrayTime();

}
