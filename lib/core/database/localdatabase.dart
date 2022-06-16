import 'package:livescore_app/core/View_models/theme_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Database {
  static Future<void> savethemes(bool themes) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setBool("themes", themes);
  }

  static Future<bool> loadtheme() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    bool retrivetheme = sharedPreferences.getBool("themes") ?? false;

    return retrivetheme;
  }
}
