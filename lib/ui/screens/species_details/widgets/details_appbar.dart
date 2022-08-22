// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:pokedeeznuts/logic/models/pokemon_species_model.dart';
import 'package:pokedeeznuts/util/const.dart';
import 'package:pokedeeznuts/util/string_to_color.dart';

AppBar buildAppBar(BuildContext context, PokemonSpeciesModel species) {
  return AppBar(
    backgroundColor: stringToColor[species.color],
    elevation: 0,
    leading: IconButton(
      icon: Icon(
        Icons.arrow_back,
        color: Colors.white,
      ),
      onPressed: () => Navigator.pop(context),
    ),
    actions: [
      IconButton(
        icon: Icon(Icons.search),
        color: Colors.white,
        onPressed: () {},
      ),
      IconButton(
        icon: Icon(Icons.catching_pokemon),
        color: Colors.white,
        onPressed: () {},
      ),
      SizedBox(width: kDefaultPadding / 2)
    ],
  );
}
