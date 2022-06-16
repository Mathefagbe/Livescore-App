// To parse this JSON data, do
//
//     final liveScore = liveScoreFromJson(jsonString);

import 'dart:convert';

LiveScore liveScoreFromJson(String str) => LiveScore.fromJson(json.decode(str));

String liveScoreToJson(LiveScore data) => json.encode(data.toJson());

class LiveScore {
  LiveScore({
    required this.success,
    required this.result,
  });

  int success;
  List<Result> result;

  factory LiveScore.fromJson(Map<String, dynamic> json) => LiveScore(
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
  String leagueLogo;
  String countryLogo;
  String eventHomeFormation;
  String eventAwayFormation;
  String fkStageKey;
  String stageName;
  List<Goalscorer> goalscorers;
  List<Substitute> substitutes;
  List<CardElement> cards;
  Lineups lineups;
  List<Statistic> statistics;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        eventKey: json["event_key"],
        eventDate: DateTime.parse(json["event_date"]),
        eventTime: json["event_time"] ?? "",
        eventHomeTeam: json["event_home_team"] ?? "",
        homeTeamKey: json["home_team_key"] ?? "",
        eventAwayTeam: json["event_away_team"] ?? "",
        awayTeamKey: json["away_team_key"] ?? "",
        eventHalftimeResult: json["event_halftime_result"] ?? "",
        eventFinalResult: json["event_final_result"] ?? '',
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
        eventHomeFormation: json["event_home_formation"],
        eventAwayFormation: json["event_away_formation"],
        fkStageKey: json["fk_stage_key"] ?? "",
        stageName: json["stage_name"] ?? "",
        goalscorers: List<Goalscorer>.from(
            json["goalscorers"].map((x) => Goalscorer.fromJson(x))),
        substitutes: List<Substitute>.from(
            json["substitutes"].map((x) => Substitute.fromJson(x))),
        cards: List<CardElement>.from(
            json["cards"].map((x) => CardElement.fromJson(x))),
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
        "league_logo": leagueLogo == null ? null : leagueLogo,
        "country_logo": countryLogo,
        "event_home_formation": eventHomeFormation,
        "event_away_formation": eventAwayFormation,
        "fk_stage_key": fkStageKey == null ? null : fkStageKey,
        "stage_name": stageName == null ? null : stageName,
        "goalscorers": List<dynamic>.from(goalscorers.map((x) => x.toJson())),
        "substitutes": List<dynamic>.from(substitutes.map((x) => x.toJson())),
        "cards": List<dynamic>.from(cards.map((x) => x.toJson())),
        "lineups": lineups.toJson(),
        "statistics": List<dynamic>.from(statistics.map((x) => x.toJson())),
      };
}

class CardElement {
  CardElement({
    required this.time,
    required this.homeFault,
    required this.card,
    required this.awayFault,
    required this.info,
    required this.homePlayerId,
    required this.awayPlayerId,
    required this.infoTime,
  });

  String time;
  String homeFault;
  CardEnum card;
  String awayFault;
  CardInfo info;
  String homePlayerId;
  String awayPlayerId;
  InfoTime infoTime;

  factory CardElement.fromJson(Map<String, dynamic> json) => CardElement(
        time: json["time"],
        homeFault: json["home_fault"],
        card: cardEnumValues.map[json["card"]] ?? CardEnum.YELLOW_CARD,
        awayFault: json["away_fault"],
        info: cardInfoValues.map[json["info"]] ?? CardInfo.EMPTY,
        homePlayerId: json["home_player_id"],
        awayPlayerId: json["away_player_id"],
        infoTime:
            infoTimeValues.map[json["info_time"]] ?? InfoTime.THE_1_ST_HALF,
      );

  Map<String, dynamic> toJson() => {
        "time": time,
        "home_fault": homeFault,
        "card": cardEnumValues.reverse[card],
        "away_fault": awayFault,
        "info": cardInfoValues.reverse[info],
        "home_player_id": homePlayerId,
        "away_player_id": awayPlayerId,
        "info_time": infoTimeValues.reverse[infoTime],
      };
}

enum CardEnum { YELLOW_CARD }

final cardEnumValues = EnumValues({"yellow card": CardEnum.YELLOW_CARD});

enum CardInfo { EMPTY, HOME, AWAY }

final cardInfoValues = EnumValues(
    {"away": CardInfo.AWAY, "": CardInfo.EMPTY, "home": CardInfo.HOME});

enum InfoTime { THE_1_ST_HALF, THE_2_ND_HALF }

final infoTimeValues = EnumValues(
    {"1st Half": InfoTime.THE_1_ST_HALF, "2nd Half": InfoTime.THE_2_ND_HALF});

class Goalscorer {
  Goalscorer({
    required this.time,
    required this.homeScorer,
    required this.homeScorerId,
    required this.homeAssist,
    required this.homeAssistId,
    required this.score,
    required this.awayScorer,
    required this.awayScorerId,
    required this.awayAssist,
    required this.awayAssistId,
    required this.info,
    required this.infoTime,
  });

  String time;
  String homeScorer;
  String homeScorerId;
  HomeAssist homeAssist;
  String homeAssistId;
  String score;
  String awayScorer;
  String awayScorerId;
  AwayAssist awayAssist;
  AwayAssistId awayAssistId;
  GoalscorerInfo info;
  InfoTime infoTime;

  factory Goalscorer.fromJson(Map<String, dynamic> json) => Goalscorer(
        time: json["time"],
        homeScorer: json["home_scorer"],
        homeScorerId: json["home_scorer_id"],
        homeAssist:
            homeAssistValues.map[json["home_assist"]] ?? HomeAssist.EMPTY,
        homeAssistId: json["home_assist_id"],
        score: json["score"],
        awayScorer: json["away_scorer"],
        awayScorerId: json["away_scorer_id"],
        awayAssist:
            awayAssistValues.map[json["away_assist"]] ?? AwayAssist.EMPTY,
        awayAssistId: awayAssistIdValues.map[json["away_assist_id"]] ??
            AwayAssistId.EMPTY,
        info: goalscorerInfoValues.map[json["info"]] ?? GoalscorerInfo.EMPTY,
        infoTime:
            infoTimeValues.map[json["info_time"]] ?? InfoTime.THE_1_ST_HALF,
      );

  Map<String, dynamic> toJson() => {
        "time": time,
        "home_scorer": homeScorer,
        "home_scorer_id": homeScorerId,
        "home_assist": homeAssistValues.reverse[homeAssist],
        "home_assist_id": homeAssistId,
        "score": score,
        "away_scorer": awayScorer,
        "away_scorer_id": awayScorerId,
        "away_assist": awayAssistValues.reverse[awayAssist],
        "away_assist_id": awayAssistIdValues.reverse[awayAssistId],
        "info": goalscorerInfoValues.reverse[info],
        "info_time": infoTimeValues.reverse[infoTime],
      };
}

enum AwayAssist { RODRIGO_LINDOSO, EMPTY, D_TERANS }

final awayAssistValues = EnumValues({
  "D. Terans": AwayAssist.D_TERANS,
  "": AwayAssist.EMPTY,
  "Rodrigo Lindoso": AwayAssist.RODRIGO_LINDOSO
});

enum AwayAssistId { THE_2181284853, EMPTY, THE_2704572241 }

final awayAssistIdValues = EnumValues({
  "": AwayAssistId.EMPTY,
  "2181284853": AwayAssistId.THE_2181284853,
  "2704572241": AwayAssistId.THE_2704572241
});

enum HomeAssist { EMPTY, NETO_MOURA, L_MIRANDA }

final homeAssistValues = EnumValues({
  "": HomeAssist.EMPTY,
  "L. Miranda": HomeAssist.L_MIRANDA,
  "Neto Moura": HomeAssist.NETO_MOURA
});

enum GoalscorerInfo { EMPTY, AWAY, PENALTY }

final goalscorerInfoValues = EnumValues({
  "away": GoalscorerInfo.AWAY,
  "": GoalscorerInfo.EMPTY,
  "Penalty": GoalscorerInfo.PENALTY
});

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
  Score score;
  dynamic awayScorer;
  String awayAssist;
  String info;
  InfoTime infoTime;

  factory Substitute.fromJson(Map<String, dynamic> json) => Substitute(
        time: json["time"],
        homeScorer: json["home_scorer"],
        homeAssist: json["home_assist"],
        score: scoreValues.map[json["score"]] ?? Score.SUBSTITUTION,
        awayScorer: json["away_scorer"],
        awayAssist: json["away_assist"],
        info: json["info"],
        infoTime:
            infoTimeValues.map[json["info_time"]] ?? InfoTime.THE_1_ST_HALF,
      );

  Map<String, dynamic> toJson() => {
        "time": time,
        "home_scorer": homeScorer,
        "home_assist": homeAssist,
        "score": scoreValues.reverse[score],
        "away_scorer": awayScorer,
        "away_assist": awayAssist,
        "info": info,
        "info_time": infoTimeValues.reverse[infoTime],
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

enum Score { SUBSTITUTION }

final scoreValues = EnumValues({"substitution": Score.SUBSTITUTION});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap ?? {};
  }
}
