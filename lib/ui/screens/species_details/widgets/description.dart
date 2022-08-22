// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:pokedeeznuts/logic/models/pokemon_species_model.dart';
import 'package:pokedeeznuts/util/const.dart';

class Description extends StatelessWidget {
  const Description({
    Key? key,
    required this.species,
  }) : super(key: key);

  final PokemonSpeciesModel species;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: kDefaultPadding),
      child: Text(
        species.flavorText.replaceAll("\n", " "),
        style: TextStyle(height: 1.5),
      ),
    );
  }
}
