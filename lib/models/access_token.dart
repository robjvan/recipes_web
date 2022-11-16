class AuthToken {
  String token;

  AuthToken({required this.token});

  factory AuthToken.fromJson(final Map<String, dynamic> json) => AuthToken(
        token: json['accessToken'],
      );

  Map<String, dynamic> toJson() => <String, dynamic>{'accessToken': token};
}
