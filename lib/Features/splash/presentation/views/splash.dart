import 'package:Qurane_app/Features/home/presentation/views/home_view.dart';
import 'package:Qurane_app/Features/splash/widgets/button.dart';
import 'package:Qurane_app/core/constant/constent.dart';
import 'package:Qurane_app/core/utlity/images.dart';
import 'package:flutter/material.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'My Quran',
              style: TextStyle(
                color: primaryColor,
                fontWeight: FontWeight.w800,
                fontSize: 35,
                fontFamily: 'Poppins',
              ),
            ),
            const Text(
              'Read the Quran with Ease',
              style: TextStyle(
                fontSize: 15,
                color: Color(0xffA8A8A8),
                fontFamily: 'Poppins',
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Stack(alignment: AlignmentDirectional.center, children: [
              Center(child: Image.asset(Utlity.imageFour)),
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Center(
                  child: Image.asset(
                    Utlity.imagefive,
                    height: 500,
                    width: 250,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 450),
                child: Button(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomeView()));
                  },
                  text: 'Get Started',
                ),
              )
            ]),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
