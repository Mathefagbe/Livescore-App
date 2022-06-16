// To parse this JSON data, do
//
//     final fixtures = fixturesFromJson(jsonString);

import 'dart:convert';

Fixtures fixturesFromJson(String str) => Fixtures.fromJson(json.decode(str));

String fixturesToJson(Fixtures data) => json.encode(data.toJson());

class Fixtures {
  Fixtures({
    required this.success,
    required this.result,
  });

  int success;
  List<Result> result;

  factory Fixtures.fromJson(Map<String, dynamic> json) => Fixtures(
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
  EventHalftimeResult? eventHalftimeResult;
  String eventFinalResult;
  String eventFtResult;
  EventPenaltyResult eventPenaltyResult;
  EventStatus eventStatus;
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
  EventFormation? eventHomeFormation;
  EventFormation? eventAwayFormation;
  String fkStageKey;
  String stageName;
  List<CardElement> cards;
  Lineups lineups;
  List<Statistic> statistics;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        eventKey: json["event_key"],
        eventDate: DateTime.parse(json["event_date"]),
        eventTime: json["event_time"],
        eventHomeTeam: json["event_home_team"],
        homeTeamKey: json["home_team_key"],
        eventAwayTeam: json["event_away_team"],
        awayTeamKey: json["away_team_key"] ?? "",
        eventHalftimeResult:
            eventHalftimeResultValues.map![json["event_halftime_result"]],
        eventFinalResult: json["event_final_result"] ?? "",
        eventFtResult: json["event_ft_result"] ?? "",
        eventPenaltyResult:
            eventPenaltyResultValues.map![json["event_penalty_result"]] ??
                EventPenaltyResult.EMPTY,
        eventStatus:
            eventStatusValues.map![json["event_status"]] ?? EventStatus.EMPTY,
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
        eventHomeFormation:
            eventFormationValues.map![json["event_home_formation"]],
        eventAwayFormation:
            eventFormationValues.map![json["event_away_formation"]],
        fkStageKey: json["fk_stage_key"] ?? "",
        stageName: json["stage_name"] ?? "",
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
        "event_halftime_result":
            eventHalftimeResultValues.reverse![eventHalftimeResult],
        "event_final_result": eventFinalResult,
        "event_ft_result": eventFtResult,
        "event_penalty_result":
            eventPenaltyResultValues.reverse![eventPenaltyResult],
        "event_status": eventStatusValues.reverse![eventStatus],
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
        "event_home_formation":
            eventFormationValues.reverse![eventHomeFormation],
        "event_away_formation":
            eventFormationValues.reverse![eventAwayFormation],
        "fk_stage_key": fkStageKey,
        "stage_name": stageName,
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
  CardEnum? card;
  String awayFault;
  Info? info;
  String homePlayerId;
  String awayPlayerId;
  InfoTime? infoTime;

  factory CardElement.fromJson(Map<String, dynamic> json) => CardElement(
        time: json["time"],
        homeFault: json["home_fault"],
        card: cardEnumValues.map![json["card"]],
        awayFault: json["away_fault"],
        info: infoValues.map![json["info"]],
        homePlayerId: json["home_player_id"],
        awayPlayerId: json["away_player_id"],
        infoTime: infoTimeValues.map![json["info_time"]],
      );

  Map<String, dynamic> toJson() => {
        "time": time,
        "home_fault": homeFault,
        "card": cardEnumValues.reverse![card],
        "away_fault": awayFault,
        "info": infoValues.reverse![info],
        "home_player_id": homePlayerId,
        "away_player_id": awayPlayerId,
        "info_time": infoTimeValues.reverse![infoTime],
      };
}

enum CardEnum { YELLOW_CARD, RED_CARD }

final cardEnumValues = EnumValues(
    {"red card": CardEnum.RED_CARD, "yellow card": CardEnum.YELLOW_CARD});

enum Info { EMPTY, AWAY, HOME }

final infoValues =
    EnumValues({"away": Info.AWAY, "": Info.EMPTY, "home": Info.HOME});

enum InfoTime { THE_2_ND_HALF, THE_1_ST_HALF }

final infoTimeValues = EnumValues(
    {"1st Half": InfoTime.THE_1_ST_HALF, "2nd Half": InfoTime.THE_2_ND_HALF});

enum EventFormation {
  THE_4231,
  THE_343,
  EMPTY,
  THE_433,
  THE_442,
  THE_451,
  THE_352,
  THE_3421,
  THE_3142,
  THE_4141,
  THE_532,
  THE_4411,
  THE_3412,
  THE_541
}

final eventFormationValues = EnumValues({
  "": EventFormation.EMPTY,
  "3-1-4-2": EventFormation.THE_3142,
  "3-4-1-2": EventFormation.THE_3412,
  "3-4-2-1": EventFormation.THE_3421,
  "3-4-3": EventFormation.THE_343,
  "3-5-2": EventFormation.THE_352,
  "4-1-4-1": EventFormation.THE_4141,
  "4-2-3-1": EventFormation.THE_4231,
  "4-3-3": EventFormation.THE_433,
  "4-4-1-1": EventFormation.THE_4411,
  "4-4-2": EventFormation.THE_442,
  "4-5-1": EventFormation.THE_451,
  "5-3-2": EventFormation.THE_532,
  "5-4-1": EventFormation.THE_541
});

enum EventHalftimeResult {
  THE_11,
  THE_00,
  THE_01,
  EMPTY,
  THE_10,
  THE_02,
  THE_20,
  THE_40,
  THE_21,
  THE_30,
  THE_12,
  THE_22,
  THE_23,
  THE_24,
  THE_50,
  THE_41,
  THE_03,
  THE_04,
  EVENT_HALFTIME_RESULT,
  THE_31,
  THE_32,
  THE_51,
  THE_14,
  THE_80
}

final eventHalftimeResultValues = EnumValues({
  "": EventHalftimeResult.EMPTY,
  " - ": EventHalftimeResult.EVENT_HALFTIME_RESULT,
  "0 - 0": EventHalftimeResult.THE_00,
  "0 - 1": EventHalftimeResult.THE_01,
  "0 - 2": EventHalftimeResult.THE_02,
  "0 - 3": EventHalftimeResult.THE_03,
  "0 - 4": EventHalftimeResult.THE_04,
  "1 - 0": EventHalftimeResult.THE_10,
  "1 - 1": EventHalftimeResult.THE_11,
  "1 - 2": EventHalftimeResult.THE_12,
  "1 - 4": EventHalftimeResult.THE_14,
  "2 - 0": EventHalftimeResult.THE_20,
  "2 - 1": EventHalftimeResult.THE_21,
  "2 - 2": EventHalftimeResult.THE_22,
  "2 - 3": EventHalftimeResult.THE_23,
  "2 - 4": EventHalftimeResult.THE_24,
  "3 - 0": EventHalftimeResult.THE_30,
  "3 - 1": EventHalftimeResult.THE_31,
  "3 - 2": EventHalftimeResult.THE_32,
  "4 - 0": EventHalftimeResult.THE_40,
  "4 - 1": EventHalftimeResult.THE_41,
  "5 - 0": EventHalftimeResult.THE_50,
  "5 - 1": EventHalftimeResult.THE_51,
  "8 - 0": EventHalftimeResult.THE_80
});

enum EventPenaltyResult {
  EMPTY,
  THE_24,
  THE_42,
  THE_43,
  THE_53,
  THE_76,
  THE_03
}

final eventPenaltyResultValues = EnumValues({
  "": EventPenaltyResult.EMPTY,
  "0 - 3": EventPenaltyResult.THE_03,
  "2 - 4": EventPenaltyResult.THE_24,
  "4 - 2": EventPenaltyResult.THE_42,
  "4 - 3": EventPenaltyResult.THE_43,
  "5 - 3": EventPenaltyResult.THE_53,
  "7 - 6": EventPenaltyResult.THE_76
});

enum EventStatus {
  FINISHED,
  POSTPONED,
  EMPTY,
  CANCELLED,
  AWARDED,
  AFTER_PEN,
  AFTER_ET
}

final eventStatusValues = EnumValues({
  "After ET": EventStatus.AFTER_ET,
  "After Pen.": EventStatus.AFTER_PEN,
  "Awarded": EventStatus.AWARDED,
  "Cancelled": EventStatus.CANCELLED,
  "": EventStatus.EMPTY,
  "Finished": EventStatus.FINISHED,
  "Postponed": EventStatus.POSTPONED
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

  Type? type;
  String home;
  String away;

  factory Statistic.fromJson(Map<String, dynamic> json) => Statistic(
        type: typeValues.map![json["type"]],
        home: json["home"],
        away: json["away"],
      );

  Map<String, dynamic> toJson() => {
        "type": typeValues.reverse![type],
        "home": home,
        "away": away,
      };
}

enum Type {
  SUBSTITUTION,
  ATTACKS,
  DANGEROUS_ATTACKS,
  ON_TARGET,
  OFF_TARGET,
  SHOTS_TOTAL,
  SHOTS_ON_GOAL,
  SHOTS_OFF_GOAL,
  SHOTS_BLOCKED,
  SHOTS_INSIDE_BOX,
  SHOTS_OUTSIDE_BOX,
  FOULS,
  CORNERS,
  OFFSIDES,
  BALL_POSSESSION,
  YELLOW_CARDS,
  SAVES,
  PASSES_TOTAL,
  PASSES_ACCURATE,
  RED_CARDS,
  THROW_IN,
  FREE_KICK,
  GOAL_KICK,
  PENALTY
}

final typeValues = EnumValues({
  "Attacks": Type.ATTACKS,
  "Ball Possession": Type.BALL_POSSESSION,
  "Corners": Type.CORNERS,
  "Dangerous Attacks": Type.DANGEROUS_ATTACKS,
  "Fouls": Type.FOULS,
  "Free Kick": Type.FREE_KICK,
  "Goal Kick": Type.GOAL_KICK,
  "Offsides": Type.OFFSIDES,
  "Off Target": Type.OFF_TARGET,
  "On Target": Type.ON_TARGET,
  "Passes Accurate": Type.PASSES_ACCURATE,
  "Passes Total": Type.PASSES_TOTAL,
  "Penalty": Type.PENALTY,
  "Red Cards": Type.RED_CARDS,
  "Saves": Type.SAVES,
  "Shots Blocked": Type.SHOTS_BLOCKED,
  "Shots Inside Box": Type.SHOTS_INSIDE_BOX,
  "Shots Off Goal": Type.SHOTS_OFF_GOAL,
  "Shots On Goal": Type.SHOTS_ON_GOAL,
  "Shots Outside Box": Type.SHOTS_OUTSIDE_BOX,
  "Shots Total": Type.SHOTS_TOTAL,
  "Substitution": Type.SUBSTITUTION,
  "Throw In": Type.THROW_IN,
  "Yellow Cards": Type.YELLOW_CARDS
});

class EnumValues<T> {
  Map<String, T>? map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String>? get reverse {
    if (reverseMap == null) {
      reverseMap = map?.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
