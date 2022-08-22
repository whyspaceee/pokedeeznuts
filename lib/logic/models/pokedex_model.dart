import 'package:pokedeeznuts/logic/models/pokemon_species_model.dart';

class PokedexModel {
  String description;
  String name;
  String? region;
  List<PokemonSpeciesModel> entries;

  PokedexModel(
      {required this.description,
      required this.name,
      required this.region,
      required this.entries});
}
