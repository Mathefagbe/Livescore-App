import 'package:flutter/cupertino.dart';
import 'package:livescore_app/core/constant/enums.dart';
import 'package:livescore_app/core/models/fixtures.dart';
import 'package:livescore_app/core/services/data_services.dart';

class Matches extends ChangeNotifier {
  Fixtures? fix;
  Homelog _homelogics = Homelog.inital;

  Homelog get home => _homelogics;

  Matches(String dateTime, String leagueId) {
    fetch(dateTime, leagueId);
  }

  Future<void> fetch(String dateTime, String leagueId) async {
    try {
      _homelogics = Homelog.loading;
      fix = await DataServices().getFixture(dateTime, leagueId);
      _homelogics = Homelog.loaded;
    } catch (e) {
      _homelogics = Homelog.error;
    }
    notifyListeners();
  }
}
