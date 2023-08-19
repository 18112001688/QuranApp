import 'dart:io';

import 'package:Qurane_app/Features/detail/data/models/azkar_model/azkar_data.dart';
import 'package:Qurane_app/Features/detail/data/repos/Azkar_repos/azkar_repo.dart';
import 'package:Qurane_app/core/utlity/api_service.dart';
import 'package:Qurane_app/core/utlity/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class AzkarRepoImp implements AzkarRepo {
  final ApiServicesAzkar apiServicesAzkar;

  AzkarRepoImp(this.apiServicesAzkar);

  @override
  Future<Either<Failure, AzkarData>> fetchAzkarData() async {
    try {
      var data = await apiServicesAzkar.get(datatype: '27.json');

      AzkarData azkarData = AzkarData.fromJson(data);

      return right(azkarData);
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
