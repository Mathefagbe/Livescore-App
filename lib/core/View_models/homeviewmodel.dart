import 'package:flutter/cupertino.dart';

class HomeviewModel extends ChangeNotifier {
  int index = 0;

  void tabswitch(int value) {
    index = value;
    notifyListeners();
  }
}
