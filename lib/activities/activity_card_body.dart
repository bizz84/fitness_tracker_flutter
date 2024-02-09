import 'package:fitness_tracker_flutter/models/activity.dart';
import 'package:flutter/material.dart';

class ActivityCardMetric extends StatelessWidget {
  const ActivityCardMetric(
      {super.key, required this.label, required this.value});
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(label, style: Theme.of(context).textTheme.bodySmall),
        Text(value, style: Theme.of(context).textTheme.titleLarge),
      ],
    );
  }
}

class ActivityCardBody extends StatelessWidget {
  const ActivityCardBody({super.key, required this.activity});
  final Activity activity;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        if (activity.description != null)
          Text(activity.description!,
              style: Theme.of(context).textTheme.titleLarge),
        const SizedBox(height: 16.0),
        Row(
          children: <Widget>[
            Expanded(
              child: ActivityCardMetric(
                label: 'Distance',
                value: activity.distance,
              ),
            ),
            Expanded(
              child: ActivityCardMetric(
                label: 'Pace',
                value: activity.pace,
              ),
            ),
            Expanded(
              child: ActivityCardMetric(
                label: 'Time',
                value: activity.time,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
