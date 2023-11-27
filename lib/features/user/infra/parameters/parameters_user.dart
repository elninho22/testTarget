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

    factory ParametersUser.fromMap(Map<String, dynamic> json) => ParametersUser(
        email: json["email"],
        password: json["password"],
      );


  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
      'password': password,
    };
  }
}
