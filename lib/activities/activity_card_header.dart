import 'package:fitness_tracker_flutter/avatar.dart';
import 'package:fitness_tracker_flutter/models/activity.dart';
import 'package:fitness_tracker_flutter/models/user.dart';
import 'package:flutter/material.dart';

class ActivityCardHeader extends StatelessWidget {
  const ActivityCardHeader(
      {super.key, required this.user, required this.activity});
  final User user;
  final Activity activity;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        const Avatar(radius: 15),
        const SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              user.displayName,
              style: Theme.of(context).textTheme.titleSmall,
            ),
            Text(
              activity.dateTime,
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        )
      ],
    );
  }
}
