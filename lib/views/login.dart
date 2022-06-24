import 'package:flutter/material.dart';
import 'package:warrior_pets/util/colors_app.dart';
import 'package:warrior_pets/util/utils.dart';
import 'package:warrior_pets/views/home.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerSenha = TextEditingController();

  final bool _logando = false;
  bool _senhaVisivel = true;
  final bool _emailValido = true;
  final bool _senhaValida = true;

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
            inputSenha(context),
            const SizedBox(height: 20),
            btnLogin()
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

  SizedBox btnLogin() {
    return SizedBox(
            width: 220,
            height: 60,
            child: ElevatedButton(
                onPressed: (){
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context)=> const Home()));
                },
                child: const Text("LOGIN", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),)),
          );
  }

  Padding inputEmail(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(40, 8, 40, 8),
      child: TextFormField(
        controller: _controllerEmail,
        enabled: !_logando,
        keyboardType: TextInputType.emailAddress,
        cursorColor: Theme.of(context).backgroundColor,
        decoration: InputDecoration(
          labelText: 'E-mail',
          errorText: _emailValido ? null : "Invalid e-mail",
          labelStyle: TextStyle(
            color: _emailValido
                ? ColorsApp.primaryColor
                : ColorsApp.error,
          ),
          suffixIcon: Icon(
            _emailValido ? Icons.email : Icons.close,
            color: _emailValido ? ColorsApp.primaryColor : ColorsApp.error,
          ),
          enabledBorder: const UnderlineInputBorder(
            borderSide:
            BorderSide(color: ColorsApp.primaryColor),
          ),
        ),
      ),
    );
  }

  Padding inputSenha(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(40, 0, 40, 8),
      child: TextFormField(
        controller: _controllerSenha,
        enabled: !_logando,
        keyboardType: TextInputType.visiblePassword,
        obscureText: _senhaVisivel,
        cursorColor: Theme.of(context).backgroundColor,
        decoration: InputDecoration(
          labelText: 'Password',
          errorText: _senhaValida ? null : "Invalid password",
          labelStyle: TextStyle(
            color: _senhaValida
                ? ColorsApp.primaryColor
                : ColorsApp.error,
          ),
          suffixIcon: IconButton(
              onPressed: (){
                setState(() {
                  _senhaVisivel = !_senhaVisivel;
                });
              },
              icon:  Icon( _senhaVisivel ? Icons.visibility: Icons.visibility_off, color: ColorsApp.primaryColor)),
        ),

      ),
    );
  }



}