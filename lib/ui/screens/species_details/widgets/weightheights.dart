// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:pokedeeznuts/logic/models/pokemon_species_model.dart';
import 'package:pokedeeznuts/util/const.dart';

class WeightHeightMoves extends StatelessWidget {
  const WeightHeightMoves({
    Key? key,
    required this.species,
  }) : super(key: key);

  final PokemonSpeciesModel species;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: kDefaultPadding * 2,
      child: Row(
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Icon(
                  Icons.scale_rounded,
                  size: kDefaultPadding * 1.5,
                ),
                SizedBox(width: kDefaultPadding),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "${species.varieties[0].weight / 10} kg",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
                SizedBox(width: kDefaultPadding),
              ],
            ),
          ),
          VerticalDivider(
            thickness: 1,
            color: kTextLightColor,
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(width: kDefaultPadding),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("${species.varieties[0].height / 10} m",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18)),
                  ],
                ),
                SizedBox(width: kDefaultPadding),
                Icon(
                  Icons.height,
                  size: kDefaultPadding * 1.5,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
