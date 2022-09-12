


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../util/localstorage/SharedPref.dart';

final _auth = FirebaseAuth.instance;
//login function
void signIn(String email, String password,BuildContext context) async {






  print("email: ${email}, password: ${password}");
  print("before");

  //     .then((uid) => {
  //           Fluttertoast.showToast(msg: "Login Successful"),
  //           Navigator.of(context).pushReplacement(
  //               MaterialPageRoute(builder: (context) => HomeScreen())),
  //           // Navigator.push(context,
  //           //     MaterialPageRoute(builder: (context) => HomeScreen())),
  //         })
  //     .catchError((e) {
  //   Fluttertoast.showToast(msg: e.message);
  // });
}