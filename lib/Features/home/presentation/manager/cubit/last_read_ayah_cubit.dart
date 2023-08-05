import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'last_read_ayah_state.dart';

class LastReadAyahCubit extends Cubit<LastReadAyahState> {
  LastReadAyahCubit()
      : super(LastReadAyahSuccess(surahName: '', ayahNumber: 0));

  Future<void> setLastReadAyah(String surahName, int ayahNumber) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("LastReadSurhName", surahName);
    prefs.setInt("LastReadSurahNumber", ayahNumber);
    emit(LastReadAyahSuccess(surahName: surahName, ayahNumber: ayahNumber));
  }
}
