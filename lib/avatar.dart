import 'package:flutter/material.dart';

class Avatar extends StatelessWidget {
  const Avatar({super.key, this.photoUrl, this.radius = 50});
  final String? photoUrl;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      backgroundImage: photoUrl != null ? NetworkImage(photoUrl!) : null,
      child: photoUrl == null ? Icon(Icons.camera_alt, size: radius) : null,
    );
  }
}
