import 'package:fitness_tracker_flutter/avatar.dart';
import 'package:fitness_tracker_flutter/models/user.dart';
import 'package:flutter/material.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({@required this.user});
  final User user;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 16.0),
        Avatar(photoUrl: user.photoUrl),
        SizedBox(height: 8.0),
        if (user.displayName != null) ...[
          Text(
            user.displayName,
            style: Theme.of(context).textTheme.title,
          ),
          SizedBox(height: 8.0),
        ],
        if (user.username != null) ...[
          Text(
            user.username,
            style: Theme.of(context).textTheme.subtitle,
          ),
          SizedBox(height: 8.0),
        ],
      ],
    );
  }
}
