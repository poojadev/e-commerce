import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';


//import 'package:html/parser.dart';


//const String ordering="",pageNo=" ",id=" ";
const String gameName=" ";
const String sDate=" ",eDate=" ";

class AppConstants {
  static const String BASE_URL = "https://api.rawg.io/api/";
  static const String noInfo="No info avaliable";

  static const String BASE_URL_PANDA = "https://api.pandascore.co/tournaments/";

  static const String PANDA_API_FOR_RUNNING_TOURNAMENTS = "/running?token=mR4uAC_4wM-IhISLMUin4OTZT2tIBgBk1PxRGTikPHGgROpoBRk";
  static const String PANDA_API_FOR_UPCOMING_TOURNAMENTS = "/upcoming?token=mR4uAC_4wM-IhISLMUin4OTZT2tIBgBk1PxRGTikPHGgROpoBRk";

  static const String Search_Games = "/games?search={gameName}";
  static const String Show_All_Games = "/games?page={no}&ordering={ordering}&platforms={platformId}";
  static const String Games_Series = "/games/{id}/game-series";
  static const String Games_Suggested = "/games/{id}/suggested?page={no}";
  static const String Games_Trailers = "/games/{id}/movies";
  static const String All_Games = "/games?page=1&limit=365811";
  static const String Games_Details = "/games/{id}";
  static const String Games_Youtube_Videos = "/games/{id}/youtube";


  //https://api.rawg.io/api/games/{id}/suggested
  //list of store sell the games https://api.rawg.io/api/games/3498/stores
  //https://api.rawg.io/api/games/3498/game-series
  //https://api.rawg.io/api/games/{id}/movies
  //https://api.rawg.io/api/games/{id}/youtube

  static const String ShowPlatformList = "/platforms?page={no}";
  static const String PlatformDetails = "/platforms/{id}";
  static const String PlatformWise_GameList = "/games?platforms={id}&ordering=-added";
  static const String Platform_Search_List = "/platforms?search";


  static const String Publishers = "/publishers?page={no}";
  static const String Publishers_Details = "/publishers/{id}";
  static const String List_Of_Games_By_Publisher = "/games?page={no}&publishers={id}";
  static const String Publishers_Search_List = "/publishers?search={publisherName}";


  static const String Genres = "/genres?page={no}";
  static const String Genres_Details = "/genres/{id}";
  static const String List_Of_Games_By_Genres = "/games?page={no}&genres={id}&ordering=-added";
  static const String Genres_Search_List = "/genres?search={genresName}";


  static const String Weekly_Games = '/games?dates={start}&ordering=-added';


  static const String Game_Stores = "/stores?page={no}";
  static const String Game_Store_Details = "/stores/{id}";
  static const String List_Of_Games_By_Stores = "/games?page={no}&stores={id}&ordering=-added";
  static const String Store_Search_List = "/stores?search={storeName}";


  static const String Game_Creators = "/creators?page={no}&ordering=-added";
  static const String Game_Creators_Details = "/creators/{id}";
  static const String List_Of_Games_By_Creators = "/games?page={no}&creators={id}&ordering=-added";
  static const String Creator_Search_List = "/creators?search={creatorsName}";


  static const String Game_Release_Calender = "/games?dates={dates}&ordering=-added&page={no}";


  //https://api.rawg.io/api/games?dates=2020-04-01,2020-04-30&ordering=-added?platforms=4


  //  static const String PlatformWise_GameList_With_Filters = "/games?ordering={string}&page={no}&platforms={id}";
  static const String PlatformWise_GameList_With_Filters = '/games?ordering={ordering}&page={no}&platforms={id}';


  static const String Game_Tags = "/tags?page={no}";
  static const String TagWise_GameList = "/games?page={no}&tags={id}&ordering=-added";
  static const String Tag_Search = "/tags?search={tagName}";


  // static const String Weekly_Release = "/games?dates=" +'startDate',+'endDate'+ ;
//https://api.rawg.io/api/games?page=2&stores=4
  //https://api.rawg.io/api/games?ordering=-rating&page=2&platforms=4
//   static var now = new DateTime.now();
//   static var nextWeek = DateTime.now().add(Duration(days: 7));
//
////  print(new DateFormat("MM-dd-yyyy").format(now));
//   // var startDate=DateFormat("dd-MM-yyyy").format(DateTime.now());
//  static var format = DateFormat.yMd("en_US");

// print(dateTime);rmat
  //  var  endDate=DateFormat("dd-MM-yyyy").format(DateTime.now().add(Duration(days: 7)));
//   static DateTime dateTime1 = DateTime.parse(
//       DateFormat("yyyy-MMM-dd").format(DateTime.now().add(Duration(days: 7))));

//   static DateTime changeDateFormat(DateTime dateTimes) {
//     return DateTime.parse(DateFormat("dd-MM-yyyy").format(dateTimes));
//   }

  static DateFormat dateFormatter = DateFormat('yyyy-MM-dd');

//   static  String parseHtmlString(String htmlString) {
//
//    var document = parse(htmlString);
//
//    String parsedString = parse(document.body.text).documentElement.text;
//
//    return parsedString;
//   }

  // static changeDateFormat(String dateTime, [String format]) {
  //   var formatter = new DateFormat(format ?? 'yyyy-MM-dd');
  //   return formatter.format(DateTime.parse(dateTime));
  // }

// }


  // Future<bool> check() async {
  //   var connectivityResult = await (Connectivity().checkConnectivity());
  //   if (connectivityResult == ConnectivityResult.mobile) {
  //     return true;
  //   } else if (connectivityResult == ConnectivityResult.wifi) {
  //     return true;
  //   }
  //   return false;
  // }


}

/*

  company wise game list url=https://api.rawg.io/api/games?publishers=20987
  all publisher/compnay=https://api.rawg.io/api/publishers
  game geners =https://api.rawg.io/api/genres
  https://api.rawg.io/api/games?platforms=4&page=2
https://api.rawg.io/api/publishers?page=2
https://api.rawg.io/api/games?dates=2019-12-01,2019-12-07&platforms=3

https://api.rawg.io/api/games?dates=2019-11-01,2019-11-30&ordering=-added

 */