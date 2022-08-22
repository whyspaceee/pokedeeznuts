// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:pokedeeznuts/logic/models/pokemon_model.dart';
import 'package:pokedeeznuts/logic/models/pokemon_species_model.dart';
import 'package:pokedeeznuts/ui/screens/species_details/widgets/description.dart';
import 'package:pokedeeznuts/ui/screens/species_details/widgets/details_appbar.dart';
import 'package:pokedeeznuts/ui/screens/species_details/widgets/stats.dart';
import 'package:pokedeeznuts/ui/screens/species_details/widgets/title_with_image.dart';
import 'package:pokedeeznuts/ui/screens/species_details/widgets/weightheights.dart';
import 'package:pokedeeznuts/util/const.dart';
import 'package:pokedeeznuts/util/string_to_color.dart';

class SpeciesDetails extends StatelessWidget {
  final PokemonSpeciesModel species;
  const SpeciesDetails({Key? key, required this.species}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, species),
      backgroundColor: stringToColor[species.color],
      body: Body(species: species),
    );
  }
}

class Body extends StatefulWidget {
  final PokemonSpeciesModel species;

  const Body({Key? key, required this.species}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  late PokemonModel currVariety;

  @override
  void initState() {
    currVariety = widget.species.varieties[0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: size.height * 1.5,
            child: Stack(
              children: [
                Container(
                  margin: EdgeInsets.only(top: size.height * 0.3),
                  padding: EdgeInsets.only(
                    top: size.height * 0.12,
                    left: kDefaultPadding,
                    right: kDefaultPadding,
                  ),
                  // height: 500,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
                    child: Column(
                      children: [
                        SizedBox(height: kDefaultPadding),
                        WeightHeightMoves(
                          species: widget.species,
                        ),
                        SizedBox(height: kDefaultPadding / 2),
                        Description(species: widget.species),
                        SizedBox(height: kDefaultPadding / 2),
                        StatsAndAbilities(
                          varieties: currVariety,
                          color: stringToColor[widget.species.color]!,
                        ),
                        SizedBox(height: kDefaultPadding / 2),
                      ],
                    ),
                  ),
                ),
                ProductTitleWithImage(species: widget.species)
              ],
            ),
          )
        ],
      ),
    );
  }
}
