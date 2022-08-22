part of 'species_page_cubit.dart';

enum SpeciesStatus { initial, success, failure, loading }

class SpeciesPageState extends Equatable {
  final List<PokemonSpeciesModel> species;
  final String next;
  final SpeciesStatus status;

  const SpeciesPageState({
    this.species = const <PokemonSpeciesModel>[],
    this.status = SpeciesStatus.initial,
    this.next = "https://pokeapi.co/api/v2/pokemon-species",
  });

  SpeciesPageState copyWith(
          {List<PokemonSpeciesModel>? species,
          String? next,
          SpeciesStatus? status}) =>
      SpeciesPageState(
          next: next ?? this.next,
          species: species ?? this.species,
          status: status ?? this.status);

  @override
  List<Object> get props => [species, next, status];
}
