import 'package:Qurane_app/core/constant/constent.dart';
import 'package:Qurane_app/core/utlity/arabic_numbers.dart';
import 'package:Qurane_app/core/utlity/images.dart';
import 'package:flutter/material.dart';

class QuranAyahItem extends StatelessWidget {
  const QuranAyahItem(
      {super.key,
      required this.surahName,
      required this.surahNumber,
      required this.firstVerse,
      required this.onTab});

  final String surahName;
  final String surahNumber;
  final String firstVerse;
  final VoidCallback onTab;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTab,
      child: Padding(
        padding: const EdgeInsets.only(top: 20, left: 10),
        child: Row(
          children: [
            Image.asset(Utlity.imageRecatngle),
            const SizedBox(
              width: 6,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.9,
              height: 80,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(12)),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    offset: Offset(2, 1.5),
                  ),
                ],
              ),
              child: Stack(alignment: Alignment.topCenter, children: [
                Positioned(
                    left: 10,
                    top: 10,
                    child: Stack(
                      children: [
                        Text(
                          surahNumber.toString().toArabicNumbers,
                          style: const TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ],
                    )),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Text(
                    surahName,
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'me_quran',
                    ),
                  ),
                ),
                Positioned(
                  top: 50,
                  child: Text(
                    firstVerse,
                    style: const TextStyle(
                      fontSize: 16,
                      color: primaryColor,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'me_quran',
                    ),
                  ),
                )
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
