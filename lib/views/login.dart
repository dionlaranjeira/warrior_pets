import 'package:flutter/material.dart';
import 'package:warrior_pets/util/colors_app.dart';
import 'package:warrior_pets/util/utils.dart';
import 'package:warrior_pets/view_model/login_user.dart';
import 'package:warrior_pets/views/home.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  LoginUserViewModel loginUserViewModel = LoginUserViewModel();

  final TextEditingController _controllerEmail = TextEditingController();

  bool _loading = false;
  bool _emailValid = true;

  _login(String email){
    setState(() {
      _loading = true;
    });
    if(loginUserViewModel.loginUser(email)["sucess"] == true){
      setState(() {
        _loading = false;
        _emailValid = true;
      });
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context)=>const Home()));
    }else{
      setState(() {
        _emailValid = false;
        _loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: const MediaQueryData(),
      child: Scaffold(
        body: Column(
          children: [
            imgScreenLogin(context),
            const SizedBox(height: 50),
            inputEmail(context),
            const SizedBox(height: 20),
            _loading ? const CircularProgressIndicator() : btnLogin(),
          ],
        ),
      ),
    );
  }

  Stack imgScreenLogin(BuildContext context) {
    return Stack(
            clipBehavior: Clip.none,
            children: [
              Container(color: ColorsApp.primaryColor, height: MediaQuery.of(context).size.height * 0.5),
              Positioned(
                bottom: -50,
                left: 0,
                right: 0,
                child: Center(
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    constraints: const BoxConstraints(maxWidth: 400),
                    height: 300,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                      boxShadow: [
                        BoxShadow(color: ColorsApp.secondaryColor, spreadRadius: 2),
                      ],

                      image: DecorationImage(
                        image: AssetImage(Utils.urlImageLogin),
                        fit: BoxFit.fill,
                      ),
                    ),
                    // child: Image.asset(Utils.urlImageLogin),
                  ),
                ),
              )
            ],
          );
  }

  Padding inputEmail(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(40, 8, 40, 8),
      child: TextFormField(
        controller: _controllerEmail,
        enabled: !_loading,
        keyboardType: TextInputType.emailAddress,
        cursorColor: Theme.of(context).backgroundColor,
        decoration: InputDecoration(
          labelText: 'E-mail',
          errorText: _emailValid ? null : "Invalid e-mail",
          labelStyle: TextStyle(
            color: _emailValid
                ? ColorsApp.primaryColor
                : ColorsApp.error,
          ),
          suffixIcon: Icon(
            _emailValid ? Icons.email : Icons.info,
            color: _emailValid ? ColorsApp.primaryColor : ColorsApp.error,
          ),
          enabledBorder: const UnderlineInputBorder(
            borderSide:
            BorderSide(color: ColorsApp.primaryColor),
          ),
        ),
      ),
    );
  }

  SizedBox btnLogin() {
    return SizedBox(
            width: 220,
            height: 60,
            child: ElevatedButton(
                onPressed: (){
                  _login(_controllerEmail.text);
                },
                child: const Text("LOGIN", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),)),
          );
  }




}