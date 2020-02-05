import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:forasterosrp_chat/main.dart';
import 'package:forasterosrp_chat/chat/chat.dart';

class Login extends StatefulWidget {
  static const String id = "LOGIN";
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String email;
  String password;

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> loginUser() async {

    FirebaseUser user = await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Chat(
          user: user,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ForasterosRP Chat"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Hero(
              tag: 'logo',
              child: Container(
                child: Image.asset("assets/image/logo.png"),
              ),
            ),
          ),
          SizedBox(
            height: 40.0,
          ),
          Container(
            child: Text(
              "Usuario",
              style: TextStyle(
                fontSize: 24.0,
              ),
            ),
          ),
          TextField(
            keyboardType: TextInputType.emailAddress,
            onChanged: (value) => email = value,
            decoration: InputDecoration(
              hintText: "Introduce el Email...",
              border: const OutlineInputBorder(),
            ),
          ),
          SizedBox(
            height: 40.0,
          ),
          Container(
            child: Text(
              "Contraseña",
              style: TextStyle(
                fontSize: 24.0,
              ),
            ),
          ),
          TextField(
            autocorrect: false,
            obscureText: true,
            onChanged: (value) => password = value,
            decoration: InputDecoration(
              hintText: "Introduce la Contraseña...",
              border: const OutlineInputBorder(),
            ),
          ),
          CustomButton(
            text: "Log In",
            callback: () async {
              await loginUser();
            },
          )
        ],
      ),
    );
  }
}
