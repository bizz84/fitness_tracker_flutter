import 'package:fitness_tracker_flutter/activity_splits.dart';
import 'package:fitness_tracker_flutter/avatar.dart';
import 'package:fitness_tracker_flutter/models/activity.dart';
import 'package:fitness_tracker_flutter/profile_header.dart';
import 'package:flutter/material.dart';

class ActivityCard extends StatelessWidget {
  const ActivityCard({Key key, this.user, this.activity}) : super(key: key);
  final User user;
  final Activity activity;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        color: Colors.white,
        child: Column(
          children: <Widget>[
            Divider(color: Colors.black12, height: 0.5),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  ActivityHeader(
                    user: user,
                    activity: activity,
                  ),
                  SizedBox(height: 16.0),
                  ActivityBody(activity: activity),
                  SizedBox(height: 16.0),
                  if (activity.splits != null) ActivitySplits(activity.splits),
                ],
              ),
            ),
            Divider(color: Colors.black12, height: 0.5),
          ],
        ),
      ),
    );
  }
}

class ActivityHeader extends StatelessWidget {
  const ActivityHeader({Key key, this.user, this.activity}) : super(key: key);
  final User user;
  final Activity activity;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Avatar(radius: 15),
        SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            if (user.displayName != null) Text(user.displayName, style: Theme.of(context).textTheme.subtitle),
            Text(activity.dateTime, style: Theme.of(context).textTheme.caption),
          ],
        )
      ],
    );
  }
}

class ActivityMetric extends StatelessWidget {
  const ActivityMetric({Key key, this.label, this.value}) : super(key: key);
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(label, style: Theme.of(context).textTheme.caption),
        Text(value, style: Theme.of(context).textTheme.title),
      ],
    );
  }
}

class ActivityBody extends StatelessWidget {
  const ActivityBody({Key key, this.activity}) : super(key: key);
  final Activity activity;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        if (activity.description != null) Text(activity.description, style: Theme.of(context).textTheme.title),
        SizedBox(height: 16.0),
        Row(
          children: <Widget>[
            Expanded(child: ActivityMetric(label: 'Distance', value: activity.distance)),
            Expanded(child: ActivityMetric(label: 'Pace', value: activity.pace)),
            Expanded(child: ActivityMetric(label: 'Time', value: activity.time)),
          ],
        ),
      ],
    );
  }
}
