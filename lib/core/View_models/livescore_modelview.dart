import 'package:flutter/cupertino.dart';
import 'package:livescore_app/core/constant/enums.dart';
import 'package:livescore_app/core/models/livescore.dart';
import 'package:livescore_app/core/services/data_services.dart';

class LiveMatch extends ChangeNotifier {
  LiveScore? liveScore;
  Homelog _homelogics = Homelog.inital;

  Homelog get home => _homelogics;

  LiveMatch() {
    getlivescore();
  }
  Future<void> getlivescore() async {
    try {
      _homelogics = Homelog.loading;
      liveScore = await DataServices().getliveScore();
      _homelogics = Homelog.loaded;
    } catch (e) {
      _homelogics = Homelog.error;
    }
    notifyListeners();
  }
}
