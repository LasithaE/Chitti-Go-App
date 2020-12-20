import 'package:chitti/screens/AddChitti.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:chitti/screens/LoginScreen.dart';

class RegistrationScreen extends StatelessWidget {
  final _emailController = TextEditingController();
  final _passController = TextEditingController();
  final _nameController = TextEditingController();
  FirebaseAuth _auth = FirebaseAuth.instance;
  Future<bool> registerUser(String email, String pass, String name) async {
    FirebaseAuth _auth = FirebaseAuth.instance;
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(
          email: email, password: pass);
      FirebaseUser user = result.user;
      UserUpdateInfo info = UserUpdateInfo();
      info.displayName = name;
      user.updateProfile(info);
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(32),
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 100,
                ),
                Text(
                  "Registration",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 36,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 32,
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
                      hintText: "Name"),
                  controller: _nameController,
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  width: double.infinity,
                  child: FlatButton(
                    child: Text("Register"),
                    textColor: Colors.black,
                    padding: EdgeInsets.all(16),
                    onPressed: () async {
                      final email = _emailController.text.toString().trim();
                      final pass = _passController.text.toString().trim();
                      final name = _nameController.text.toString().trim();

                      bool result = await registerUser(email, pass, name);
                      if (result) {
                        var us = await userID();
                        print('userid');
                        print(us);
                        //var name = await userName();
                        print('name');
                        print(name);
                        final fb = FirebaseDatabase.instance;
                        final ref = fb.reference().child("Users");
                        ref.child(us).set({'name': name, 'chittis': []});
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => AddChitti()));
                      } else {
                        print("Error!");
                      }
                    },
                    color: Colors.yellow,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Center(
                  child: Container(
                    child: Align(
                        child: InkWell(
                      child: Text('Already a Member ? Log in'),
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => LoginScreen()));
                      },
                    )),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<String> userID() async {
    FirebaseUser userData = await _auth.currentUser();
    final userD = userData.uid.toString();
    return userD;
  }

  Future<String> userName() async {
    FirebaseUser userData = await _auth.currentUser();
    final userName = userData.displayName;
    print(userName);
    return userName;
  }
}
