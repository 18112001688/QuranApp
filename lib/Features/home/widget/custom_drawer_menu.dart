import 'package:Qurane_app/core/constant/constent.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomDrwer extends StatelessWidget {
  const CustomDrwer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: primaryColor,
            ),
            child: Padding(
              padding: EdgeInsets.only(top: 20),
              child: Text(
                "يَا أَيُّهَا الَّذِينَ آمَنُوا إِذَا لَقِيتُمْ فِئَةً فَاثْبُتُوا وَاذْكُرُوا اللَّهَ كَثِيرًا لَعَلَّكُمْ تُفْلِحُونَ",
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'me_quran',
                  fontSize: 24,
                ),
              ),
            ),
          ),
          ListTile(
            title: const Text(
              'القرأن الكريم',
              style: TextStyle(
                fontFamily: 'me_quran',
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
            onTap: () {
              GoRouter.of(context).push('/QuranReadingView');
            },
          ),
          ListTile(
            title: const Text(
              'الأحاديث',
              style: TextStyle(
                fontFamily: 'me_quran',
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
            onTap: () {
              GoRouter.of(context).push('/AhdesView');
            },
          ),
          ListTile(
            title: const Text(
              'الأذكار',
              style: TextStyle(
                fontFamily: 'me_quran',
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
            onTap: () {
              GoRouter.of(context).push('/AzkarView');
            },
          ),
          ListTile(
            title: const Text(
              'أوقات الصلاة',
              style: TextStyle(
                fontFamily: 'me_quran',
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
            onTap: () {
              GoRouter.of(context).push('/PrayTimeView');
            },
          ),
        ],
      ),
    );
  }
}
