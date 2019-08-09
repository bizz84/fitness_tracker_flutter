import 'package:fitness_tracker_flutter/activity_card.dart';
import 'package:fitness_tracker_flutter/models/split.dart';
import 'package:fitness_tracker_flutter/profile_header.dart';
import 'package:flutter/material.dart';

import 'models/activity.dart';

class FeedPage extends StatelessWidget {
  static const user = const User(
    displayName: 'Andrea Bizzotto',
    username: '@biz84',
  );
  static const activities = const <Activity>[
    const Activity(
      dateTime: 'August 6, 2019 at 11:35 AM',
      distance: '11.00 km',
      pace: '5:00 /km',
      time: '54m 59s',
      description: 'Lunch Run',
      splits: [
        Split(km: 1, pace: Duration(minutes: 4, seconds: 57), elev: -7),
        Split(km: 2, pace: Duration(minutes: 4, seconds: 38), elev: -13),
        Split(km: 3, pace: Duration(minutes: 4, seconds: 58), elev: -2),
        Split(km: 4, pace: Duration(minutes: 5, seconds: 6), elev: 3),
        Split(km: 5, pace: Duration(minutes: 4, seconds: 53), elev: -3),
        Split(km: 6, pace: Duration(minutes: 5, seconds: 10), elev: 1),
        Split(km: 7, pace: Duration(minutes: 4, seconds: 54), elev: 1),
        Split(km: 8, pace: Duration(minutes: 5, seconds: 03), elev: -2),
        Split(km: 9, pace: Duration(minutes: 5, seconds: 13), elev: 4),
        Split(km: 10, pace: Duration(minutes: 5, seconds: 01), elev: 15),
        Split(km: 11, pace: Duration(minutes: 5, seconds: 03), elev: 5),
      ],
    ),
    const Activity(
      dateTime: 'August 4, 2019 at 7:06 AM',
      distance: '18.52 km',
      pace: '5:02 /km',
      time: '1h 33m',
      description: 'Half Marathon training',
    ),
    const Activity(
      dateTime: 'August 1, 2019 at 11:53 AM',
      distance: '10.37 km',
      pace: '4:54 /km',
      time: '50m 52s',
    ),
    const Activity(
      dateTime: 'July 29, 2019 at 11:19 AM',
      distance: '11.00 km',
      pace: '4:59 /km',
      time: '54m 51s',
    ),
    const Activity(
      dateTime: 'July 26, 2019 at 9:40 AM',
      distance: '8.14 km',
      pace: '4:57 /km',
      time: '50m 19s',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        brightness: Brightness.light,
        title: Text('Feed', style: TextStyle(color: Colors.black87)),
        elevation: 2,
      ),
      body: _buildBody(context),
      backgroundColor: Colors.grey[200],
    );
  }

  Widget _buildBody(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverToBoxAdapter(
          child: ProfileHeader(
            user: user,
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) => ActivityCard(
              user: user,
              activity: activities[index],
            ),
            childCount: activities.length,
          ),
        ),
      ],
    );
  }
}
