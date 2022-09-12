import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:esrsshopping/Screens/searchprodcuts/model/SearchProductFiltersPOJO.dart';
// import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../util/ui/AppTheme.dart';
import '../../../util/ui/sizeConfig.dart';


// class SearchProducts extends StatelessWidget
// {
//   const SearchProducts({Key? key}) : super(key: key);
//
// // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         appBarTheme: const AppBarTheme(color: Colors.black),
//         backgroundColor: Colors.grey[900],
//         primaryColor: Colors.grey[900],
//       ),
//       home: const SearchProducts(),
//     );
//   }
//
//
//
// }
class SearchProductsState extends StatefulWidget {
  const SearchProductsState({Key? key}) : super(key: key);

  @override
  _SearchProductsState createState() => _SearchProductsState();
}



class _SearchProductsState extends State<SearchProductsState> {

  late SearchProductFiltersPOJO searchProductFiltersPOJO;
  List<SearchProductFiltersPOJO>searchProductFilters =
  [
    SearchProductFiltersPOJO(
      id: "1",
      FilterName: "Cloths",
      image: "No Images available",
    ),


    SearchProductFiltersPOJO(
      id: "2",
      FilterName: "Shoes",
      image: "Error while uploading images ",
    ),


    SearchProductFiltersPOJO(
      id: "1",
      FilterName: "Food",
      image: "dsfsf",
    ),


  ];


  CollectionReference _collectionRef =
  FirebaseFirestore.instance.collection('product');

  Future<SearchProductFiltersPOJO> getProdcuts() async {
    // Get docs from collection reference
    QuerySnapshot querySnapshot = await _collectionRef.get();

    // Get data from docs and convert map to List
    final result= querySnapshot.docs.map((doc) => doc.data()).toList();
    for(int i=0;i<result.length;i++)
      {

        // List<SearchProductFiltersPOJO>searchProductFilters =
        // [
        //   searchProductFiltersPOJO(
        //       id:result[i]
        //
        //
        //
        //   )
        //
        // ];

      }
    return searchProductFiltersPOJO;

  }


  Future<SearchProductFiltersPOJO> getRecentlyAddedProducts(
      ) async {

    searchProductFiltersPOJO = (await FirebaseFirestore.instance
        .collection('product').get()) as SearchProductFiltersPOJO;


    for(int i=0;i<searchProductFiltersPOJO.id.length;i++) {
      print("response" + searchProductFiltersPOJO.id.toString());


    }

    return searchProductFiltersPOJO;


  }

  /* recently added products by sellers */

  Widget recentlyAddedProducts() {
    print(SizeConfig.heightMultiplier * 24);
    return Align(
        alignment: Alignment.topCenter,
        child: Directionality(
            textDirection: TextDirection.ltr,
            child: new Container(
                height: SizeConfig.heightMultiplier * 24,
                //   width: SizeConfig.widthMultiplier*6,
                child: ListView.builder(
                  // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
                  // physics: const NeverScrollableScrollPhysics(),

                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: searchProductFiltersPOJO == null ? 0 : searchProductFiltersPOJO.id.length
                      ,
                  itemBuilder: (context, index) {
                    return new GestureDetector(
                        onTap: () {
                          /*
                              Switching and  passing data to TvShowDetailsPage

                            */



                         // Navigator.pushNamed(context, GameDetails.routeName,arguments: allGamesArguments);

                        },
                        child:
                        Container(

                                      padding: EdgeInsets.only(
                                          left: 1 * SizeConfig.heightMultiplier,
                                          right: 1 *
                                              SizeConfig.heightMultiplier,
                                          bottom: 1 *
                                              SizeConfig.heightMultiplier),
                                      child: Column(
                                        //mainAxisSize: MainAxisSize.min,
                                        children: <Widget>[
                                     Container(
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: Colors
                                                        .white30)),
//                                                      padding: EdgeInsets.only(left: 1 * SizeConfig.heightMultiplier,right:1 * SizeConfig.heightMultiplier,
//                                                      bottom: 1 * SizeConfig.heightMultiplier),

                                            height: SizeConfig
                                                .heightMultiplier *
                                                17,
                                            width: SizeConfig
                                                .widthMultiplier *
                                                34,

                                            child:


                                            // CachedNetworkImage(
                                            //   imageUrl: searchProductFiltersPOJO
                                            //       .image,
                                            //   imageBuilder: (context,
                                            //       imageProvider) =>
                                            //       Container(
                                            //         decoration: BoxDecoration(
                                            //           image: DecorationImage(
                                            //             image: imageProvider,
                                            //             fit: BoxFit
                                            //                 .cover,
                                            //             //  colorFilter:
                                            //             //    ColorFilter.mode(Colors.red, BlendMode.colorBurn)
                                            //           ),
                                            //         ),
                                            //       ),
                                            //   placeholder: (context,
                                            //       url) =>
                                            //       Container(
                                            //
                                            //           alignment: Alignment
                                            //               .center,
                                            //        ),
                                            //   errorWidget: (context,
                                            //       url, error) =>
                                            //       Icon(Icons.error),
                                            // ),
                                        //  )
//                                               : Container(
//                                             decoration: BoxDecoration(
//                                                 border: Border.all(
//                                                     color: Colors
//                                                         .white30)),
// //                                                      padding: EdgeInsets.only(left: 1 * SizeConfig.heightMultiplier,right:1 * SizeConfig.heightMultiplier,
// //                                                      bottom: 1 * SizeConfig.heightMultiplier),
//
//                                             height: SizeConfig
//                                                 .imageSizeMultiplier *
//                                                 17,
//                                             width: SizeConfig
//                                                 .widthMultiplier *
//                                                 34,
//                                             child: Center(child: Text(
//                                               "No Image avaliable",
//                                               style: AppTheme.subTitleLights,
//                                               textScaleFactor: 0.9,)),
//                                           ),
// //                                              Expanded(
// //                                                  flex: 1,
// //                                                  child:

                                          Expanded(
                                            child:
                                            Container(
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color: Colors
                                                          .white30)),
                                              height: SizeConfig
                                                  .heightMultiplier *
                                                  7.8,
                                              width: SizeConfig
                                                  .widthMultiplier *
                                                  34,
                                              padding: EdgeInsets.only(left: 1 *
                                                  SizeConfig.heightMultiplier,
                                                  top: 2),
                                              child: Text(
                                                searchProductFiltersPOJO.FilterName,
                                                style: AppTheme.subTitleLights,
                                                textScaleFactor: 1.2,

                                                //  textAlign: TextAlign.center,
                                              ),
                                            ),),
                                          )
                                          ],
                                      )),
//                                              ))
//
//                                      )
//                                    ])

                                );
                  },
                ))));
  }











  Widget productFilterList() {
    //return LayoutBuilder(builder: (context, boxSizing) {
//      var sizingInformation = SizingInformation(
//        orientation: mediaQuery.orientation,
//        deviceType: getDeviceType(mediaQuery),
//        screenSize: mediaQuery.size,
//        localWidgetSize: Size(boxSizing.maxWidth, boxSizing.maxHeight),
//      );
//   print("Size info" +sizingInformation.screenSize.toString());
//   print( SizeConfig.heightMultiplier);

    return new Container(
      //padding: EdgeInsets.only(left: 5, right: 5),
//            decoration: BoxDecoration(
//              //  color: Colors.red,
//                borderRadius:
//                BorderRadius
//                    .all(Radius
//                    .circular(
//                    1)),
//                border: Border.all(color:
//                Colors.white30)
//            ),
        height: searchProductFilters.length == 0
            ? SizeConfig.heightMultiplier * 98
            : SizeConfig.heightMultiplier * 98,
        child: ListView.builder(
//              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                  crossAxisCount: 3),

          padding: EdgeInsets.all(SizeConfig.heightMultiplier),
          // physics: const NeverScrollableScrollPhysics(),
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: searchProductFilters == null ? 0 : searchProductFilters
              .length,
          itemBuilder: (context, index) {
            return new GestureDetector(
              onTap: () {
                /*
                              Switching and  passing data to TvShowDetailsPage
                            */


              },


              child: Card(
//                                height: SizeConfig.heightMultiplier*90,
//                                  width: SizeConfig.widthMultiplier*90,
                  elevation: 11,
                  color: Colors.white12,


//                                  child: Column(
//                                //    mainAxisSize: MainAxisSize.max,
//                                    children: <Widget>[

//                                              Expanded(
//                                                  flex: 1,
//                                                  child:


                  child: Container(width: SizeConfig.widthMultiplier * 90,
                    height: SizeConfig.heightMultiplier * 15,
                    color: Colors.white12,

                    child: Row(children: <Widget>[

//                                   Container(width: SizeConfig.widthMultiplier*30,
//                                     height: SizeConfig.heightMultiplier*15,
//
//                                     child:  searchProductFilters[index]
//                                         .image !=
//                                         null
//                                         ? Container(
//
// //                                            decoration: BoxDecoration(
// //                                                border: Border.all(
// //                                                    color: Colors
// //                                                        .white30)),
// //                                                      padding: EdgeInsets.only(left: 1 * SizeConfig.heightMultiplier,right:1 * SizeConfig.heightMultiplier,
// //                                                      bottom: 1 * SizeConfig.heightMultiplier),
//
//                                       height: SizeConfig
//                                           .imageSizeMultiplier *
//                                           20,
// //                                            width: SizeConfig
// //                                                .widthMultiplier *
// //                                                34,
//
//                                       child:
//
//
//                                       CachedNetworkImage(
//                                         imageUrl: searchedGameList
//                                             .results[index]
//                                             .background_image,
//                                         imageBuilder: (context,
//                                             imageProvider) =>
//                                             Container(
//                                               decoration: BoxDecoration(
//                                                 image: DecorationImage(
//                                                   image: imageProvider,
//                                                   fit: BoxFit
//                                                       .cover,
//                                                   //  colorFilter:
//                                                   //    ColorFilter.mode(Colors.red, BlendMode.colorBurn)
//                                                 ),
//                                               ),
//                                             ),
//                                         placeholder: (context,
//                                             url) =>
//                                             Container(
//
//                                                 alignment: Alignment
//                                                     .center,
//                                                 child:
//
//                                                 FlareActor(
//                                                     'assets/loader.flr',
//                                                     alignment: Alignment
//                                                         .center,
//                                                     fit: BoxFit
//                                                         .contain,
//                                                     animation: "loader"
//
//
//                                                 )),
//                                         errorWidget: (context,
//                                             url, error) =>
//                                             Icon(Icons.error),
//                                       ),
//                                     )
//                                         : Container(decoration: BoxDecoration(
//                                         border: Border.all(
//                                             color: Colors
//                                                 .white30)),
// //                                                      padding: EdgeInsets.only(left: 1 * SizeConfig.heightMultiplier,right:1 * SizeConfig.heightMultiplier,
// //                                                      bottom: 1 * SizeConfig.heightMultiplier),
//
//                                       height: SizeConfig
//                                           .imageSizeMultiplier *
//                                           20,
//                                       width: SizeConfig
//                                           .widthMultiplier *
//                                           34,
//                                       child: Center(child: Text(
//                                         "No Image avaliable",
//                                         style: AppTheme.subTitleLights,
//                                         textScaleFactor: 0.9,)),
//                                     ),
//
//                                   ),


                      Container(width: SizeConfig.widthMultiplier * 60,
                        height: SizeConfig.heightMultiplier * 10,

                        child: Column(children: <Widget>[
                          Expanded(
                            child:
                            Container(

//
                              padding: EdgeInsets.only(left: 1 *
                                  SizeConfig.heightMultiplier,
                                  top: 2),
                              alignment: Alignment.topLeft,
                              child: Text(
                                searchProductFilters[index].FilterName,
                                style: AppTheme.subTitleLights,
                                textScaleFactor: 1,
                                //  textAlign: TextAlign.center,
                              ),
                            ),),


                        ],),


                      ),


                    ],),


                  )


                //),
//                                    ],
//                                  )

              ),
//                                              ))
//
//                                      )
//                                    ])

            );
          },
        ));
    // });
  }


  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return OrientationBuilder(
          builder: (context, orientation) {
            SizeConfig().init(constraints, orientation);

            return  SingleChildScrollView(

                  child:  Column(children: [


                     // productFilterList(),



                    // FutureBuilder(
                    //        future: getRecentlyAddedProducts(),
                    //        builder: (context, snapshot) {
                    //          print("Connection state inside");
                    //
                    //        switch (snapshot.connectionState) {
                    //            case ConnectionState.waiting:
                    //              return const Center(
                    //                child: CircularProgressIndicator(),
                    //              );
                    //            case ConnectionState.done:
                    //              if (snapshot.hasError) {
                    //                return Text(snapshot.error.toString());
                    //              } else {
                    //                return recentlyAddedProducts();
                    //              }
                    //
                    //
                    //            default:
                    //              return Text('No data availabvle');
                    //          }
                    //        },
                    //      )
                    ],
                    ),
              //   ),
              // ),
            );
          });
    });
  }
}