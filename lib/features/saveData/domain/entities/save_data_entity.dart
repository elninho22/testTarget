import 'package:equatable/equatable.dart';

class SaveDataEntity extends Equatable {
  final String? id;
  final String? text;

  const SaveDataEntity({
    this.id,
    this.text,
  });

  @override
  List<Object?> get props => [
        id,
        text,
      ];
}
