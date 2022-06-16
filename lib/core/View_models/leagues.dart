import 'package:flutter/cupertino.dart';
import 'package:livescore_app/core/View_models/leaguematches.dart';
import 'package:livescore_app/core/constant/enums.dart';
import 'package:livescore_app/core/constant/strings.dart';
import 'package:livescore_app/core/models/all_leagues.dart';
import 'package:livescore_app/core/models/fixtures.dart';
import 'package:livescore_app/core/services/data_services.dart';

class Leagus extends ChangeNotifier {
  Leagues? leagus;
  Homelog _homelogics = Homelog.inital;

  Homelog get home => _homelogics;

  Leagus(String dateTime) {
    fetchLeagues(dateTime);
  }

  Future<void> fetchLeagues(String dateTime) async {
    try {
      _homelogics = Homelog.loading;
      leagus = await DataServices().getleague(dateTime);
      _homelogics = Homelog.loaded;
    } catch (e) {
      _homelogics = Homelog.error;
    }
    notifyListeners();
  }
}
