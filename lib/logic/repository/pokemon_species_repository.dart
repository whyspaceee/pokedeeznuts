import 'dart:convert';

import 'package:pokedeeznuts/logic/models/pokemon_species_model.dart';
import 'package:pokedeeznuts/logic/repository/pokemon_repository.dart';
import 'package:pokedeeznuts/util/pair.dart';

class PokemonSpeciesRepository {
  final PokemonRepository _pokemonRepository;
  PokemonSpeciesRepository(this._pokemonRepository);

  Future<Pair<List<PokemonSpeciesModel>, String>> fetchSpecies(Uri uri) async {
    final rawResponse = await _pokemonRepository.apiProvider.apiRequest(uri);
    final Map<String, dynamic> response = jsonDecode(rawResponse);
    final List<dynamic> results = response['results'];
    String next = response['next'];

    final futureModel =
        results.map((e) => (fetchSingleSpecies(Uri.parse(e['url']))));
    final models = await Future.wait(futureModel);

    return Pair(models, next);
  }

  Future<PokemonSpeciesModel> fetchSingleSpecies(Uri uri) async {
    final rawResponse = await _pokemonRepository.apiProvider.apiRequest(uri);
    final Map<String, dynamic> response = jsonDecode(rawResponse);
    final List<dynamic> varietiesResponse = response['varieties'];
    final futureVarieties = varietiesResponse
        .map((e) => _pokemonRepository
            .fetchSinglePokemon(Uri.parse(e['pokemon']['url'])))
        .toList();
    final varieties = await Future.wait(futureVarieties);
    return PokemonSpeciesModel.fromJson(response, varieties);
  }
}
