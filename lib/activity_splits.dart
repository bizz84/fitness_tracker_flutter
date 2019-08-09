import 'dart:math';

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

class ActivitySplitHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        SizedBox(
          width: 40,
          child: Text('KM', style: Theme.of(context).textTheme.caption),
        ),
        SizedBox(
          width: 50,
          child: Text('PACE', style: Theme.of(context).textTheme.caption),
        ),
        Expanded(
            child: Row(
          children: <Widget>[],
        )),
        SizedBox(
          width: 40,
          child: Text('ELEV', style: Theme.of(context).textTheme.caption, textAlign: TextAlign.right),
        ),
      ],
    );
  }
}

class ActivitySplitRow extends StatelessWidget {
  const ActivitySplitRow({Key key, this.split, this.maxPace, this.minPace}) : super(key: key);
  final Split split;
  final int maxPace;
  final int minPace;

  @override
  Widget build(BuildContext context) {
    final seconds = split.pace.inSeconds.remainder(60);
    final formatted = '${split.pace.inMinutes}:${seconds.toString().padLeft(2, '0')}';
    final style = Theme.of(context).textTheme.caption.copyWith(color: Colors.black87);
    return Row(
      children: <Widget>[
        SizedBox(
          width: 40,
          child: Text('${split.km}', style: style),
        ),
        SizedBox(
          width: 50,
          child: Text(formatted, style: style),
        ),
        Expanded(
            child: ActivitySplitBar(
          max: maxPace.toDouble(),
          min: minPace.toDouble(),
          current: split.pace.inSeconds.toDouble(),
        )),
        SizedBox(
          width: 40,
          child: Text('${split.elev}', style: style, textAlign: TextAlign.right),
        ),
      ],
    );
  }
}

class ActivitySplitBar extends StatelessWidget {
  const ActivitySplitBar({Key key, this.max, this.min, this.current}) : super(key: key);
  final double max;
  final double min;
  final double current;

  @override
  Widget build(BuildContext context) {
    final delta = (max - current) / (max - min);
    final value = (2.0 + delta) / 3.0;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final width = value * constraints.maxWidth;
          return Row(
            children: <Widget>[
              SizedBox(
                width: width,
                height: 15.0,
                child: Container(color: Theme.of(context).primaryColor),
              ),
              Expanded(child: Container()),
            ],
          );
        },
      ),
    );
  }
}
