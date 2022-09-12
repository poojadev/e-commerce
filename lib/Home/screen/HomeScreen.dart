
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../ui/sizeConfig.dart';
import '../../util/localstorage/SharedPref.dart';

class HomePage extends StatefulWidget {
  static const String routeName= "/Home";

  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {

    return
      Scaffold(



          body:   LayoutBuilder(builder: (context, constraints) {
            return OrientationBuilder(
                builder: (context, orientation) {
                  SizeConfig().init(constraints, orientation);



                  return  SingleChildScrollView(

                    child:  Container(
                      height: SizeConfig.heightMultiplier*80,
                      // width: SizeConfig.widthMultiplier*90,
                      padding: const EdgeInsets.all(25),

                      child:


                      Column(

                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [



                          Container(
                              width: SizeConfig.widthMultiplier*90,
                              height: SizeConfig.heightMultiplier*7,


                              child:    OutlinedButton(
                                  style: OutlinedButton.styleFrom(
                                      elevation: 6,
                                      // padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                                      padding: const EdgeInsets.all(15),

                                      backgroundColor: Colors.black,
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(30))),
                                  onPressed: () async{
                                    Navigator.pushNamed(context, "/CustomerOrderList",arguments: null);



                                  },
                                  child: const Text(
                                    'Show Orders',
                                    style: TextStyle(fontSize: 15,color: Colors.white),
                                  ))),



                              SizedBox(height: 20,),


                          Container(
                              width: SizeConfig.widthMultiplier*90,
                              height: SizeConfig.heightMultiplier*7,


                              child:    OutlinedButton(
                                  style: OutlinedButton.styleFrom(
                                      elevation: 6,
                                      // padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                                      padding: const EdgeInsets.all(15),

                                      backgroundColor: Colors.black,
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(30))),
                                  onPressed: () async{

                                    Navigator.pushNamed(context, "/ProductList",arguments: null);



                                  },
                                  child: const Text(
                                    'Upload Products',
                                    style: TextStyle(fontSize: 15,color: Colors.white),
                                  ))),


                          SizedBox(height: 20,),


                          Container(
                              width: SizeConfig.widthMultiplier*90,
                              height: SizeConfig.heightMultiplier*7,


                              child:    OutlinedButton(
                                  style: OutlinedButton.styleFrom(
                                      elevation: 6,
                                      // padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                                      padding: const EdgeInsets.all(15),

                                      backgroundColor: Colors.black,
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(30))),
                                  onPressed: () async{

                                    await FirebaseAuth.instance.signOut().then((value)
                                    {

                                      UserAuthSharedPreferences.instance.
                                      setBoolValue("login", false);

                                      UserAuthSharedPreferences.instance.
                                      setStringValue("id", " ");

                                      Navigator.pushNamed(
                                          context, "/UserLogIn", arguments: null);


                                    });





                                  },
                                  child: const Text(
                                    'Logout',
                                    style: TextStyle(fontSize: 15,color: Colors.white),
                                  ))),






                        ],
                      ),
                    ),


                    // ],
                    // ),
                    //   ),
                    // ),
                  );
                });
          }));

  }
}
