class User {
  final int id;
  final String username;
  final String email;
  final String role;

  User(
      {required this.id,
      required this.username,
      required this.email,
      required this.role});

  factory User.fromJson(Map<String, dynamic> json) {
    var userJson = json['user'];
    return User(
      id: userJson['id'] as int? ?? 0,
      username: userJson['username'] as String? ?? 'Unknown',
      email: userJson['email'] as String? ?? 'No Email',
      role: userJson['role'] as String? ?? 'No Role',
    );
  }
}
