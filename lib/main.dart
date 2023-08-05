import 'package:Qurane_app/Features/home/presentation/manager/cubit/last_read_ayah_cubit.dart';
import 'package:flutter/material.dart';
import 'package:Qurane_app/core/utlity/app_router.dart';
import 'package:Qurane_app/core/utlity/service_locater.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  setupServiceLocater();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LastReadAyahCubit(),
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
