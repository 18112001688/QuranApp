import 'package:Qurane_app/Features/detail/data/models/ahdes_model/hdes_model.dart';
import 'package:Qurane_app/Features/detail/data/repos/ahdes_repos/ahdes_repo.dart';
import 'package:Qurane_app/core/utlity/api_service.dart';
import 'package:Qurane_app/core/utlity/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class AhdesRepoImp implements AhdesRepo {
  final ApiServiceAhdes apiServiceAhdes;

  AhdesRepoImp(this.apiServiceAhdes);
  @override
  Future<Either<Failure, HdesModel>> fetchAhdesData() async {
    try {
      var data = await apiServiceAhdes.get(limit: 300);

      

      HdesModel hdesModel = HdesModel.fromJson(data);







      return right(hdesModel);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFilauire.fromDioError(e));
      }
      return left(ServerFilauire(e.toString()));
    }
  }
}
