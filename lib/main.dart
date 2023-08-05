import 'package:flutter/material.dart';
import 'package:Qurane_app/core/utlity/app_router.dart';
import 'package:Qurane_app/core/utlity/service_locater.dart';

void main() {
  setupServiceLocater();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRouter.router,
      debugShowCheckedModeBanner: false,
    );
  }
}
