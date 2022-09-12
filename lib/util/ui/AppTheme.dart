
import 'package:esrsshopping/util/ui/sizeConfig.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static var _greetingLight;
  static var _titleLight;
  static var  _buttonLight;
  static var _searchLight;
  static var _titleDark;
  static var _buttonDark;
  static var _greetingDark;
  static var _searchDark;


  AppTheme._();

//  static const Color subTitleColor = Colors.white;
//  static const Color TitleTextColor =  Color.fromRGBO(68, 68, 68, 10);

//  static final ThemeData lightTheme = ThemeData(
//    scaffoldBackgroundColor: AppTheme.appBackgroundColor,
//    brightness: Brightness.light,
//    textTheme: lightTextTheme,
//  );
//
//  static final ThemeData darkTheme = ThemeData(
//    scaffoldBackgroundColor: Colors.black,
//    brightness: Brightness.dark,
//    textTheme: darkTextTheme,
//  );
//
//  static final TextTheme lightTextTheme = TextTheme(
//    title: _titleLight,
//  //  subtitle: _subTitleLight,
//    button: _buttonLight,
//    display1: _greetingLight,
//    display2: _searchLight,
//
//
//  );
//
//  static final TextTheme darkTextTheme = TextTheme(
//    title: _titleDark,
//    subtitle: _subTitleDark,
//    button: _buttonDark,
//    display1: _greetingDark,
//    display2: _searchDark,
//  );
//
//  static final TextTheme titleTextTheme = TextTheme(
//    title: _titleDark,
//    subtitle: _subTitleLight,
//  //  button: _buttonDark,
//  //  display1: _greetingDark,
//   // display2: _searchDark,
//  );
  static  final TextStyle  subTitleLight = TextStyle(
    color: Color.fromRGBO(68, 68, 68, 10),
    fontSize: 2 * SizeConfig.textMultiplier,
    fontStyle: FontStyle.normal,
    height: 2,
  );


  static  final TextStyle  subText = TextStyle(
    color: Colors.white,
    decoration: TextDecoration.underline,
    fontSize: 2.5 * SizeConfig.textMultiplier,
    height: 1.5,
  );
  static final TextStyle subTitleLights = TextStyle(
    color: Colors.white,
    fontSize: 2 * SizeConfig.textMultiplier,
    fontFamily: "Sofia",



    //height: 1.3,
  );

  static final TextStyle textGridTitle = TextStyle(
    color: Colors.white,
    //fontFamily: "Rock Salt",
    //  fontFamily: "Sofia",
    //  fontSize: SizeConfig.heightMultiplier

    height: 1.0,
  );


  static final TextStyle headingsDetail = TextStyle(
      color: Colors.white30,
      //fontFamily: "Rock Salt",
      fontFamily: "Sofia",
      fontSize: SizeConfig.heightMultiplier + 3

    // height: 1.0,
  );
  static final TextStyle mainTitles = TextStyle(
      color: Colors.white,
      fontSize: 1.9 * SizeConfig.textMultiplier,
      fontFamily: "Sofia",
      fontWeight: FontWeight.bold);


  static final TextStyle descText = TextStyle(
    color: Colors.white,
    fontFamily: "Sofia",
    fontSize: SizeConfig.heightMultiplier + 5,

  );
  //static final TextStyle _subTitleDark = _subTitleLight.copyWith(color: Colors.white70);
}


/*

Text.rich(
  TextSpan(
    text: 'Hello ',
    style: TextStyle(fontSize: 50),
    children: <TextSpan>[
      TextSpan(
          text: 'world',
          style: TextStyle(
            decoration: TextDecoration.underline,
          )),
      // can add more TextSpans here...
    ],
  ),
)
 */