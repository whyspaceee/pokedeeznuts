// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:pokedeeznuts/logic/models/stats_model.dart';
import 'package:pokedeeznuts/util/const.dart';

class CircularStatIndicator extends StatelessWidget {
  final StatsModel statsModel;
  final Color color;
  const CircularStatIndicator(
      {Key? key, required this.statsModel, required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: kDefaultPadding / 2),
        SizedBox(
          width: kDefaultPadding * 3.2,
          height: kDefaultPadding * 3.2,
          child: CircularPercentIndicator(
            circularStrokeCap: CircularStrokeCap.round,
            radius: 32,
            backgroundColor: Colors.grey[200]!,
            progressColor: color,
            percent: statsModel.baseStat / 200,
            center: Text(
              statsModel.baseStat.toString(),
              style: TextStyle(
                  fontWeight: FontWeight.bold, color: color, fontSize: 20),
            ),
          ),
        ),
        SizedBox(height: kDefaultPadding / 2),
        Text(statsModel.name!.toUpperCase(), style: TextStyle())
      ],
    );
  }
}
