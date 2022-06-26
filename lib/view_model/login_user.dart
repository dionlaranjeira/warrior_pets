import 'package:shared_preferences/shared_preferences.dart';
import 'package:warrior_pets/util/utils.dart';

class LoginUserViewModel{
  late final prefs;
  late bool? logeed;

  loginUser(String email) async {
    for(String user in Utils.users["users"]){
      if(email == user){
        prefs = await SharedPreferences.getInstance();
        await prefs.setString('user', email);
        return true;
      }
    }
    return false;
  }
}

