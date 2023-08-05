import 'package:flutter/material.dart';
import 'package:Qurane_app/core/utlity/images.dart';

class CustomPrayTimeStck extends StatelessWidget {
  const CustomPrayTimeStck({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          Utlity.imageMousq,
          fit: BoxFit.fill,
          height: 300,
        ),
        const Positioned(
          top: 210,
          right: 16,
          child: Text(
            'إنَّ بيْنَ الرَّجُلِ وبيْنَ الشِّرْكِ والْكُفْرِ تَرْكَ الصَّلاةِ',
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontFamily: 'me_quran'),
          ),
        ),
        const Positioned(
          top: 70,
          left: 130,
          child: Text(
            'مواعيد الصلأة',
            style: TextStyle(
                color: Colors.white, fontSize: 22, fontFamily: 'me_quran'),
          ),
        )
      ],
    );
  }
}
