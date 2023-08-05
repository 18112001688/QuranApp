import 'package:Qurane_app/Features/detail/data/models/azkar_model/azkar_data.dart';
import 'package:Qurane_app/core/utlity/failure.dart';
import 'package:dartz/dartz.dart';

abstract class AzkarRepo {
  Future<Either<Failure, AzkarData>> fetchAzkarData();
}
