import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pokedeeznuts/logic/models/pokemon_species_model.dart';
import 'package:pokedeeznuts/logic/repository/pokemon_species_repository.dart';

part 'species_page_state.dart';

class SpeciesPageCubit extends Cubit<SpeciesPageState> {
  final PokemonSpeciesRepository repository;
  SpeciesPageCubit(this.repository) : super(const SpeciesPageState());

  Future<void> retrieveSpecies() async {
    try {
      if (state.status == SpeciesStatus.loading) {
        return;
      }
      emit(state.copyWith(status: SpeciesStatus.loading));
      final data = await repository.fetchSpecies(Uri.parse(state.next));
      final previousData = state.species.toList();
      previousData.addAll(data.a);
      final next = data.b;
      emit(state.copyWith(
          species: previousData, status: SpeciesStatus.success, next: next));
    } on Exception {}
  }
}
