import 'package:pokedeeznuts/logic/models/pokemon_model.dart';

class PokemonSpeciesModel {
  List<PokemonModel> varieties;
  String color;
  int baseHappiness;
  int captureRate;
  String flavorText;
  String genera;
  String growthRate;
  String habitat;
  int id;
  String name;
  String shape;

  PokemonSpeciesModel(
      {required this.varieties,
      required this.color,
      required this.baseHappiness,
      required this.captureRate,
      required this.flavorText,
      required this.genera,
      required this.growthRate,
      required this.habitat,
      required this.id,
      required this.name,
      required this.shape});

  factory PokemonSpeciesModel.fromJson(
      Map<String, dynamic> json, List<PokemonModel> varieties) {
    return PokemonSpeciesModel(
        varieties: varieties,
        color: json['color']['name'] != null
            ? json['color']['name'].toString()
            : "none",
        baseHappiness: json['base_happiness'] ?? 0,
        captureRate: json['capture_rate'] ?? 0,
        flavorText: (json['flavor_text_entries'] as List<dynamic>)
            .cast<Map<String, dynamic>>()
            .where((element) => element['language']['name'] == "en")
            .first['flavor_text']
            .toString(),
        genera: json['genera'][7]['genus'] != null
            ? json['genera'][7]['genus'].toString()
            : "none",
        growthRate: json['growth_rate']['name'] != null
            ? json['growth_rate']['name'].toString()
            : "none",
        habitat: json['habitat']['name'] != null
            ? json['habitat']['name'].toString()
            : "none",
        id: json['id'] ?? 0,
        name: json['name'] != null ? json['name'].toString() : "none",
        shape: json['shape']['name'] != null
            ? json['shape']['name'].toString()
            : "none");
  }
}
