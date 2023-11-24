

import '../../../../core/local_storages/local_storage.dart';
import '../../domain/usecases/user_usecase.dart';

class UserStore  {
  final LocalStorage shared;
  final UserUsecase userUsecase;
  


  UserStore({
    required this.shared,
    required this.userUsecase,

  });




  // _delayed([int milliseconds = 500]) async =>
  //     await Future.delayed(Duration(milliseconds: milliseconds));

}
