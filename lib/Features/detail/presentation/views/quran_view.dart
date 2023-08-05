// import 'package:Qurane_app/Features/detail/widgets/custom_ayah_item.dart';
// import 'package:Qurane_app/core/constant/constent.dart';
// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
// import 'package:quran/quran.dart' as quran;

// class QuranView extends StatelessWidget {
//   QuranView({super.key});

//   final List<String> surahNames =
//       List.generate(114, (index) => quran.getSurahNameArabic(index + 1));

//   final List<String> surahVerse =
//       List.generate(114, (index) => getSurahVerse(index + 1));

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           'الأيات',
//           style: TextStyle(
//             color: Colors.white,
//             fontFamily: 'me_quran',
//           ),
//         ),
//         backgroundColor: primaryColor,
//       ),
//       body: ScrollbarTheme(
//         data: ScrollbarThemeData(
//           thumbColor: MaterialStateProperty.all<Color>(primaryColor),
//         ),
//         child: Scrollbar(
//           thumbVisibility: true,
//           thickness: 6,
//           child: ListView.builder(
//             itemCount: surahNames.length,
//             itemBuilder: (context, index) => CustomAyahItem(
//               surahName: surahNames[index],
//               surahNumber: index + 1,
//               surahVerse: surahVerse[index],
//               onTap: () {
//                 final surahText = getSurahText(index + 1);

//                 GoRouter.of(context)
//                     .push('/QuranReadingView', extra: surahText);
//               },
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// String getSurahVerse(int surahNumber) {
//   String firstVerse = quran.getVerse(surahNumber, 1);
//   return firstVerse;
// }

// String getSurahText(int surahNumber) {
//   int verseCount = quran.getVerseCount(surahNumber);
//   String surahText = '';

//   for (int verseNumber = 1; verseNumber <= verseCount; verseNumber++) {
//     String verse = quran.getVerse(surahNumber, verseNumber);
//     String verseEndSymbol = quran.getVerseEndSymbol(verseNumber);

//     if (verseNumber == verseCount) {
//       surahText += '$verse$verseEndSymbol\n';
//     } else {
//       surahText += '$verse$verseEndSymbol ';
//     }
//   }

//   return surahText;
// }
