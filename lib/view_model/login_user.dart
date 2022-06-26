import 'package:warrior_pets/util/utils.dart';

class LoginUserViewModel{
  Map<String, dynamic>? userLogged;
  loginUser(String email){
    for(String user in Utils.users["users"]){
      if(email == user){
        userLogged = {"sucess":true, "user": user};
        return userLogged;
      }
    }
    return userLogged = {"sucess":false};
  }
}

class UserLogeed {
  final Map<String, dynamic>? userLogged;
  UserLogeed(this.userLogged);
}