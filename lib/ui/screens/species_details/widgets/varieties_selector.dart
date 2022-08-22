import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pokedeeznuts/logic/models/pokemon_model.dart';
import 'package:pokedeeznuts/util/const.dart';

class VarietiesSelector extends StatelessWidget {
  final List<PokemonModel> varieties;
  final Function(PokemonModel) function;
  const VarietiesSelector(
      {Key? key, required this.varieties, required this.function})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: Column(
        children: [
          Text("Varieties"),
          SizedBox(height: kDefaultPadding),
          SizedBox(
            height: 75,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: varieties.length,
                itemBuilder: (context, i) {
                  return VarietiesDisplay(
                      variety: varieties[i], function: function);
                }),
          )
        ],
      ),
    );
  }
}

class VarietiesDisplay extends StatelessWidget {
  final PokemonModel variety;
  final Function(PokemonModel) function;
  const VarietiesDisplay(
      {Key? key, required this.variety, required this.function})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      margin: EdgeInsets.symmetric(horizontal: kDefaultPadding),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        image: DecorationImage(
            image: CachedNetworkImageProvider(variety.spriteUrl)),
      ),
      child: GestureDetector(
        onTap: () => {print("tappedss"), function(variety)},
      ),
    );
  }
}
