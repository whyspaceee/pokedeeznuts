// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:pokedeeznuts/logic/models/pokemon_model.dart';
import 'package:pokedeeznuts/util/const.dart';

class StatsAndAbilities extends StatelessWidget {
  final PokemonModel varieties;
  final Color color;
  const StatsAndAbilities(
      {Key? key, required this.varieties, required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
            height: kDefaultPadding * 12,
            child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: varieties.stats.length,
                itemBuilder: (context, i) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(varieties.stats[i].name!.toUpperCase()),
                      SizedBox(
                        width: kDefaultPadding,
                      ),
                      Row(
                        children: [
                          Text(varieties.stats[i].baseStat.toString()),
                          SizedBox(width: kDefaultPadding),
                          SizedBox(
                              width: kDefaultPadding * 8,
                              child: LinearPercentIndicator(
                                // ignore: deprecated_member_use
                                animation: true,
                                barRadius: Radius.circular(50),
                                lineHeight: 7,
                                backgroundColor: Colors.grey[200],
                                progressColor: color,
                                percent: varieties.stats[i].baseStat / 100 > 1
                                    ? 1
                                    : varieties.stats[i].baseStat / 100,
                              )),
                        ],
                      )
                    ],
                  );
                })),
      ],
    );
  }
}
