import 'package:fitness_tracker_flutter/models/split.dart';
import 'package:flutter/material.dart';

class ActivitySplitRow extends StatelessWidget {
  const ActivitySplitRow({
    super.key,
    required this.split,
    required this.maxPace,
    required this.minPace,
    this.kmWidth = 40,
    this.paceWidth = 50,
    this.elevWidth = 40,
  });
  final Split split;
  final int maxPace;
  final int minPace;

  final double kmWidth;
  final double paceWidth;
  final double elevWidth;

  @override
  Widget build(BuildContext context) {
    final seconds = split.pace.inSeconds.remainder(60);
    final formatted =
        '${split.pace.inMinutes}:${seconds.toString().padLeft(2, '0')}';
    final style =
        Theme.of(context).textTheme.bodySmall!.copyWith(color: Colors.black87);
    return Row(
      children: <Widget>[
        SizedBox(
          width: kmWidth,
          child: Text('${split.km}', style: style),
        ),
        SizedBox(
          width: paceWidth,
          child: Text(formatted, style: style),
        ),
        Expanded(
          child: ActivitySplitBar(
            max: maxPace.toDouble(),
            min: minPace.toDouble(),
            current: split.pace.inSeconds.toDouble(),
          ),
        ),
        SizedBox(
          width: elevWidth,
          child: Text(
            '${split.elev}',
            style: style,
            textAlign: TextAlign.right,
          ),
        ),
      ],
    );
  }
}

class ActivitySplitBar extends StatelessWidget {
  const ActivitySplitBar(
      {super.key, required this.max, required this.min, required this.current});
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
