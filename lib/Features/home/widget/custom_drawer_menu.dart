import 'package:Qurane_app/Features/home/presentation/manager/Them/them_cubit.dart';
import 'package:Qurane_app/core/constant/constent.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class CustomDrwer extends StatelessWidget {
  const CustomDrwer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).brightness == Brightness.light
          ? Colors.white
          : const Color(0xff180B37),
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).brightness == Brightness.light
                  ? primaryColor
                  : const Color(0xff180B37),
            ),
            child: const Padding(
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
          SwitchListTile(
            title: const Text(
              'الوضع الليلي',
              style: TextStyle(
                fontFamily: 'me_quran',
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
            value: context.watch<ThemeCubit>().state == ThemeState.dark,
            onChanged: (value) {
              BlocProvider.of<ThemeCubit>(context).toggleTheme();
            },
          ),
        ],
      ),
    );
  }
}
