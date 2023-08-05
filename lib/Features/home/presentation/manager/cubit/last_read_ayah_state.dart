part of 'last_read_ayah_cubit.dart';

abstract class LastReadAyahState {}

class LastReadAyahInitial extends LastReadAyahState {}

class LastReadAyahSuccess extends LastReadAyahState {
  final String surahName;
  final int ayahNumber;

  LastReadAyahSuccess({required this.surahName, required this.ayahNumber});
}
