import 'package:fitness_tracker_flutter/avatar.dart';
import 'package:flutter/material.dart';

class User {
  const User({this.username, this.displayName, this.photoUrl});
  final String username;
  final String displayName;
  final String photoUrl;
}

class ProfileHeader extends StatelessWidget {
  ProfileHeader({this.user});
  final User user;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 16.0),
        Avatar(photoUrl: user.photoUrl),
        if (user.displayName != null) ...[
          SizedBox(height: 8.0),
          Text(
            user.displayName,
            style: Theme.of(context).textTheme.title,
          ),
        ],
        if (user.username != null) ...[
          SizedBox(height: 4.0),
          Text(
            user.username,
            style: Theme.of(context).textTheme.subtitle,
          ),
        ],
        SizedBox(height: 16.0),
      ],
    );
  }
}
