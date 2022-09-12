import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:esrsshopping/ui/ALertDialog.dart';
import 'package:esrsshopping/util/constants.dart';
import 'package:esrsshopping/util/localstorage/SharedPref.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../ui/sizeConfig.dart';
import '../../util/ui/MultiPickerApp.dart';
import '../controller/FirebaseService.dart';



class UserLogIn extends StatefulWidget {
  static const String routeName= "/UserLogIn";

  const UserLogIn({Key? key}) : super(key: key);

  @override
  _UserLogInState createState() => _UserLogInState();
}

class _UserLogInState extends State<UserLogIn> {


  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  late bool isLoading;
  bool _obscured = false;
  final textFieldFocusNode = FocusNode();

  void _toggleObscured() {
    setState(() {
      _obscured = !_obscured;
      if (textFieldFocusNode.hasPrimaryFocus) {
        return;
      } // If focus is on text field, dont unfocus
      textFieldFocusNode.canRequestFocus =
      false; // Prevents focus if tap on eye
    });
  }
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
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30),
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 10,
                                  spreadRadius: 7,
                                  offset: Offset(1, 1),
                                  color: Colors.grey.withOpacity(0.2))
                            ]),
                        child: TextField(
                          controller: emailController,
                          decoration: InputDecoration(
                            hintText: 'Email',
                            prefixIcon: const Icon(
                              Icons.email,
                              color: Colors.black26,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide(
                                color: Colors.black,
                                width: 1.0,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide(
                                color: Colors.black,
                                width: 1.0,
                              ),
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30)),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30),
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 10,
                                  spreadRadius: 7,
                                  offset: Offset(1, 1),
                                  color: Colors.grey.withOpacity(0.2))
                            ]),
                        child: TextField(
                          controller: passwordController,
                          decoration: InputDecoration(
                            hintText: "Password",
                            prefixIcon: Icon(
                              Icons.password,
                              color: Colors.black26,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide(
                                color: Colors.black,
                                width: 1.0,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: const BorderSide(
                                color: Colors.black,
                                width: 1.0,
                              ),
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30)),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),



                        Container(
                            width: SizeConfig.widthMultiplier*90,
                            height: SizeConfig.heightMultiplier*7,


                            child:
                        OutlinedButton(
                          style: OutlinedButton.styleFrom(
                              elevation: 6,
                             // padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                              padding: const EdgeInsets.all(15),

                              backgroundColor: Colors.black,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30))),
                          child: const Text(
                            'Sign in with Email',
                            style: TextStyle(fontSize: 15,color: Colors.white),
                          ),
                          onPressed: () async {
                            setState(() {
                              isLoading = true;
                            });

                            FirebaseService service = FirebaseService();


                            try {
                              await service.signIn(emailController.value.text, passwordController.value.text,context).then((value) async {


                                });


                  } catch (e) {
                              if (e is FirebaseAuthException) {
                                Alerts(context,e.message.toString());

                                print(e.message!);
                              }
                            }
                            setState(() {
                              isLoading = false;
                            });
                          }


                  )),



                        SizedBox(
                          height: 20,
                        ),
                        //
                        // Container(
                        //     width: SizeConfig.widthMultiplier*90,
                        //     height: SizeConfig.heightMultiplier*7,
                        //
                        //
                        //     child:    OutlinedButton(
                        //         style: OutlinedButton.styleFrom(
                        //             elevation: 6,
                        //             // padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                        //             padding: const EdgeInsets.all(15),
                        //
                        //             backgroundColor: Colors.black,
                        //             shape: RoundedRectangleBorder(
                        //                 borderRadius: BorderRadius.circular(30))),
                        //         onPressed: () async{
                        //           setState(() {
                        //             isLoading = true;
                        //           });
                        //
                        //           FirebaseService service = FirebaseService();
                        //           try {
                        //             await service.signInwithGoogle(context).then((value) {
                        //
                        //
                        //
                        //
                        //
                        //
                        //
                        //               // UserAuthSharedPreferences.instance.
                        //               // setBoolValue("login", true);
                        //               // Navigator.pushNamed(context, "/Home",arguments: null);
                        //
                        //             });
                        //             //  Navigator.pushNamedAndRemoveUntil(context, Constants.homeNavigate, (route) => false);
                        //           } catch(e){
                        //             if(e is FirebaseAuthException){
                        //               Alerts(context,e.message.toString());
                        //               print(e.message!);
                        //             }
                        //           }
                        //           setState(() {
                        //             isLoading = false;
                        //           });
                        //
                        //
                        //         },
                        //         child: const Text(
                        //           'Sign in with Gmail',
                        //           style: TextStyle(fontSize: 15,color: Colors.white),
                        //         ))),
                        //



                        Container(
                            width: SizeConfig.widthMultiplier*90,
                            height: SizeConfig.heightMultiplier*7,


                            child:
                            OutlinedButton(
                                style: OutlinedButton.styleFrom(
                                    elevation: 6,
                                    // padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                                    padding: const EdgeInsets.all(15),

                                    backgroundColor: Colors.black,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(30))),
                                child: const Text(
                                  'Sign Up',
                                  style: TextStyle(fontSize: 15,color: Colors.white),
                                ),
                                onPressed: () async {
                                  setState(() {
                                    isLoading = true;
                                  });



                                  showDialog(
                                    context: context,
                                    barrierDismissible: false,
                                    builder: (BuildContext context) {
                                      return
                                        Column(children: [

                                          Expanded(
                                            child: AlertDialog(
                                              //title: Text('Welcome'),
                                              content: const Text("Sign UP"),
                                              actions: [
                                                Container(
                                                    width: SizeConfig.widthMultiplier*90,
                                                    child:  Column(children: [





                                                      Container(
                                                        decoration: BoxDecoration(
                                                            color: Colors.white,
                                                            borderRadius: BorderRadius.circular(30),
                                                            boxShadow: [
                                                              BoxShadow(
                                                                  blurRadius: 10,
                                                                  spreadRadius: 7,
                                                                  offset: Offset(1, 1),
                                                                  color: Colors.grey.withOpacity(0.2))
                                                            ]),
                                                        child: TextField(
                                                          controller: emailController,
                                                          decoration: InputDecoration(
                                                            hintText: 'Email',
                                                            prefixIcon: const Icon(
                                                              Icons.email,
                                                              color: Colors.black26,
                                                            ),
                                                            focusedBorder: OutlineInputBorder(
                                                              borderRadius: BorderRadius.circular(30),
                                                              borderSide: BorderSide(
                                                                color: Colors.black,
                                                                width: 1.0,
                                                              ),
                                                            ),
                                                            enabledBorder: OutlineInputBorder(
                                                              borderRadius: BorderRadius.circular(30),
                                                              borderSide: BorderSide(
                                                                color: Colors.black,
                                                                width: 1.0,
                                                              ),
                                                            ),
                                                            border: OutlineInputBorder(
                                                                borderRadius: BorderRadius.circular(30)),
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 20,
                                                      ),




                                                      Container(
                                                        decoration: BoxDecoration(
                                                            color: Colors.white,
                                                            borderRadius: BorderRadius.circular(30),
                                                            boxShadow: [
                                                              BoxShadow(
                                                                  blurRadius: 10,
                                                                  spreadRadius: 7,
                                                                  offset: Offset(1, 1),
                                                                  color: Colors.grey.withOpacity(0.2))
                                                            ]),
                                                        child: TextField(
                                                          controller: passwordController,
                                                          keyboardType: TextInputType
                                                              .visiblePassword,
                                                          obscureText: _obscured,
                                                          decoration: InputDecoration(
                                                            floatingLabelBehavior:
                                                            FloatingLabelBehavior
                                                                .never, //Hides label on focus or if filled
                                                            labelText: "Password",
                                                            isDense:
                                                            true, // Reduces height a bit
                                                            prefixIcon: const Icon(
                                                                Icons.lock_rounded,
                                                                color: Colors.grey,
                                                                size: 24),
                                                            suffixIcon: Padding(
                                                              padding: const EdgeInsets
                                                                  .fromLTRB(0, 0, 4, 0),
                                                              child: GestureDetector(
                                                                onTap: _toggleObscured,
                                                                child: Icon(
                                                                  _obscured
                                                                      ? Icons
                                                                      .visibility_rounded
                                                                      : Icons
                                                                      .visibility_off_rounded,
                                                                  size: 24,
                                                                ),
                                                              ),
                                                            ),
                                                            hintText: "Password",

                                                            focusedBorder: OutlineInputBorder(
                                                              borderRadius: BorderRadius.circular(30),
                                                              borderSide: BorderSide(
                                                                color: Colors.black,
                                                                width: 1.0,
                                                              ),
                                                            ),
                                                            enabledBorder: OutlineInputBorder(
                                                              borderRadius: BorderRadius.circular(30),
                                                              borderSide: const BorderSide(
                                                                color: Colors.black,
                                                                width: 1.0,
                                                              ),
                                                            ),
                                                            border: OutlineInputBorder(
                                                                borderRadius: BorderRadius.circular(30)),
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 20,
                                                      ),






                                                      OutlinedButton(
                                                          style: OutlinedButton.styleFrom(
                                                              elevation: 6,
                                                              // padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                                                              padding: const EdgeInsets.all(15),

                                                              backgroundColor: Colors.black,
                                                              shape: RoundedRectangleBorder(
                                                                  borderRadius: BorderRadius.circular(30))),
                                                          onPressed: () async{
                                                            setState(() {
                                                              isLoading = true;
                                                            });

                                                            FirebaseService service = FirebaseService();
                                                            try {
                                                              await service.signUp(emailController.value.text, passwordController.value.text,context);

                                                              //  Navigator.pushNamedAndRemoveUntil(context, Constants.homeNavigate, (route) => false);
                                                            } catch(e){
                                                              if(e is FirebaseAuthException){
                                                                Alerts(context,e.message.toString());
                                                                print(e.message!);
                                                              }
                                                            }
                                                            setState(() {
                                                              isLoading = false;
                                                            });


                                                          },
                                                          child: const Text(
                                                            'Sign Up',
                                                            style: TextStyle(fontSize: 15,color: Colors.white),
                                                          ))])







                                                )





                                              ],
                                            ),
                                          )]);
                                    },
                                  );






















                                }


                            )),





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
