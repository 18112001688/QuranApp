import 'package:Qurane_app/Features/detail/data/repos/Azkar_repos/azkar_repo_imp.dart';
import 'package:Qurane_app/Features/detail/data/repos/ahdes_repos/ahdes_repo_imp.dart';
import 'package:Qurane_app/Features/detail/data/repos/pray_time_repos/pray_time_repo_impl.dart';
import 'package:Qurane_app/Features/detail/presentation/manager/ahdes_cubit/ahdes_cubit.dart';
import 'package:Qurane_app/Features/detail/presentation/manager/azkar_cubit/azkar_cubit.dart';
import 'package:Qurane_app/Features/detail/presentation/manager/pray_time_cubit/pray_time_cubit.dart';
import 'package:Qurane_app/Features/detail/presentation/views/ahdes_view.dart';
import 'package:Qurane_app/Features/detail/presentation/views/azkar_view.dart';
import 'package:Qurane_app/Features/detail/presentation/views/pray_time_view.dart';
import 'package:Qurane_app/Features/home/presentation/views/home_view.dart';
import 'package:Qurane_app/Features/quranreadingview/presentation/ayah_reading_view.dart';
import 'package:Qurane_app/Features/quranreadingview/presentation/quran_reading_view.dart';
import 'package:Qurane_app/Features/splash/presentation/views/splash.dart';
import 'package:Qurane_app/core/utlity/service_locater.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: "/",
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: "/HomeView",
        builder: (context, state) => HomeView(),
      ),
      // GoRoute(
      //   path: "/QuranView",
      //   builder: (context, state) => QuranView(),
      // ),
      GoRoute(
        path: "/AhdesView",
        builder: (context, state) => BlocProvider(
          create: (context) =>
              AhdesCubit(ahdesRepoImp: getIt.get<AhdesRepoImp>())
                ..fetchAhdesData(),
          child: const AhdesView(),
        ),
      ),
      GoRoute(
        path: "/PrayTimeView",
        builder: (context, state) => BlocProvider(
          create: (context) =>
              PrayTimeCubit(pryTimeRepo: getIt.get<PryTimeRepoImp>())
                ..fetchPrayTime(),
          child: const PrayTimeView(),
        ),
      ),
      GoRoute(
        path: "/AzkarView",
        builder: (context, state) => BlocProvider(
          create: (context) =>
              AzkarCubit(azkarRepoImp: getIt.get<AzkarRepoImp>())
                ..fetchAzkarData(),
          child: const AzkarView(),
        ),
      ),
      GoRoute(
        path: "/QuranReadingView",
        builder: (context, state) {
          return const QuranReadingView();
        },
      ),

      GoRoute(
        path: "/AyahReadingView",
        builder: (context, state) {
          final surahText = state.extra;

          return AyahReadingView(surahText: surahText.toString());
        },
      ),
    ],
  );
}
