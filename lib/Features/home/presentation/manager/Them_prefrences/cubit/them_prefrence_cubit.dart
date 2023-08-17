import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'them_prefrence_state.dart';

class ThemPrefrenceCubit extends Cubit<ThemPrefrenceState> {
  ThemPrefrenceCubit() : super(ThemPrefrenceInitial());

  static const _themeKey = 'theme_key';

  static Future<bool> setTheme(bool isDark) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setBool(_themeKey, isDark);
  }

  static Future<bool> getTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_themeKey) ??
        false; // Default to light mode if not set
  }
}
