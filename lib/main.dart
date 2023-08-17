import 'package:Qurane_app/Features/home/presentation/manager/Them/them_cubit.dart';
import 'package:flutter/material.dart';
import 'package:Qurane_app/core/utlity/app_router.dart';
import 'package:Qurane_app/core/utlity/service_locater.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Features/home/presentation/manager/last_read_cubit/last_read_ayah_cubit.dart';

void main() {
  setupServiceLocater();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LastReadAyahCubit(),
        ),
        BlocProvider(
          create: (context) => ThemeCubit(),
        ),
      ],
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) {
          return MaterialApp.router(
            routerConfig: AppRouter.router,
            debugShowCheckedModeBanner: false,
            theme: ThemeData.light(),
            darkTheme: ThemeData.dark().copyWith(
              scaffoldBackgroundColor: const Color(0xff180B37),
            ),
            themeMode:
                state == ThemeState.dark ? ThemeMode.dark : ThemeMode.light,
          );
        },
      ),
    );
  }
}
