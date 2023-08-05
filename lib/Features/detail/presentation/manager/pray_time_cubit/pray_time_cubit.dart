import 'package:Qurane_app/Features/detail/data/models/pay_time_models/prayer_times.dart';
import 'package:Qurane_app/Features/detail/data/repos/pray_time_repos/pray_time_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


part 'pray_time_state.dart';

class PrayTimeCubit extends Cubit<PrayTimeState> {
  PrayTimeCubit({
    required this.pryTimeRepo,
  }) : super(PrayTimeInitial());

  final PryTimeRepo pryTimeRepo;

 Future<void> fetchPrayTime() async {
  emit(PrayTimeIsLoading());
  var result = await pryTimeRepo.fetchPrayTime();
  result.fold((failure) {
    emit(PrayTimeFailure(errorMessage: failure.toString()));
  }, (prayTime) {
    emit(
      PrayTimeSucess(prayerTimes: prayTime),
    );
  });
}
}
