class ParametersUser {
  final String? email;
  final String? password;

  ParametersUser({
     this.email,
    this.password,
  });

    ParametersUser copyWith({
    String? email,
    String? password,
  }) {
    return ParametersUser(
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
      'password': password,
    };
  }
}
