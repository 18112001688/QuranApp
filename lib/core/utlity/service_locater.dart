import 'package:Qurane_app/Features/detail/data/repos/Azkar_repos/azkar_repo_imp.dart';
import 'package:Qurane_app/Features/detail/data/repos/ahdes_repos/ahdes_repo_imp.dart';
import 'package:Qurane_app/Features/detail/data/repos/pray_time_repos/pray_time_repo_impl.dart';
import 'package:Qurane_app/core/utlity/api_service.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupServiceLocater() {
  getIt.registerSingleton<ApiServicePrayerTime>(ApiServicePrayerTime(Dio()));
  getIt.registerSingleton<PryTimeRepoImp>(
    PryTimeRepoImp(
      getIt.get<ApiServicePrayerTime>(),
    ),
  );

  getIt.registerSingleton<ApiServiceAhdes>(ApiServiceAhdes(Dio()));

  getIt.registerSingleton<AhdesRepoImp>(
      AhdesRepoImp(getIt.get<ApiServiceAhdes>()));

  getIt.registerSingleton<ApiServicesAzkar>(ApiServicesAzkar(Dio()));

  getIt.registerSingleton<AzkarRepoImp>(
      AzkarRepoImp(getIt.get<ApiServicesAzkar>()));
}
