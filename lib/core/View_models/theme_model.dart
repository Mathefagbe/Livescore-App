import 'package:flutter/cupertino.dart';
import 'package:livescore_app/core/database/localdatabase.dart';

class ThemeChanger extends ChangeNotifier {
  bool theme = false;

  void switchThemes(bool value) {
    theme = value;
    notifyListeners();
  }

  void loadtheme() async {
    final newtheme = await Database.loadtheme();
    theme = newtheme;
    notifyListeners();
  }
}
