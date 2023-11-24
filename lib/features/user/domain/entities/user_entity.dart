import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String? id;
  final String? dataUser;

  const UserEntity({
    this.id,
    this.dataUser,
  });

  @override
  List<Object?> get props => [
        id,
        dataUser,
      ];
}
