import 'package:fitness_tracker_flutter/activities/activity_card.dart';
import 'package:fitness_tracker_flutter/models/activity.dart';
import 'package:fitness_tracker_flutter/models/user.dart';
import 'package:fitness_tracker_flutter/activities/profile_header.dart';
import 'package:flutter/material.dart';

class ActivitiesPage extends StatelessWidget {
  const ActivitiesPage(
      {Key key, @required this.user, @required this.activities})
      : super(key: key);
  final User user;
  final List<Activity> activities;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        brightness: Brightness.light,
        title: Text('Activities', style: TextStyle(color: Colors.black87)),
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
