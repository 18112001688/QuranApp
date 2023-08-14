import 'package:Qurane_app/Features/home/widget/custom_drawer_menu.dart';
import 'package:Qurane_app/Features/home/widget/custom_item.dart';
import 'package:Qurane_app/Features/home/widget/custom_last_read_item.dart';
import 'package:Qurane_app/core/constant/constent.dart';
import 'package:Qurane_app/core/utlity/images.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'My Quran',
          style: TextStyle(
            color: primaryColor,
            fontSize: 30,
            fontWeight: FontWeight.w600,
            fontFamily: 'poppins',
          ),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.menu,
            color: primaryColor,
          ),
          onPressed: () {
            _scaffoldKey.currentState?.openDrawer();
          },
        ),
      ),
      drawer: const CustomDrwer(),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: 3,
                    ),
                  ],
                ),
                const CustomLastReadItem(),
                const Padding(
                  padding: EdgeInsets.only(top: 30, right: 10),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Popular',
                      style: TextStyle(
                        color: primaryColor,
                        fontSize: 30,
                        fontFamily: 'poppins',
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    CustomItem(
                      firstColor: const Color(0xffD7BBF5),
                      text: "القرأن الكريم",
                      onTap: () {
                        GoRouter.of(context).push('/QuranReadingView');
                      },
                      image: Utlity.imagefive,
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    CustomItem(
                      firstColor: const Color(0xffFFECAF),
                      text: "الأحاديث",
                      onTap: () {
                        GoRouter.of(context).push('/AhdesView');
                      },
                      image: Utlity.imageThree,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    CustomItem(
                      firstColor: const Color(0xff78C1F3),
                      text: "الأذكار",
                      onTap: () {
                        GoRouter.of(context).push('/AzkarView');
                      },
                      image: Utlity.imageRamdan,
                    ),
                    const SizedBox(width: 30),
                    CustomItem(
                      firstColor: const Color(0xff9BE8D8),
                      text: "أوقات الصلاة",
                      onTap: () {
                        GoRouter.of(context).push('/PrayTimeView');
                      },
                      image: Utlity.imageTwo,
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
