part of 'pray_time_cubit.dart';

@immutable
abstract class PrayTimeState {}

class PrayTimeInitial extends PrayTimeState {}
class PrayTimeIsLoading extends PrayTimeState {}
class PrayTimeSucess extends PrayTimeState{
  final PrayerTimes prayerTimes;

  PrayTimeSucess({required this.prayerTimes});
}
class PrayTimeFailure extends PrayTimeState{ 
  final String errorMessage;
  PrayTimeFailure({required this.errorMessage});
}


