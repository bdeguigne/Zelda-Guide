import 'package:zelda_guide/domain/auth/value_objects.dart';

class User {
  final Username username;
  final EmailAddress emailAddress;
  final Password password;

  User(
    this.username,
    this.emailAddress,
    this.password,
  );

  User.fromJson(Map<dynamic, dynamic> json)
      : username = Username.fromJson(json['username'] as String),
        emailAddress = EmailAddress.fromJson(json['emailAddress'] as String),
        password = Password.fromJson(json['emailAddress'] as String);

  Map<dynamic, dynamic> toJson() => {
        'username': username.getOrCrash(),
        'emailAddress': emailAddress.getOrCrash(),
        "password": password.getOrCrash(),
      };

  User copyWith({
    Username? username,
    EmailAddress? emailAddress,
    Password? password,
  }) {
    return User(
      username ?? this.username,
      emailAddress ?? this.emailAddress,
      password ?? this.password,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is User &&
        other.username == username &&
        other.emailAddress == emailAddress;
  }

  @override
  int get hashCode => username.hashCode ^ emailAddress.hashCode;

  @override
  String toString() => 'User(username: $username, emailAddress: $emailAddress)';
}
