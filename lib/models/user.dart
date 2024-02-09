class User {
  const User({
    required this.displayName,
    required this.username,
    this.photoUrl,
  });
  final String displayName;
  final String username;
  final String? photoUrl;
}
