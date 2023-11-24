class ParametersSaveData {
  final String? text;
  final int? createdAt;

  ParametersSaveData({
     this.text,
     this.createdAt,
  });

    ParametersSaveData copyWith({
    String? text,
    int? createdAt,
  }) {
    return ParametersSaveData(
      text: text ?? this.text,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'text': text,
      'createdAt': createdAt,
    };
  }
}
