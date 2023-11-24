import '../../domain/entities/save_data_entity.dart';

class SaveDataEntityExtends extends SaveDataEntity {
  const SaveDataEntityExtends({
    super.id,
    super.text,
  });

  factory SaveDataEntityExtends.fromMap(Map<String, dynamic> json) =>
      SaveDataEntityExtends(
        id: json['id'],
        text: json['text'],
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'text': text,
      };
}
