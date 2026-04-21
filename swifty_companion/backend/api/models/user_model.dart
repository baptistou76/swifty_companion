class User {
  User({
    required this.login,
    required this.firstName,
    required this.lastName,
    required this.imageUrl,
    required this.correctionPoints,
    required this.level,
  });
  final String login;
  final String firstName;
  final String lastName;
  final String imageUrl;
  final int correctionPoints;
  final double level;
}
 