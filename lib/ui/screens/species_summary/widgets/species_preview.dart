// ignore_for_file: prefer_const_constructors

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pokedeeznuts/logic/models/pokemon_species_model.dart';
import 'package:pokedeeznuts/ui/screens/species_details/species_details.dart';
import 'package:pokedeeznuts/util/const.dart';
import 'package:pokedeeznuts/util/ext.dart';
import 'package:pokedeeznuts/util/string_to_color.dart';

class SpeciesPreview extends StatelessWidget {
  final PokemonSpeciesModel species;
  const SpeciesPreview({Key? key, required this.species}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SpeciesDetails(
              species: species,
            ),
          )),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(kDefaultPadding),
              decoration: BoxDecoration(
                color: stringToColor[species.color],
                borderRadius: BorderRadius.circular(16),
              ),
              child: Hero(
                tag: "${species.id}",
                child: CachedNetworkImage(
                  imageUrl: species.varieties[0].spriteUrl,
                  placeholder: (context, url) => Center(
                    child: CircularProgressIndicator(
                      color: Colors.white,
                    ),
                  ),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: kDefaultPadding / 4),
            child: Text(
              species.name.capitalize(),
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Text(
            "#${species.id}",
            style: TextStyle(color: kTextLightColor),
          )
        ],
      ),
    );
  }
}
