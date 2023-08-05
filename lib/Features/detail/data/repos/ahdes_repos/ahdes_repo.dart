import 'package:Qurane_app/Features/detail/data/models/ahdes_model/hdes_model.dart';
import 'package:Qurane_app/core/utlity/failure.dart';
import 'package:dartz/dartz.dart';

abstract class AhdesRepo{ 

 Future<Either<Failure,HdesModel>> fetchAhdesData();

}