import 'package:flutter/cupertino.dart';
import 'package:livescore_app/core/constant/enums.dart';
import 'package:livescore_app/core/models/livescore.dart';
import 'package:livescore_app/core/models/livescorebykey.dart';
import 'package:livescore_app/core/services/data_services.dart';

class LiveScoreid extends ChangeNotifier {
  MatchLiveScore? liveScore;

  Homelog _homelogics = Homelog.inital;

  Homelog get home => _homelogics;

  LiveScoreid(String eventkey) {
    getlivescoreByKey(eventkey);
  }

  Future<void> getlivescoreByKey(String eventkey) async {
    try {
      _homelogics = Homelog.loading;
      liveScore = await DataServices().getliveScoreByEventkey(eventkey);
      _homelogics = Homelog.loaded;
    } catch (e) {
      _homelogics = Homelog.error;
    }
    notifyListeners();
  }
}
