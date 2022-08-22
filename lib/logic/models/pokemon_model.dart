import 'package:pokedeeznuts/logic/models/stats_model.dart';

class PokemonModel {
  int id;
  List<String> abilities;
  String name;
  List<StatsModel> stats;
  List<String> type;
  int weight;
  int height;
  String spriteUrl;

  PokemonModel(
      {required this.id,
      required this.abilities,
      required this.name,
      required this.stats,
      required this.type,
      required this.weight,
      required this.height,
      required this.spriteUrl});

  factory PokemonModel.fromJson(Map<String, dynamic> json) {
    List<dynamic> statsJSON = json['stats'];
    List<dynamic> typesJSON = json['types'];
    List<dynamic> abilitiesJSON = json['abilities'];
    return PokemonModel(
      id: json['id'] as int,
      abilities: abilitiesJSON
          .cast<Map<String, dynamic>>()
          .where((element) => element['ability']['name'] != null)
          .map((e) => e['ability']['name'].toString())
          .toList(),
      name: json['name'].toString(),
      stats: statsJSON
          .cast<Map<String, dynamic>>()
          .where((e) =>
              e['base_stat'] != null &&
              e['effort'] != null &&
              e['stat']['name'] != null &&
              e['stat']['url'] != null)
          .map((e) => StatsModel(
              e['base_stat'], e['effort'], e['stat']['name'], e['stat']['url']))
          .toList(),
      type: typesJSON
          .cast<Map<String, dynamic>>()
          .where((e) => e['type']['name'] != null)
          .map((e) => e['type']['name'].toString())
          .toList(),
      weight: json['weight'] as int,
      height: json['height'] as int,
      spriteUrl: json['sprites']['other']['official-artwork']['front_default']
          .toString(),
    );
  }
}
