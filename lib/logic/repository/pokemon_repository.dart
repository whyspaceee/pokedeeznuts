import 'dart:convert';

import 'package:pokedeeznuts/logic/api/api_provider.dart';
import 'package:pokedeeznuts/logic/models/pokemon_model.dart';
import 'package:pokedeeznuts/util/pair.dart';

class PokemonRepository {
  final ApiProvider apiProvider;
  PokemonRepository(this.apiProvider);

  Future<Pair<List<PokemonModel>, Uri>> fetchPokemons(Uri next) async {
    final rawResponse = await apiProvider.apiRequest(next);
    final Map<String, dynamic> response = jsonDecode(rawResponse);
    final List<dynamic> results = response['results'];

    final futureModel =
        results.map((e) => (fetchSinglePokemon(Uri.parse(e['url']))));
    final models = await Future.wait(futureModel);

    return Pair(models, next);
  }

  Future<PokemonModel> fetchSinglePokemon(Uri uri) async {
    final rawResponse = await apiProvider.apiRequest(uri);
    final response = jsonDecode(rawResponse);

    final model = PokemonModel.fromJson(response);
    return model;
  }
}
