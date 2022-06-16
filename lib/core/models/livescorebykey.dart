// To parse this JSON data, do
//
//     final matchLiveScore = matchLiveScoreFromJson(jsonString);

import 'dart:convert';

MatchLiveScore matchLiveScoreFromJson(String str) =>
    MatchLiveScore.fromJson(json.decode(str));

String matchLiveScoreToJson(MatchLiveScore data) => json.encode(data.toJson());

class MatchLiveScore {
  MatchLiveScore({
    required this.success,
    required this.result,
  });

  int success;
  List<Result> result;

  factory MatchLiveScore.fromJson(Map<String, dynamic> json) => MatchLiveScore(
        success: json["success"],
        result:
            List<Result>.from(json["result"].map((x) => Result.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "result": List<dynamic>.from(result.map((x) => x.toJson())),
      };
}

class Result {
  Result({
    required this.eventKey,
    required this.eventDate,
    required this.eventTime,
    required this.eventHomeTeam,
    required this.homeTeamKey,
    required this.eventAwayTeam,
    required this.awayTeamKey,
    required this.eventHalftimeResult,
    required this.eventFinalResult,
    required this.eventFtResult,
    required this.eventPenaltyResult,
    required this.eventStatus,
    required this.countryName,
    required this.leagueName,
    required this.leagueKey,
    required this.leagueRound,
    required this.leagueSeason,
    required this.eventLive,
    required this.eventStadium,
    required this.eventReferee,
    required this.homeTeamLogo,
    required this.awayTeamLogo,
    required this.eventCountryKey,
    required this.leagueLogo,
    required this.countryLogo,
    required this.eventHomeFormation,
    required this.eventAwayFormation,
    required this.fkStageKey,
    required this.stageName,
    required this.goalscorers,
    required this.substitutes,
    required this.cards,
    required this.lineups,
    required this.statistics,
  });

  String eventKey;
  DateTime eventDate;
  String eventTime;
  String eventHomeTeam;
  String homeTeamKey;
  String eventAwayTeam;
  String awayTeamKey;
  String eventHalftimeResult;
  String eventFinalResult;
  String eventFtResult;
  String eventPenaltyResult;
  String eventStatus;
  String countryName;
  String leagueName;
  String leagueKey;
  String leagueRound;
  String leagueSeason;
  String eventLive;
  String eventStadium;
  String eventReferee;
  String homeTeamLogo;
  String awayTeamLogo;
  String eventCountryKey;
  dynamic leagueLogo;
  dynamic countryLogo;
  String eventHomeFormation;
  String eventAwayFormation;
  String fkStageKey;
  String stageName;
  List<dynamic> goalscorers;
  List<Substitute> substitutes;
  List<dynamic> cards;
  Lineups lineups;
  List<Statistic> statistics;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        eventKey: json["event_key"] ?? "",
        eventDate: DateTime.parse(json["event_date"]),
        eventTime: json["event_time"] ?? "",
        eventHomeTeam: json["event_home_team"] ?? "",
        homeTeamKey: json["home_team_key"] ?? "",
        eventAwayTeam: json["event_away_team"] ?? "",
        awayTeamKey: json["away_team_key"] ?? "",
        eventHalftimeResult: json["event_halftime_result"] ?? "",
        eventFinalResult: json["event_final_result"] ?? "",
        eventFtResult: json["event_ft_result"] ?? "",
        eventPenaltyResult: json["event_penalty_result"] ?? "",
        eventStatus: json["event_status"] ?? "",
        countryName: json["country_name"] ?? "",
        leagueName: json["league_name"] ?? "",
        leagueKey: json["league_key"] ?? "",
        leagueRound: json["league_round"] ?? "",
        leagueSeason: json["league_season"] ?? "",
        eventLive: json["event_live"] ?? "",
        eventStadium: json["event_stadium"] ?? "",
        eventReferee: json["event_referee"] ?? "",
        homeTeamLogo: json["home_team_logo"] ?? "",
        awayTeamLogo: json["away_team_logo"] ?? "",
        eventCountryKey: json["event_country_key"] ?? "",
        leagueLogo: json["league_logo"] ?? "",
        countryLogo: json["country_logo"] ?? "",
        eventHomeFormation: json["event_home_formation"] ?? "",
        eventAwayFormation: json["event_away_formation"] ?? "",
        fkStageKey: json["fk_stage_key"] ?? "",
        stageName: json["stage_name"] ?? "",
        goalscorers: List<dynamic>.from(json["goalscorers"].map((x) => x)),
        substitutes: List<Substitute>.from(
            json["substitutes"].map((x) => Substitute.fromJson(x))),
        cards: List<dynamic>.from(json["cards"].map((x) => x)),
        lineups: Lineups.fromJson(json["lineups"]),
        statistics: List<Statistic>.from(
            json["statistics"].map((x) => Statistic.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "event_key": eventKey,
        "event_date":
            "${eventDate.year.toString().padLeft(4, '0')}-${eventDate.month.toString().padLeft(2, '0')}-${eventDate.day.toString().padLeft(2, '0')}",
        "event_time": eventTime,
        "event_home_team": eventHomeTeam,
        "home_team_key": homeTeamKey,
        "event_away_team": eventAwayTeam,
        "away_team_key": awayTeamKey,
        "event_halftime_result": eventHalftimeResult,
        "event_final_result": eventFinalResult,
        "event_ft_result": eventFtResult,
        "event_penalty_result": eventPenaltyResult,
        "event_status": eventStatus,
        "country_name": countryName,
        "league_name": leagueName,
        "league_key": leagueKey,
        "league_round": leagueRound,
        "league_season": leagueSeason,
        "event_live": eventLive,
        "event_stadium": eventStadium,
        "event_referee": eventReferee,
        "home_team_logo": homeTeamLogo,
        "away_team_logo": awayTeamLogo,
        "event_country_key": eventCountryKey,
        "league_logo": leagueLogo,
        "country_logo": countryLogo,
        "event_home_formation": eventHomeFormation,
        "event_away_formation": eventAwayFormation,
        "fk_stage_key": fkStageKey,
        "stage_name": stageName,
        "goalscorers": List<dynamic>.from(goalscorers.map((x) => x)),
        "substitutes": List<dynamic>.from(substitutes.map((x) => x.toJson())),
        "cards": List<dynamic>.from(cards.map((x) => x)),
        "lineups": lineups.toJson(),
        "statistics": List<dynamic>.from(statistics.map((x) => x.toJson())),
      };
}

class Lineups {
  Lineups({
    required this.homeTeam,
    required this.awayTeam,
  });

  Team homeTeam;
  Team awayTeam;

  factory Lineups.fromJson(Map<String, dynamic> json) => Lineups(
        homeTeam: Team.fromJson(json["home_team"]),
        awayTeam: Team.fromJson(json["away_team"]),
      );

  Map<String, dynamic> toJson() => {
        "home_team": homeTeam.toJson(),
        "away_team": awayTeam.toJson(),
      };
}

class Team {
  Team({
    required this.startingLineups,
    required this.substitutes,
    required this.coaches,
    required this.missingPlayers,
  });

  List<StartingLineup> startingLineups;
  List<StartingLineup> substitutes;
  List<Coach> coaches;
  List<dynamic> missingPlayers;

  factory Team.fromJson(Map<String, dynamic> json) => Team(
        startingLineups: List<StartingLineup>.from(
            json["starting_lineups"].map((x) => StartingLineup.fromJson(x))),
        substitutes: List<StartingLineup>.from(
            json["substitutes"].map((x) => StartingLineup.fromJson(x))),
        coaches:
            List<Coach>.from(json["coaches"].map((x) => Coach.fromJson(x))),
        missingPlayers:
            List<dynamic>.from(json["missing_players"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "starting_lineups":
            List<dynamic>.from(startingLineups.map((x) => x.toJson())),
        "substitutes": List<dynamic>.from(substitutes.map((x) => x.toJson())),
        "coaches": List<dynamic>.from(coaches.map((x) => x.toJson())),
        "missing_players": List<dynamic>.from(missingPlayers.map((x) => x)),
      };
}

class Coach {
  Coach({
    required this.coache,
    required this.coacheCountry,
  });

  String coache;
  dynamic coacheCountry;

  factory Coach.fromJson(Map<String, dynamic> json) => Coach(
        coache: json["coache"],
        coacheCountry: json["coache_country"],
      );

  Map<String, dynamic> toJson() => {
        "coache": coache,
        "coache_country": coacheCountry,
      };
}

class StartingLineup {
  StartingLineup({
    required this.player,
    required this.playerNumber,
    required this.playerPosition,
    required this.playerCountry,
    required this.playerKey,
    required this.infoTime,
  });

  String player;
  String playerNumber;
  String playerPosition;
  dynamic playerCountry;
  String playerKey;
  String infoTime;

  factory StartingLineup.fromJson(Map<String, dynamic> json) => StartingLineup(
        player: json["player"],
        playerNumber: json["player_number"],
        playerPosition: json["player_position"],
        playerCountry: json["player_country"],
        playerKey: json["player_key"],
        infoTime: json["info_time"],
      );

  Map<String, dynamic> toJson() => {
        "player": player,
        "player_number": playerNumber,
        "player_position": playerPosition,
        "player_country": playerCountry,
        "player_key": playerKey,
        "info_time": infoTime,
      };
}

class Statistic {
  Statistic({
    required this.type,
    required this.home,
    required this.away,
  });

  String type;
  String home;
  String away;

  factory Statistic.fromJson(Map<String, dynamic> json) => Statistic(
        type: json["type"],
        home: json["home"],
        away: json["away"],
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "home": home,
        "away": away,
      };
}

class Substitute {
  Substitute({
    required this.time,
    required this.homeScorer,
    required this.homeAssist,
    required this.score,
    required this.awayScorer,
    required this.awayAssist,
    required this.info,
    required this.infoTime,
  });

  String time;
  dynamic homeScorer;
  String homeAssist;
  String score;
  dynamic awayScorer;
  String awayAssist;
  String info;
  String infoTime;

  factory Substitute.fromJson(Map<String, dynamic> json) => Substitute(
        time: json["time"],
        homeScorer: json["home_scorer"],
        homeAssist: json["home_assist"],
        score: json["score"],
        awayScorer: json["away_scorer"],
        awayAssist: json["away_assist"],
        info: json["info"],
        infoTime: json["info_time"],
      );

  Map<String, dynamic> toJson() => {
        "time": time,
        "home_scorer": homeScorer,
        "home_assist": homeAssist,
        "score": score,
        "away_scorer": awayScorer,
        "away_assist": awayAssist,
        "info": info,
        "info_time": infoTime,
      };
}

class AwayScorerClass {
  AwayScorerClass({
    required this.scorerIn,
    required this.out,
    required this.inId,
    required this.outId,
  });

  String scorerIn;
  String out;
  int inId;
  int outId;

  factory AwayScorerClass.fromJson(Map<String, dynamic> json) =>
      AwayScorerClass(
        scorerIn: json["in"],
        out: json["out"],
        inId: json["in_id"],
        outId: json["out_id"],
      );

  Map<String, dynamic> toJson() => {
        "in": scorerIn,
        "out": out,
        "in_id": inId,
        "out_id": outId,
      };
}
