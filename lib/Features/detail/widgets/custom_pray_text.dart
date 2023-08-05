import 'package:flutter/material.dart';

class CustomPrayTimeText extends StatelessWidget {
  const CustomPrayTimeText({super.key, required this.pray, required this.prayTime, required this.imge});
  final String pray;
  final String prayTime;
  final String imge;

  String convertTimeFormat(String time) {
    final parts = time.split(':');
    final hour = int.parse(parts[0]);

    // Remove leading zeros and convert to 12-hour format
    final convertedHour = (hour > 12) ? hour - 12 : hour;

    // Format the time as "h:mm" without leading zeros
    final formattedTime = '${convertedHour.toString()}:${parts[1].split(' ')[0]}';

    return formattedTime;
  }
@override
Widget build(BuildContext context) {
  final formattedTime = convertTimeFormat(prayTime);

  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      Image.asset(imge),
      Text(
        pray,
        style: const TextStyle(
          color: Colors.white,
          fontFamily: 'me_quran',
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
      ),
      Text(
        formattedTime,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    ],
  );
}
}
