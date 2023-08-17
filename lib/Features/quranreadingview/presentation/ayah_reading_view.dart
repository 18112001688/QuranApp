import 'package:Qurane_app/core/constant/constent.dart';
import 'package:flutter/material.dart';

class AyahReadingView extends StatelessWidget {
  final String surahText;

  const AyahReadingView({super.key, required this.surahText});

  @override
  Widget build(BuildContext context) {
    final List<String> ayahs = surahText.split('\n');

    return Scaffold(
      backgroundColor: Theme.of(context).brightness == Brightness.light
          ? const Color(0xffFFEECC)
          : const Color(0xff180B37),
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: const Text(
          'بِسْمِ اللَّـهِ الرَّحْمَـٰنِ الرَّحِيمِ',
          style: TextStyle(
            fontFamily: 'me_quran',
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView.builder(
            itemCount: ayahs.length,
            itemBuilder: (context, index) {
              return Text(
                ayahs[index],
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                ),
                textAlign: TextAlign.right,
              );
            }),
      ),
    );
  }
}
