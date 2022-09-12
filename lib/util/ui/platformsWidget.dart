//import 'package:flutter/material.dart';
//import 'package:flutter/widgets.dart';
//import 'package:gamerszone/network/restApiClient.dart';
//import 'package:gamerszone/platforms/model/PlatformListPOJO.dart';
//import 'package:gamerszone/util/constants.dart';
//import 'package:gamerszone/util/ui/AppTheme.dart';
//import 'package:gamerszone/util/ui/sizeConfig.dart';
//import 'package:video_player/video_player.dart';
//import 'package:carousel_slider/carousel_slider.dart';
//import 'package:flutter_rating_bar/flutter_rating_bar.dart';
//import 'package:dio/dio.dart';
//import 'package:autocomplete_textfield/autocomplete_textfield.dart';
//import 'dart:typed_data';
//import 'package:draggable_scrollbar/draggable_scrollbar.dart';
//import 'package:cached_network_image/cached_network_image.dart';
//import 'package:dio/dio.dart';
//
//import 'package:flutter/foundation.dart';
//var dio = new Dio()..options.baseUrl = AppConstants.BASE_URL;
//RestApiClient restApiClient = new RestApiClient(dio);
//AppConstants appConstants = new AppConstants();
//SizeConfig sizeConfig = new SizeConfig();
//class PlatformDropDown extends StatefulWidget {
//  @override
//  PlatformDropDownState createState() => PlatformDropDownState();
//}
//
//
//
//List<PlatformListDetails>platformList=new List();
//
//String currentText = "";
//var currentSelectedValue;
//var _SelectdType="Select";
//int pageCount=1;
//class PlatformDropDownState extends State<PlatformDropDown> {
//
//
//
//  Widget gamePlatformWidget() {
//    return new Row(children: <Widget>[
//      new
//
//
//      Container(
//        color: Colors.white,
//        padding: EdgeInsets.all(5),
////          elevation: 11,
////          shape: RoundedRectangleBorder(side: BorderSide(color: Colors.blue),borderRadius: BorderRadius.all(Radius.elliptical(90, 90))),
//
//
//        // padding: new EdgeInsets.all(16.0),
//
//        child:
//
//        DropdownButtonHideUnderline(child:
//
//
//        new DropdownButton<int>(
//          style: TextStyle(color: Colors.white, decorationColor: Colors.white),
//
//          items: platformList.map((PlatformListDetails val) {
//            return DropdownMenuItem<int>(
//
//              value: val.id,
//              child: new Container(
//                padding: EdgeInsets.only(right: 5, left: 5),
//                color: Colors.white,
//                child: Text(val.name, style: TextStyle(color: Colors.black),),
//
//
//              ),
//            );
//          }).toList(),
//          // hint:Text("Sort By"),
//          hint: Text(_SelectdType),
//          value: currentSelectedValue,
//
//          isDense: true,
//          onChanged: (newValue) {
//            setState(() {
//              currentSelectedValue = newValue;
//            });
//
//
//            print(currentSelectedValue);
//          },),),
//
//
//      )
//    ]);
//  }
//
//    @override
//  Widget build(BuildContext context) {
//    return   FutureBuilder(
//        future: restApiClient
//            .showPlatformList(pageCount)
//            .then((PlatformList responses) {
//
//              platformList.addAll(responses.results);
//        }),
//        builder:
//            (BuildContext context, AsyncSnapshot snapshot) {
//          if (snapshot.hasData == null) {
//            return Container(
//                child: CircularProgressIndicator(
//                    valueColor:
//                    AlwaysStoppedAnimation<Color>(
//                        Colors.green)));
//          }
//          return gamePlatformWidget();
//        });
//
//    }
//}
//
//
//
//
