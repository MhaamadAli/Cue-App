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
    return User(
      id: json['id'] as int? ?? 0,
      username: json['username'] as String? ??
          'Unknown',
      email: json['email'] as String? ?? 'No Email',
      role: json['role'] as String? ?? 'No Role',
    );
  }
}
