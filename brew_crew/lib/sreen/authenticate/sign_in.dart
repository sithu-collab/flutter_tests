import 'package:brew_crew/services/auth.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: new AppBar(
        title: new Text('Sign in With Brew Crew'),
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
      ),
      body: RaisedButton(
        child: Text('Sign in Anon'),
        onPressed: () async {
          dynamic result = await _authService.signInWithAnon();
          if(result == null){
            print('error signing in');
          }else{
            print('Signed in');
            print(result);
          }
        },
      ),
    );
  }
}
