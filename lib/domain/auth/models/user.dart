import 'package:zelda_guide/domain/auth/value_objects.dart';

class User {
  final Username username;
  final Password password;

  User(
    this.username,
    this.password,
  );

  User.fromJson(Map<dynamic, dynamic> json)
      : username = Username.fromJson(json['username'] as String),
        password = Password.fromJson(json['password'] as String);

  Map<dynamic, dynamic> toJson() => {
        'username': username.getOrCrash(),
        "password": password.getOrCrash(),
      };

  User copyWith({
    Username? username,
    Password? password,
  }) {
    return User(
      username ?? this.username,
      password ?? this.password,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is User &&
        other.username == username &&
        other.password == password;
  }

  @override
  int get hashCode => username.hashCode ^ password.hashCode;

  @override
  String toString() => 'User(username: $username, password: $password)';
}
