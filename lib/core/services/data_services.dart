import 'dart:convert';
import 'package:livescore_app/core/View_models/livescoreBymatchKey.dart';
import 'package:livescore_app/core/constant/strings.dart';
import 'package:livescore_app/core/models/all_leagues.dart';
import 'package:livescore_app/core/models/fixtures.dart';
import 'package:http/http.dart' as http;
import 'package:livescore_app/core/models/livescore.dart';
import 'package:livescore_app/core/models/livescorebykey.dart';

class DataServices {
  //get fixture based on leaguekey
  Future<Fixtures> getFixture(String dateTime, String leagueId) async {
    var fixture;
    try {
      var res = await http.get(Uri.parse(
          "https://apiv2.allsportsapi.com/football/?met=Fixtures&APIkey=$keys&from=$dateTime&to=$dateTime&leagueId=$leagueId"));
      if (res.statusCode == 200) {
        var jsonstring = res.body;
        var jsonmap = jsonDecode(jsonstring);
        Fixtures fixture = Fixtures.fromJson(jsonmap);

        return fixture;
      }
    } catch (e) {
      throw Exception(e);
    }
    return fixture;
  }

//all games fixture
  Future<Fixtures> getALLFixture(String dateTime) async {
    var allfixture;
    try {
      var res = await http.get(Uri.parse(
          "https://apiv2.allsportsapi.com/football/?met=Fixtures&APIkey=$keys&from=$dateTime&to=$dateTime"));
      if (res.statusCode == 200) {
        var jsonstring = res.body;
        var jsonmap = jsonDecode(jsonstring);
        Fixtures allfixture = Fixtures.fromJson(jsonmap);

        return allfixture;
      }
    } catch (e) {
      throw Exception(e);
    }
    return allfixture;
  }

//all leagues
  Future<Leagues> getleague(String dateTime) async {
    var league;
    try {
      var res = await http.get(Uri.parse(
          "https://apiv2.allsportsapi.com/football/?met=Leagues&APIkey=$keys&from=$dateTime&to=$dateTime"));
      if (res.statusCode == 200) {
        var jsonstring = res.body;
        var jsonmap = jsonDecode(jsonstring);
        Leagues league = Leagues.fromJson(jsonmap);

        return league;
      }
    } catch (e) {
      throw Exception(e);
    }
    return league;
  }

//all live score matches
  Future<LiveScore> getliveScore() async {
    var livescore;
    try {
      var res = await http.get(Uri.parse(
          "https://apiv2.allsportsapi.com/football/?met=Livescore&APIkey=$keys"));
      if (res.statusCode == 200) {
        var jsonstring = res.body;
        var jsonmap = jsonDecode(jsonstring);
        LiveScore liveScore = LiveScore.fromJson(jsonmap);
        return liveScore;
      }
    } catch (e) {
      throw Exception(e);
    }
    return livescore;
  }

//get live score by event key
  Future<MatchLiveScore> getliveScoreByEventkey(String eventkey) async {
    var livescoreByKey;
    try {
      var res = await http.get(Uri.parse(
          "https://apiv2.allsportsapi.com/football/?met=Livescore&APIkey=$keys&matchId=$eventkey"));
      if (res.statusCode == 200) {
        var jsonstring = res.body;
        var jsonmap = jsonDecode(jsonstring);
        MatchLiveScore liveScoreByKey = MatchLiveScore.fromJson(jsonmap);

        return liveScoreByKey;
      }
    } catch (e) {
      throw Exception(e);
    }
    return livescoreByKey;
  }
}
