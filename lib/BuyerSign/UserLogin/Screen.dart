
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'Service/FirebaseService.dart';
class MyApps extends StatelessWidget {
  const MyApps({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ESRS Shopping',
      theme: ThemeData(

        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const BuyerLogin(title: 'Flutter Demo Home Page'),
    );
  }
}
class BuyerLogin extends StatefulWidget {
  const BuyerLogin({Key? key, required String title}) : super(key: key);

  @override
  _BuyerLoginState createState() => _BuyerLoginState();
}

class _BuyerLoginState extends State<BuyerLogin> {
  bool isLoading = false;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  void _create() async {
    try {
      await firestore.collection('sellers').doc('users').set({
        'firstName': 'Ganu',
        'lastName': 'shiva',
      });
    } catch (e) {
      print(e);
    }
  }



















  @override
  Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
    ),
    body:




      SingleChildScrollView(child: Column(children: [
      Center(child: Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
              image: AssetImage('images/2.jpg'),
              fit: BoxFit.fill
          ),
        ),
      ),),



        ElevatedButton(onPressed: () async{

          _create();


        },
            style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(30.0),
            ),),
            child: Text('Create')),

      ElevatedButton(onPressed: () async{
        setState(() {
          isLoading = true;
        });

        FirebaseService service = FirebaseService();
        try {
          await service.signInwithGoogle();
        //  Navigator.pushNamedAndRemoveUntil(context, Constants.homeNavigate, (route) => false);
        } catch(e){
          if(e is FirebaseAuthException){
            print(e.message!);
          }
        }
        setState(() {
          isLoading = false;
        });


      },
          style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(30.0),
          ),),
          child: Text('Sign in with Gmail'))




    ],)));
  }
}
