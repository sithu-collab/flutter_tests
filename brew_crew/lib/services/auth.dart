import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //Sign in with Anon
  Future signInWithAnon() async{
   try {
     AuthResult result = await _auth.signInAnonymously();
     FirebaseUser user = result.user;
     return user;
   }catch(e){
     print(e.toString());
     return null;
   }
  }

  //Sign in with email & password
  //register with email & password
  //Sign out
}