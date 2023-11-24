import '../../domain/entities/user_entity.dart';

class UserExtends extends UserEntity {
  const UserExtends({
    super.id,
    super.dataUser,
  });

  factory UserExtends.fromMap(Map<String, dynamic> json) => UserExtends(
        id: json['id'],
        dataUser: json['dataUser'],
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'dataUser': dataUser,
      };
}
