import 'package:Qurane_app/core/constant/constent.dart';
import 'package:Qurane_app/core/utlity/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);

    Future.delayed(const Duration(seconds: 2), () {
      GoRouter.of(context).pushReplacement('/HomeView');
    });
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Color(0xff180B37),
        ),
        child: Column(
          children: [
            Image.asset(Utlity.imageMousq),
            const SizedBox(
              height: 30,
            ),
            const Padding(
              padding: EdgeInsets.only(top: 150),
              child: Text(
                'القُرْآنِ والأَحَادِيثُ',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 35,
                  fontFamily: 'me_quran',
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            const Text(
              'والأَذْكَارُ',
              style: TextStyle(
                color: Colors.white,
                fontSize: 35,
                fontFamily: 'me_quran',
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
