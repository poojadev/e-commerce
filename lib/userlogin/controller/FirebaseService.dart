import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../util/localstorage/SharedPref.dart';

class FirebaseService {
  late  FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<String?> signInwithGoogle(BuildContext context) async {
    try {
      final GoogleSignInAccount? googleSignInAccount =
      await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleSignInAuthentication =
      await googleSignInAccount!.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,



      );



      var snapShot;
    //  await _auth.signInWithCredential(credential).then((values)


        print("inside login");

        // snapShot = await FirebaseFirestore.instance
        //     .collection('buyerDetails')
        //     .doc() // varuId in your case
        //     .get();


        CollectionReference collectionReference =
        FirebaseFirestore.instance.collection("sellerDetails");
        QuerySnapshot querySnapshot = await collectionReference.get();
        querySnapshot.docs.isNotEmpty;
        if ( querySnapshot.docs.isNotEmpty) {
          print("insdie if  login" +querySnapshot.docs.length.toString());

          for (int i = 0; i < querySnapshot.docs.length; i++) {
            if (querySnapshot.docs[i].get("buyerEmailId") ==
                googleSignInAccount.email) {
              // UserAuthSharedPreferences.instance.
              // setStringValue("id", documentId!);
              UserAuthSharedPreferences.instance.
              setStringValue("id", querySnapshot.docs[i]!.id);
              Navigator.pushNamed(context, "/Home", arguments: null);
              UserAuthSharedPreferences.instance.
              setBoolValue("login", true);
            }



          }}
        else if (querySnapshot.docs.isEmpty) {
          print("inside  esle if login" + querySnapshot.toString());


          String documentId =
          DateTime
              .now()
              .millisecondsSinceEpoch
              .toString();
          FirebaseFirestore.instance
              .collection('sellerDetails')
              .doc(documentId)
              .set({
            'sellerName': googleSignInAccount.displayName,
            'sellerEmailId': googleSignInAccount.email,
            'sellerUserId': documentId,
            'sellerAddress': "",
            'sellerPhone': "",

          }).then((_) {
            UserAuthSharedPreferences.instance.
            setStringValue("id", documentId!);

            Navigator.pushNamed(context, "/Home", arguments: null);
            UserAuthSharedPreferences.instance.
            setBoolValue("login", true);
          });
        }
        else {
          print("inside login" + snapShot.get("buyerEmailId"));
          print("inside login" + googleSignInAccount.email);
          Navigator.pushNamed(context, "/Home", arguments: null);
          UserAuthSharedPreferences.instance.
          setBoolValue("login", true);
        }








    } on FirebaseAuthException catch (e) {
      print(e.message);
      throw e;
    }
  }
  var auth;
  Future signIn(String email, String password,BuildContext context)
 async {
   try {



       await FirebaseAuth.instance.signInWithEmailAndPassword(
         email: email,
         password: password
     ).then((value)async {
         CollectionReference collectionReference =
         FirebaseFirestore.instance.collection(
             "sellerDetails");
         QuerySnapshot querySnapshot = await collectionReference
             .get();
         querySnapshot.docs.isNotEmpty;
         if (querySnapshot.docs.isNotEmpty) {


           for (int i = 0; i <
               querySnapshot.docs.length; i++) {
             print("sellerDetails if  login   3" +
                 querySnapshot.docs[i].get(
                     "sellerEmailId"));

             if (querySnapshot.docs[i].get(
                 "sellerEmailId") ==
                 email) {


              FirebaseFirestore.instance.collection("sellerDetails").where("sellerEmailId",isEqualTo: email)



                  .get().then((value){

                    for(int i=0;i<value.size;i++) {
                      String userId = value.docs[i].id;

                UserAuthSharedPreferences.instance.
                setStringValue("id", userId);
                print("USER ID" + userId
                );
              }
              });

               Navigator.pushNamed(
                   context, "/Home", arguments: null);
               UserAuthSharedPreferences.instance.
               setBoolValue("login", true);
               print(' user found for that email.');
             }
           }
         }




       }
     );
   } on FirebaseAuthException catch (e) {
     if (e.code == 'user-not-found') {
       print('No user found for that email.');
     } else if (e.code == 'wrong-password') {
       print('Wrong password provided for that user.');
     }
   }
        }



  //login function
  Future signUp(String email, String password,BuildContext context) async {
    await _auth.createUserWithEmailAndPassword(
        email: email, password: password).then((value)async {



    }).then((value)async{

      CollectionReference collectionReference =
      FirebaseFirestore.instance.collection(
          "sellerDetails");
      QuerySnapshot querySnapshot = await collectionReference
          .get();
      querySnapshot.docs.isNotEmpty;
      if (querySnapshot.docs.isNotEmpty) {

        print("inside  esle if login 2" +
            querySnapshot.toString());


        String documentId =
        DateTime
            .now()
            .millisecondsSinceEpoch
            .toString();
        FirebaseFirestore.instance
            .collection('sellerDetails')
            .doc(documentId)
            .set({
          'sellerName': ""
          ,
          'sellerEmailId':email,
          'sellerUserId': documentId,
          'sellerAddress': "",
          'sellerPhone': "",

        }).then((_) {
          UserAuthSharedPreferences.instance.
          setStringValue("id", documentId!);

          Navigator.pushNamed(
              context, "/UserLogIn", arguments: null);
          UserAuthSharedPreferences.instance.
          setBoolValue("login", true);
        });
      }
      else {

        Navigator.pushNamed(
            context, "/UserLogIn", arguments: null);
      //  UserAuthSharedPreferences.instance.
       // setBoolValue("login", true);
      }

    });
  }

  Future<void> signOutFromGoogle() async{
    await _googleSignIn.signOut();
    await _auth.signOut();
  }
}
