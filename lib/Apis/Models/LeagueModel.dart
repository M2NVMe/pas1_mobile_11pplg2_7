import 'package:get/get.dart';

class League {
  RxBool isSaved = false.obs;
  String strBadge;
  String strTeam;
  String strLeague;
  String strDescriptionEN;

  League({
    required this.strBadge,
    required this.strTeam,
    required this.strLeague,
    required this.strDescriptionEN,
  });

  factory League.fromJson(Map<String, dynamic> json) => League(
    strBadge: json["strBadge"],
    strTeam: json["strTeam"],
    strLeague: json["strLeague"],
    strDescriptionEN: json["strDescriptionEN"],
  );
}
