import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:esrsshopping/util/localstorage/SharedPref.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

import '../ui/sizeConfig.dart';
import 'constants.dart';

//void main() {
//  runApp(new MaterialApp(
//    home: new SplashScreen(),
//    routes: <String, WidgetBuilder>{
//      '/Homepage': (BuildContext context) => new Homepage(),
//
//
//  },
//  ));
AppConstants appConstants = new AppConstants();
SizeConfig sizeConfig = new SizeConfig();

class SplashScreenState extends StatefulWidget {
  static const routeName="/splashscreen";
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreenState> {
//  void appRedirection() async
//  {
//
//    Navigator.push(
//        context,
//        MaterialPageRoute(
//            builder: (context) =>
//                Homepage()));
//    //  }
//  }
//  startTime() async {
//    var _duration = new Duration(seconds: 2);
//    return new Timer(_duration, appRedirection);
//  }



//  Future<GameList> getWeeklyRelease() async {
//    var _client = new HttpClient();
//    _client.badCertificateCallback =
//        (X509Certificate cert, String host, int port) => true;
//    //  print(two);
//    print(startDate);
//    print(endDate);
//    String url =
//        'https://api.rawg.io/api/games?dates=' + endDate + "," + startDate;
//    final response = await http.get(
//      url,
//      headers: {
//        "Accept": "application/json",
//        "User-agent": "techigirl.gamers_planet/1"
//      },
//    );
//    if (response.statusCode == 200) {
//      // print(System.getProperty("http.agent"));
//      print("Using hearde tme");
//      popularGameList = GameList.fromJson(json.decode(response.body));
//      print("OOO" + allGameList.results[0].name);
//      return popularGameList;
//    } else {
//      throw Exception('Failed to load post');
//    }
//    print("Splsh SREEn");
//  }

  startTime() async {
    var _duration = new Duration(seconds: 5);

    return new Timer(_duration, navigationPage);
  }

  void navigationPage() {
    //Navigator.of(context).push(Homepage());

    Navigator.of(context).pushNamedAndRemoveUntil('/',
            (Route<dynamic> route) => false);


    late bool loginFlag=false;

    UserAuthSharedPreferences.instance.getBoolValue("login").then((value) {
      print(value);

      //value=loginFlag;

      if(value==true)
      {

        Navigator.pushNamed(context, "/Home",arguments: null);

      }
      else
      {
        Navigator.pushNamed(context, "/UserLogIn",arguments: null);




      }
    }) ;


//    Navigator.push(context,
//        PageTransition(type:
//        PageTransitionType.rightToLeft, child: Homepage()));
//                                              Navigator.of(context).push(MaterialPageRoute(
//                                                  builder: (context) =>NavSlideFromRight(page: TagWiseGameListState(
//
//                                                    tagName: tagsList.results[index].name,
//                                                    id:  tagsList.results[index].id,
//                                                  )



//
  }

  @override
  void initState() {
    super.initState();

    startTime();
  }


//static GameList allGameList;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      print("connected");
      return OrientationBuilder(
        builder: (context, orientation) {
          SizeConfig().init(constraints, orientation);
          return  Scaffold(
              body: Stack(
                fit: StackFit.expand,
                children: <Widget>[
                  Container(
                    decoration:
                    BoxDecoration(color: Colors.black),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                        flex: 2,
                        child: Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
//                      CircleAvatar(
//                        backgroundColor: Colors.white,
//                        radius: 50.0,
                              //  child:

                              Padding(
                                padding: EdgeInsets.only(top: 10.0),
                              ),
                              Text(
                                "ESRS Sellers",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 24.0),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ));
        },
      );
    });
  }
}
