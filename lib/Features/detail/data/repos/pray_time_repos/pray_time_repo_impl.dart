import 'dart:io';

import 'package:Qurane_app/Features/detail/data/models/pay_time_models/prayer_times.dart';
import 'package:Qurane_app/Features/detail/data/repos/pray_time_repos/pray_time_repo.dart';
import 'package:Qurane_app/core/utlity/api_service.dart';
import 'package:Qurane_app/core/utlity/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class PryTimeRepoImp implements PryTimeRepo {
  final ApiServicePrayerTime apiService;

  PryTimeRepoImp(this.apiService);
  @override
  Future<Either<Failure, PrayerTimes>> fetchPrayTime() async {
    try {
      var data = await apiService.get(city: 'cairo');

      PrayerTimes prayTimeData = PrayerTimes.fromJson(data);

      return right(prayTimeData);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFilauire.fromDioError(e)); // Use ServerFailure here
      } else if (e is SocketException) {
        return left(ServerFilauire(
            'No internet connection occurred')); // Handle SocketException here
      } else {
        return left(ServerFilauire(
            'Oops, there was an error')); // Handle other exceptions
      }
    }
  }
}
