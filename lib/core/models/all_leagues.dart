// To parse this JSON data, do
//
//     final leagues = leaguesFromJson(jsonString);

import 'dart:convert';

Leagues leaguesFromJson(String str) => Leagues.fromJson(json.decode(str));

String leaguesToJson(Leagues data) => json.encode(data.toJson());

class Leagues {
  Leagues({
    required this.success,
    required this.result,
  });

  int success;
  List<Result> result;

  factory Leagues.fromJson(Map<String, dynamic> json) => Leagues(
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
    required this.leagueKey,
    required this.leagueName,
    required this.countryKey,
    required this.countryName,
    required this.leagueLogo,
    required this.countryLogo,
  });

  String leagueKey;
  String leagueName;
  String countryKey;
  String countryName;
  String leagueLogo;
  String countryLogo;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        leagueKey: json["league_key"],
        leagueName: json["league_name"],
        countryKey: json["country_key"],
        countryName: json["country_name"],
        leagueLogo: json["league_logo"] ?? "",
        countryLogo: json["country_logo"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "league_key": leagueKey,
        "league_name": leagueName,
        "country_key": countryKey,
        "country_name": countryName,
        "league_logo": leagueLogo == null ? null : leagueLogo,
        "country_logo": countryLogo == null ? null : countryLogo,
      };
}
