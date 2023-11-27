class RegisterEntity {
  final String? content;
  final int? createdAt;

  RegisterEntity({
    this.content,
    this.createdAt,
  });

  RegisterEntity copyWith({
    String? content,
    int? createdAt,
  }) {
    return RegisterEntity(
      content: content ?? this.content,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  factory RegisterEntity.fromMap(Map<String, dynamic> json) => RegisterEntity(
        content: json["content"],
        createdAt: json["created_at"],
      );

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'content': content,
      'created_at': createdAt,
    };
  }

  bool get isEmptyContent => content == '' || content.toString().isEmpty;
}
