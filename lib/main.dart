// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedeeznuts/logic/api/api_provider.dart';
import 'package:pokedeeznuts/logic/cubit/species_page_cubit.dart';
import 'package:pokedeeznuts/logic/repository/pokemon_repository.dart';
import 'package:pokedeeznuts/logic/repository/pokemon_species_repository.dart';
import 'package:pokedeeznuts/ui/screens/species_summary/species_screen.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<ApiProvider>(create: (_) => ApiProvider()),
        RepositoryProvider<PokemonRepository>(
            create: (_) => PokemonRepository(_.read<ApiProvider>())),
        RepositoryProvider<PokemonSpeciesRepository>(
          create: (_) => PokemonSpeciesRepository(_.read<PokemonRepository>()),
        )
      ],
      child: BlocProvider(
        create: (context) =>
            SpeciesPageCubit(context.read<PokemonSpeciesRepository>())
              ..retrieveSpecies(),
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            useMaterial3: true,
            primarySwatch: Colors.blue,
          ),
          home: SpeciesTest(),
        ),
      ),
    );
  }
}
