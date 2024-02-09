import 'package:fitness_tracker_flutter/avatar.dart';
import 'package:fitness_tracker_flutter/models/user.dart';
import 'package:flutter/material.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key, required this.user});
  final User user;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 16.0),
        Avatar(photoUrl: user.photoUrl),
        const SizedBox(height: 8.0),
        ...[
          Text(
            user.displayName,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 8.0),
        ],
        ...[
          Text(
            user.username,
            style: Theme.of(context).textTheme.titleSmall,
          ),
          const SizedBox(height: 8.0),
        ],
      ],
    );
  }
}
