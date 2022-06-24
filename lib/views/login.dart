import 'package:flutter/material.dart';

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
  bool _emailValido = true;
  bool _senhaValida = true;

  bool _btnLoginVisible = true;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SEJA BEM VINDO!"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 30),
            // imageLogo(),
            const SizedBox(height: 18),
            textLogin(),
            inputEmail(context),
            inputSenha(context),
            const SizedBox(height: 18),
            _btnLoginVisible ? buttonLogin() : const CircularProgressIndicator(),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  ElevatedButton buttonLogin() {
    return ElevatedButton(
      onPressed: (){
        _logar();
      },
      child: Wrap(
        children: const [
          Icon(
            Icons.login,
            color: Colors.white,
            size: 24.0,
          ),
          SizedBox(
            width: 10,
          ),
          Text("ENTRAR",
              style: TextStyle(fontSize: 20)),
        ],
      ),
      style: ElevatedButton.styleFrom(
        // primary: Color(ColorsUtil.primaryColor),
        padding: const EdgeInsets.all(8),
      ),
    );
  }

  Text textLogin() {
    return const Text(
      "POR FAVOR, FAÇA O LOGIN",
      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),);
  }

  Padding inputSenha(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
      child: TextFormField(
        controller: _controllerSenha,
        enabled: !_logando,
        keyboardType: TextInputType.visiblePassword,
        obscureText: _senhaVisivel,
        cursorColor: Theme.of(context).backgroundColor,
        decoration: InputDecoration(
          labelText: 'Senha',
          errorText: _senhaValida ? null : "Senha inválida",
          labelStyle: TextStyle(
            color: _senhaValida
                ? Colors.grey
                : Colors.red,
          ),
          suffixIcon: IconButton(
              onPressed: (){
                setState(() {
                  _senhaVisivel = !_senhaVisivel;
                });
              },
              icon:  Icon( _senhaVisivel ? Icons.visibility: Icons.visibility_off, color: Colors.grey)),

        ),

      ),
    );
  }

  Padding inputEmail(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
      child: TextFormField(
        controller: _controllerEmail,
        enabled: !_logando,
        keyboardType: TextInputType.emailAddress,
        cursorColor: Theme.of(context).backgroundColor,
        decoration: InputDecoration(
          labelText: 'Usuário',
          errorText: _emailValido ? null : "Usuário inválido",
          labelStyle: TextStyle(
            color: _emailValido
                ? Colors.red
                : Colors.red,
          ),
          suffixIcon: Icon(
            _emailValido ? Icons.person : Icons.close,
            color: _emailValido ? Colors.grey : Colors.red,
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide:
            BorderSide(color:Colors.red),
          ),
        ),
      ),
    );
  }

  void _logar() async {

    setState(() {
      _btnLoginVisible = false;
    });

    bool sucesso = true;

    if(sucesso){
      setState(() {
        _emailValido = true;
        _senhaValida = true;
      });
     //Todo:Abrir Tela Home
    }
    else{
      setState(() {
        _emailValido = false;
        _senhaValida = false;
      });
    }

    setState(() {
      _btnLoginVisible = true;
    });


  }
}