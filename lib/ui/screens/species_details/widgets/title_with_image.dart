// ignore_for_file: prefer_const_constructors

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pokedeeznuts/logic/models/pokemon_model.dart';
import 'package:pokedeeznuts/logic/models/pokemon_species_model.dart';
import 'package:pokedeeznuts/util/const.dart';
import 'package:pokedeeznuts/util/ext.dart';

class ProductTitleWithImage extends StatelessWidget {
  const ProductTitleWithImage({
    Key? key,
    required this.species,
  }) : super(key: key);

  final PokemonSpeciesModel species;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '#${species.id}',
            style: TextStyle(color: Colors.white),
          ),
          Text(
            species.name.capitalize(),
            style: Theme.of(context)
                .textTheme
                .headline4
                ?.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          Row(
            children: [
              SizedBox(width: kDefaultPadding * 3),
              Expanded(
                  child: Hero(
                      tag: "${species.id}",
                      child: CachedNetworkImage(
                        imageUrl: species.varieties[0].spriteUrl,
                        placeholder: (context, url) => Center(
                          child: CircularProgressIndicator(
                            color: Colors.white,
                          ),
                        ),
                      )))
            ],
          )
        ],
      ),
    );
  }
}
