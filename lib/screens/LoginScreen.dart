import 'package:chitti/screens/ChittiList.dart';
import 'package:chitti/screens/RegistrationScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:chitti/screens/HomeScreen.dart';

class LoginScreen extends StatelessWidget {
  final _emailController = TextEditingController();
  final _passController = TextEditingController();
  FirebaseAuth _auth = FirebaseAuth.instance;
  Future<FirebaseUser> login(String email, String pass) async {
    try {
      AuthResult result =
          await _auth.signInWithEmailAndPassword(email: email, password: pass);

      FirebaseUser user = result.user;
      return user;
    } catch (e) {
      print(e);
      return null;
    }
    //Future<String> userID() async {
    //  FirebaseUser userData = await _auth.currentUser();
    //  final userD = userData.uid.toString();
    //  return userD;

    //}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      padding: EdgeInsets.all(32),
      child: Form(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Login",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 36,
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 16,
            ),
            TextFormField(
              decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      borderSide: BorderSide(color: Colors.grey[200])),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      borderSide: BorderSide(color: Colors.grey[300])),
                  filled: true,
                  fillColor: Colors.grey[100],
                  hintText: "Email"),
              controller: _emailController,
            ),
            SizedBox(
              height: 16,
            ),
            TextFormField(
              obscureText: true,
              decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      borderSide: BorderSide(color: Colors.grey[200])),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      borderSide: BorderSide(color: Colors.grey[300])),
                  filled: true,
                  fillColor: Colors.grey[100],
                  hintText: "Password"),
              controller: _passController,
            ),
            SizedBox(
              height: 16,
            ),
            Container(
              width: double.infinity,
              child: FlatButton(
                child: Text("Login"),
                textColor: Colors.black,
                padding: EdgeInsets.all(16),
                onPressed: () async {
                  final email = _emailController.text.toString().trim();
                  final pass = _passController.text.toString().trim();

                  FirebaseUser user = await login(email, pass);
                  var us = await userID();

                  if (user != null) {
                    //ref.child(us).push().key;
                    //ref.child("name").push().set(name);
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => HomeScreen()));
                  } else {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => RegistrationScreen()));
                  }
                },
                color: Colors.yellow,
              ),
            )
          ],
        ),
      ),
    ));
  }

  Future<String> userID() async {
    FirebaseUser userData = await _auth.currentUser();
    final userD = userData.uid.toString();
    return userD;
  }

  Future<String> userName() async {
    FirebaseUser userData = await _auth.currentUser();
    final userName = userData.displayName.toString();
    print(userName);
    return userName;
  }
}
