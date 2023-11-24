class ParametersSaveData {
  final String? text;

  ParametersSaveData({
     this.text,
  });

    ParametersSaveData copyWith({
    String? text,
  }) {
    return ParametersSaveData(
      text: text ?? this.text,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'text': text,
    };
  }
}
