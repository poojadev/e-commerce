// import 'dart:async';
// import 'dart:convert';
// import 'dart:io';
//
// import 'package:flutter/material.dart';
// import 'package:gamersgram/dashboard/homepage.dart';
// import 'package:gamersgram/game/gamelist/GameListPOJO.dart';
// import 'package:gamersgram/network/restApiClient.dart';
// import 'package:gamersgram/publishers/ui/PublisherHomePage.dart';
// import 'package:gamersgram/util/constants.dart';
// import 'package:gamersgram/util/ui/sizeConfig.dart';
// import 'package:dio/dio.dart';
// import 'package:http/http.dart' as http;
//
// //void main() {
// //  runApp(new MaterialApp(
// //    home: new SplashScreen(),
// //    routes: <String, WidgetBuilder>{
// //      '/Homepage': (BuildContext context) => new Homepage(),
// //
// //
// //  },
// //  ));
// //}
//
// var dio = new Dio()..options.baseUrl = AppConstants.BASE_URL;
// RestApiClient restApiClient = new RestApiClient(dio);
// AppConstants appConstants = new AppConstants();
// SizeConfig sizeConfig = new SizeConfig();
//
// class SplashScreenState extends StatefulWidget {
//   static const routeName="/splashscreen";
//   @override
//   _SplashScreenState createState() => _SplashScreenState();
// }
//
// class _SplashScreenState extends State<SplashScreenState> {
// //  void appRedirection() async
// //  {
// //
// //    Navigator.push(
// //        context,
// //        MaterialPageRoute(
// //            builder: (context) =>
// //                Homepage()));
// //    //  }
// //  }
// //  startTime() async {
// //    var _duration = new Duration(seconds: 2);
// //    return new Timer(_duration, appRedirection);
// //  }
//
//   String startDate = AppConstants.changeDateFormat(
//       DateTime.now().subtract(Duration(days: 7)).toString(), ("yyyy-MM-dd"));
//   String endDate =
//       AppConstants.changeDateFormat(DateTime.now().toString(), ("yyyy-MM-dd"));
//
// //  Future<GameList> getWeeklyRelease() async {
// //    var _client = new HttpClient();
// //    _client.badCertificateCallback =
// //        (X509Certificate cert, String host, int port) => true;
// //    //  print(two);
// //    print(startDate);
// //    print(endDate);
// //    String url =
// //        'https://api.rawg.io/api/games?dates=' + endDate + "," + startDate;
// //    final response = await http.get(
// //      url,
// //      headers: {
// //        "Accept": "application/json",
// //        "User-agent": "techigirl.gamers_planet/1"
// //      },
// //    );
// //    if (response.statusCode == 200) {
// //      // print(System.getProperty("http.agent"));
// //      print("Using hearde tme");
// //      popularGameList = GameList.fromJson(json.decode(response.body));
// //      print("OOO" + allGameList.results[0].name);
// //      return popularGameList;
// //    } else {
// //      throw Exception('Failed to load post');
// //    }
// //    print("Splsh SREEn");
// //  }
//
//   startTime() async {
//     var _duration = new Duration(seconds: 5);
//
//     return new Timer(_duration, navigationPage);
//   }
//
//   void navigationPage() {
//     //Navigator.of(context).push(Homepage());
//
//     Navigator.of(context).pushNamedAndRemoveUntil('/',
//             (Route<dynamic> route) => false);
// //    Navigator.push(context,
// //        PageTransition(type:
// //        PageTransitionType.rightToLeft, child: Homepage()));
// //                                              Navigator.of(context).push(MaterialPageRoute(
// //                                                  builder: (context) =>NavSlideFromRight(page: TagWiseGameListState(
// //
// //                                                    tagName: tagsList.results[index].name,
// //                                                    id:  tagsList.results[index].id,
// //                                                  )
//
//
//
// //
//   }
//
//   @override
//   void initState() {
//     super.initState();
//
//     startTime();
//   }
//
//
// //static GameList allGameList;
//   @override
//   Widget build(BuildContext context) {
//     return LayoutBuilder(builder: (context, constraints) {
//       print("connected");
//       return OrientationBuilder(
//         builder: (context, orientation) {
//           SizeConfig().init(constraints, orientation);
//           return  Scaffold(
//                   body: Stack(
//             fit: StackFit.expand,
//             children: <Widget>[
//               Container(
//                 decoration:
//                     BoxDecoration(color: Color.fromRGBO(35, 31, 30, 10)),
//               ),
//               Column(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: <Widget>[
//                   Expanded(
//                     flex: 2,
//                     child: Container(
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: <Widget>[
// //                      CircleAvatar(
// //                        backgroundColor: Colors.white,
// //                        radius: 50.0,
//                           //  child:
//                           Container(
//                             height: 150,
//                             child: Image.asset(
//                               "assets/gz.png",
//                             ),
//                          ),
//                           Padding(
//                             padding: EdgeInsets.only(top: 10.0),
//                           ),
//                           Text(
//                             "Gamer Gram",
//                             style: TextStyle(
//                                 color: Colors.red,
//                                 fontWeight: FontWeight.bold,
//                                 fontSize: 24.0),
//                           )
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               )
//             ],
//           ));
//         },
//       );
//     });
//   }
// }
