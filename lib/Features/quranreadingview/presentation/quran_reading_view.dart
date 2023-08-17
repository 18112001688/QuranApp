import 'package:Qurane_app/Features/home/presentation/manager/last_read_cubit/last_read_ayah_cubit.dart';
import 'package:Qurane_app/Features/quranreadingview/widgets/quran_ayah_item.dart';
import 'package:Qurane_app/core/constant/constent.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:quran/quran.dart';

class QuranReadingView extends StatelessWidget {
  const QuranReadingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).brightness == Brightness.light
            ? primaryColor
            : const Color(0xff180B37),
        title: const Text(
          'القرأن الكريم',
          style: TextStyle(
            fontFamily: 'me_quran',
          ),
        ),
      ),
      body: ScrollbarTheme(
        data: const ScrollbarThemeData(
            thumbColor: MaterialStatePropertyAll(primaryColor),
            thickness: MaterialStatePropertyAll(8),
            radius: Radius.circular(4)),
        child: Scrollbar(
          thumbVisibility: true,
          child: ListView.builder(
              itemCount: 113,
              itemBuilder: ((context, index) {
                final surhName = getSurahNameArabic(index + 1);
                final surhNumber = getSurahNumberArabic(surhName);
                final firstVerse = getSurahVers(surhNumber, 1);
                final firstFiveWords = extractFirstFiveWords(firstVerse);
                return QuranAyahItem(
                  surahName: surhName,
                  surahNumber: surhNumber.toString(),
                  firstVerse: firstFiveWords,
                  onTab: () {
                    String surahName = surhName;
                    int ayahNumber = surhNumber;
                    context
                        .read<LastReadAyahCubit>()
                        .setLastReadAyah(surahName, ayahNumber);

                    GoRouter.of(context).push('/AyahReadingView',
                        extra: getSurahText(surhNumber));
                  },
                );
              })),
        ),
      ),
    );
  }
}

int getSurahNumberArabic(String surahNameArabic) {
  for (int i = 1; i <= 114; i++) {
    if (getSurahNameArabic(i) == surahNameArabic) {
      return i;
    }
  }
  return -1; // Return -1 if the Surah name is not found.
}

getSurahVers(
  surahNumber,
  numberVerse,
) {
  return getVerse(surahNumber, numberVerse);
}

String extractFirstFiveWords(String verseText) {
  // Split the verse text by spaces
  List<String> words = verseText.split(' ');

  // Take the first 8 words (or fewer if the verse has fewer than 8 words)
  int endIndex = words.length < 8 ? words.length : 8;
  String firstFiveWords = words.sublist(0, endIndex).join(' ');

  return firstFiveWords;
}

String getSurahText(int surahNumber) {
  int verseCount = getVerseCount(surahNumber);
  String surahText = '';

  for (int verseNumber = 1; verseNumber <= verseCount; verseNumber++) {
    String verse = getVerse(surahNumber, verseNumber);
    String verseEndSymbol = getVerseEndSymbol(verseNumber);

    if (verseNumber == verseCount) {
      surahText += '$verse$verseEndSymbol\n';
    } else {
      surahText += '$verse$verseEndSymbol ';
    }
  }

  return surahText.trim();
}
