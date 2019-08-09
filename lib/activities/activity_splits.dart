import 'dart:math';

import 'package:fitness_tracker_flutter/activities/activity_split_header.dart';
import 'package:fitness_tracker_flutter/activities/activity_split_row.dart';
import 'package:fitness_tracker_flutter/models/split.dart';
import 'package:flutter/material.dart';

class ActivitySplits extends StatelessWidget {
  const ActivitySplits(this.splits);
  final List<Split> splits;

  int maxPace() {
    final paces = splits.map((split) => split.pace.inSeconds);
    return paces.reduce((value, element) => max(value, element));
  }

  int minPace() {
    final paces = splits.map((split) => split.pace.inSeconds);
    return paces.reduce((value, element) => min(value, element));
  }

  @override
  Widget build(BuildContext context) {
    final max = maxPace();
    final min = minPace();
    //print('max: ${maxPace()}, min: ${minPace()}');
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        SizedBox(height: 8.0),
        Text('Splits', style: Theme.of(context).textTheme.title),
        SizedBox(height: 8.0),
        ActivitySplitHeader(),
        SizedBox(height: 4.0),
        Divider(color: Colors.black12, height: 0.5),
        SizedBox(height: 8.0),
        for (var split in splits)
          ActivitySplitRow(
            split: split,
            maxPace: max,
            minPace: min,
          )
      ],
    );
  }
}
