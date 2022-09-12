import 'dart:async';
import 'package:flutter/material.dart';


//List<GameStores> storeDetailsList;
var dio = new Dio()..options.baseUrl = AppConstants.BASE_URL;
RestApiClient restApiClient = new RestApiClient(dio);
AppConstants appConstants = new AppConstants();
int genresId;
//GameGenresDetails gameGenresDetails;
String genresName;
int pageDirection;
productDetailArguments genresDetailsArguments;
class GenresDetails extends StatelessWidget {
  static const String routeName="/GenresDetailsState";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GenresDetailsState(
//        id: genresId,
//        genresName: genresName,
//        pageDirection: pageDirection,
        genresDetailsArguments: genresDetailsArguments,
      ),
    );
  }
}

class GenresDetailsState extends StatefulWidget {
  static Map event;

  GenresDetailsState(
      {Key key, @required this.genresDetailsArguments})
      : super(key: key);

//  final int id;
//  final String genresName;
//  final int pageDirection;
  final YoutubeArguments genresDetailsArguments;

  @override
  _CreatorDetailsState createState() => _CreatorDetailsState();
}

class _CreatorDetailsState extends State<GenresDetailsState> {
  Future<void> _initializeVideoPlayerFuture;
  int pageCount = 1;
  int count;
  List<int> pages = new List();
  GameGenresDetails gameGenresDetails;


  @override
  void initState() {
    super.initState();
  }


//  @override
//  void dispose() {
//    // Ensure disposing of the VideoPlayerController to free up resources.
//    //  _controller.dispose();
////    // pageCount=0;
////     pages.clear();
//    genresGameList.results.clear();
//    pageCount = 1;
//    gameGenresDetails.description = null;
//
//    super.dispose();
//  }




  @override
  Widget build(BuildContext context) {
    //  print("url"+widget.clip);

    GameList genresGameList;


    Widget genresWiseGamesWidget() {
      return new Container(
          padding: EdgeInsets.only(left: 5, right: 5),
          decoration: BoxDecoration(
            //  color: Colors.red,
              borderRadius:
              BorderRadius
                  .all(Radius
                  .circular(
                  1)),
              border: Border.all(color:
              Colors.white30)
          ),
          height: pages.length == 0
              ? SizeConfig.heightMultiplier * 52
              : SizeConfig.heightMultiplier * 42,
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3),
            //  physics: const ScrollPhysics(),

            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: genresGameList == null ? 0 : genresGameList.results
                .length,
            itemBuilder: (context, index) {
              return new GestureDetector(
                  onTap: () {

                    YoutubeArguments genresGameListArguments = new YoutubeArguments(
                      flag: 3,

                      gameName:genresGameList.results[index].name!=null? genresGameList.results[index].name:AppConstants.noInfo
                      ,gameId: genresGameList.results[index].id!=null?genresGameList.results[index].id:AppConstants.noInfo,

                      screenShots: genresGameList.results[index].short_screenshots!=null?
                      genresGameList.results[index].short_screenshots:AppConstants.noInfo,
                      //clip:genresGameList.results[index].clip.clip!=null?genresGameList.results[index].clip.clip:AppConstants.noInfo,
                      description: genresGameList.results[index].description!=null? genresGameList.results[index].description:AppConstants.noInfo,
                      genres: genresGameList.results[index].genres!=null? genresGameList.results[index].genres:AppConstants.noInfo,
                      platforms: genresGameList.results[index].platforms!=null?genresGameList.results[index].platforms:AppConstants.noInfo,
                      rating: genresGameList.results[index].rating!=null? genresGameList.results[index].rating:AppConstants.noInfo,
                      website: genresGameList.results[index].website!=null?genresGameList.results[index].website:AppConstants.noInfo,
                      released: genresGameList.results[index].released!=null? genresGameList.results[index].released:AppConstants.noInfo,
                      stores:  genresGameList.results[index].stores!="Null"? genresGameList.results[index].stores:AppConstants.noInfo,
                    );
                    Navigator.pushNamed(context, GameDetails.routeName,arguments: genresGameListArguments);
                    //
//                    genresGameList.results[index].clip == null
//                        ? Navigator.of(context).push(MaterialPageRoute(
//                        builder: (context) =>
//                            GameDetailsStates(
//                              gameId: genresGameList.results[index].id,
//                              screenShots: genresGameList
//                                  .results[index].short_screenshots,
//                              gameName: genresGameList.results[index].name,
//                              released:
//                              genresGameList.results[index].released,
//                              rating: genresGameList.results[index].rating,
//                              stores: genresGameList.results[index].stores,
//                              clip: "no",
//                              genres: genresGameList.results[index].genres,
//                              platforms:
//                              genresGameList.results[index].platforms,
//                              flag: 1,
//                            )))
//                        : Navigator.of(context).push(MaterialPageRoute(
//                        builder: (context) =>
//                            GameDetailsStates(
//                              gameId: genresGameList.results[index].id,
//                              screenShots: genresGameList
//                                  .results[index].short_screenshots,
//                              gameName: genresGameList.results[index].name,
//                              released:
//                              genresGameList.results[index].released,
//                              rating: genresGameList.results[index].rating,
//                              stores: genresGameList.results[index].stores,
//                              clip: genresGameList.results[index].clip.clip,
//                              genres: genresGameList.results[index].genres,
//                              platforms:
//                              genresGameList.results[index].platforms,
//                              flag: 1,
//                              description:
//                              genresGameList.results[index].description,
//                              systemRequirement: genresGameList
//                                  .results[index].platforms[index].requirements,
//                            )));
                  },
                  child: AnimationConfiguration.staggeredGrid(
                      position: index,
                      duration: const Duration(milliseconds: 375),
                      columnCount: genresGameList.results.length,
                      child: ScaleAnimation(
                          child: FadeInAnimation(
//
                            child: Container(

                                padding: EdgeInsets.only(
                                    left: 1 * SizeConfig.heightMultiplier,
                                    right: 1 * SizeConfig.heightMultiplier,
                                    bottom: 1 * SizeConfig.heightMultiplier),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: <Widget>[
                                    genresGameList.results[index]
                                        .background_image !=
                                        null
                                        ? Container(

                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors
                                                  .white30)),
//                                                      padding: EdgeInsets.only(left: 1 * SizeConfig.heightMultiplier,right:1 * SizeConfig.heightMultiplier,
//                                                      bottom: 1 * SizeConfig.heightMultiplier),

                                      height: SizeConfig
                                          .imageSizeMultiplier *
                                          20,
                                      width: SizeConfig
                                          .widthMultiplier *
                                          34,

                                      child:


                                      CachedNetworkImage(
                                        imageUrl: genresGameList
                                            .results[index]
                                            .background_image,
                                        imageBuilder: (context,
                                            imageProvider) =>
                                            Container(
                                              decoration: BoxDecoration(
                                                image: DecorationImage(
                                                  image: imageProvider,
                                                  fit: BoxFit
                                                      .cover,
                                                  //  colorFilter:
                                                  //    ColorFilter.mode(Colors.red, BlendMode.colorBurn)
                                                ),
                                              ),
                                            ),
                                        placeholder: (context,
                                            url) =>
                                            Container(

                                                alignment: Alignment
                                                    .center,
                                                child:

                                                FlareActor(
                                                    'assets/loader.flr',
                                                    alignment: Alignment
                                                        .center,
                                                    fit: BoxFit
                                                        .contain,
                                                    animation: "loader"


                                                )),
                                        errorWidget: (context,
                                            url, error) =>
                                            Icon(Icons.error),
                                      ),
                                    )
                                        : Container(decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Colors
                                                .white30)),
//                                                      padding: EdgeInsets.only(left: 1 * SizeConfig.heightMultiplier,right:1 * SizeConfig.heightMultiplier,
//                                                      bottom: 1 * SizeConfig.heightMultiplier),

                                      height: SizeConfig
                                          .imageSizeMultiplier *
                                          20,
                                      width: SizeConfig
                                          .widthMultiplier *
                                          34,
                                      child: Center(child: Text(
                                        "No Image avaliable",
                                        style: AppTheme.subTitleLights,
                                        textScaleFactor: 0.9,)),
                                    ),
//                                              Expanded(
//                                                  flex: 1,
//                                                  child:

                                    Expanded(
                                      child:
                                      Container(
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Colors
                                                    .white30)),
                                        height: SizeConfig
                                            .heightMultiplier *
                                            6.8,
                                        width: SizeConfig
                                            .widthMultiplier *
                                            34,
                                        padding: EdgeInsets.only(
                                            left: 1 *
                                                SizeConfig.heightMultiplier,
                                            top: 2),
                                        child: Text(
                                          genresGameList.results[index].name,
                                          style: AppTheme.subTitleLights,
                                          textScaleFactor: 0.9,
                                          //  textAlign: TextAlign.center,
                                        ),
                                      ),),
                                    //),
                                  ],
                                )),
//                                              ))
//
//                                      )
//                                    ])

                          ))));
            },
          ));
    }

    Widget footerWidget() {
      // pages.add(pageCount);
      print("wee" + pages.length.toString());
      return FractionallySizedBox(
          widthFactor: 1,
          child: Container(
              height: SizeConfig.heightMultiplier * 9.5,
              width: SizeConfig.widthMultiplier * 1,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
//        gridDelegate:
//        SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 20.0),
                shrinkWrap: true,

                itemCount: pages == null ? 0 : pages.length,
                itemBuilder: (context, index) {
                  //     print("index" +index.toString());
                  //   print("pageCount" +pages[pageCount].toString());

                  // index=1;

                  return Container(
//                  onTap: () {
//                    Navigator.of(context).pop();
//                  },
                    child: index != 0
                        ? new Container(


                      // (foo==1)?something1():(foo==2)? something2():(foo==3)? something3(): something4();
//(i == 1) ? 1 : (i == 2) ? 2 : 0
                        color: pageCount == index
                            ? Colors.red : Colors.black,
//                      color: pageNumber == index
//                          ? Colors.red
//                          : pageNumber == 1 ? Colors.red : Colors.black,
                        //  width: 5,
                        padding:
                        EdgeInsets.only(left: 2.0, right: 2.0, top: 0.2),
                        child: Card(
                          //   color: pageCount == index ? Colors.red : Colors.black,
                            elevation: 10.0,
                            child: Container(
                              //    height: SizeConfig.heightMultiplier*1,
                              width: SizeConfig.widthMultiplier * 14,
                              child: RaisedButton(
                                  onPressed: () {
                                    setState(() {
                                      // index==0?index++:index;


                                      pageCount = index;
                                    });
                                    print("Pressed" + index.toString());
                                    print("pressed index" +
                                        pages[index].toString());
                                  },
                                  color: Color.fromRGBO(32, 32, 32, 5),
                                  padding: EdgeInsets.only(
                                      left: 10.0, right: 5.0, top: 0.8),
                                  child: Text(
                                    '${index}',
                                    style: TextStyle(color: Colors.white),
                                  )),

////
                            )
                        )

                      //  subtitle: Text('${games.result[index].platformDetails[0].details.id}'),
                    )
                        : Container(),
                  );
                },
              )));
    }






    return LayoutBuilder(builder: (context, constraints) {
      return OrientationBuilder(
          builder: (context, orientation) {
            SizeConfig().init(constraints, orientation);
            return Scaffold(
                backgroundColor: Color.fromRGBO(21, 21, 21, 5),
                bottomNavigationBar:          FutureBuilder(
                    future: restApiClient
                        .showListOfGamesByGenres("com.gamersgram/1",1, widget.genresDetailsArguments.gameId)
                        .then((GameList responses) {
                      //  publisherListLv = responses;
                      //  print("PAGE COUNT IN PUBLISHER" + publisherListLv.count.toString());
                      int pageCounts =
                      (responses.count / responses.results.length)
                          .floor();
                      // print("printcode" + pageCount.toString());
                      pages = new List();
                      //  print("editingController pages" + pages.length.toString());

                      for (int i = 1; i < pageCounts; i++) {
                        //  print("pp"+pg.floor().toString());
                        pages.add(i);
                        //  i == pageCount ? pages.add(pageCount) : i;
                        //  print("PGE COUNt" + pages.length.toString());

                      }
                    }

                    ),
                    builder:
                        (BuildContext context,
                        AsyncSnapshot snapshot) {
                      return

                        footerWidget();

//                            ],);
                    }),


//      drawer: Drawer(),
//      backgroundColor: Colors.orangeAccent,
//      appBar: AppBar(
//        title: Text('Bee Video'),
//        backgroundColor: Colors.black87,
//      ),
                // Use a FutureBuilder to display a loading spinner while waiting for the
                // VideoPlayerController to finish initializing.
                body: CustomScrollView(slivers: <Widget>[
//        SliverAppBar(
//        pinned: true,
//        expandedHeight: 256.0,
////                      flexibleSpace: FlexibleSpaceBar(
////                        title: Text('Title'),
////                      ),
//      ),
                  SliverList(
                      delegate: SliverChildListDelegate([

                        Container(

                            padding: EdgeInsets.only(
                                top: SizeConfig.heightMultiplier + 10),
                            width: SizeConfig.widthMultiplier * 100,
                            height: SizeConfig.heightMultiplier * 10,
                            child: Card(
                                color: Color.fromRGBO(21, 21, 21, 2),
                                elevation: 6,

                                child:

                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  // mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[

                                    Container(
                                        width: SizeConfig.widthMultiplier * 10,

                                        child: GestureDetector(
                                          child: Row(children: <Widget>[
                                            Expanded(
                                              flex: 1,
                                              child: Icon(

                                                Icons.arrow_back_ios,
                                                color: Colors.white,

                                                size: 6 * SizeConfig
                                                    .imageSizeMultiplier,
                                              ),
                                            )
                                          ],),
                                          onTap: () {
                                            YoutubeArguments genresDetailsArguments=new YoutubeArguments(gameId: widget.genresDetailsArguments.gameId,
                                                gameName: widget.genresDetailsArguments.gameName,flag: 2);
                                            widget.genresDetailsArguments.flag == 2
                                                ?

                                            Navigator.pushNamed(context, GenresHomePage.routeName)

                                                : Navigator.pushNamed(context,

                                                '/');
                                          },
                                        )),
                                    Container(
                                        width: SizeConfig.widthMultiplier * 80,

                                        alignment: Alignment.center,
                                        child:
                                        Text(widget.genresDetailsArguments.gameName,
                                          style: AppTheme.mainTitles,
                                          textScaleFactor: 1.2,)),


                                  ],))),


                        Container(

                            padding: EdgeInsets.only(top: 5),
                            height: SizeConfig.heightMultiplier * 30,
                            decoration: BoxDecoration(
                              //  color: Colors.red,
                                borderRadius:
                                BorderRadius
                                    .all(Radius
                                    .circular(
                                    1)),
                                border: Border.all(color:
                                Colors.white30)
                            ),
                            child: Container(

                              // color: Colors.yellowAccent,

                              // height: SizeConfig.heightMultiplier * 10,
                                child:

                                Column(
                                    children: <Widget>[


                                      FutureBuilder(
                                          future: restApiClient
                                              .showGameGenresDetails("com.gamersgram/1",widget.genresDetailsArguments.gameId)
                                              .then((
                                              GameGenresDetails responses) {
                                            gameGenresDetails = responses;
                                            print("GEMER NAME" +
                                                gameGenresDetails.name);
                                          }),
                                          builder: (BuildContext context,
                                              AsyncSnapshot snapshot) {
                                            return gameGenresDetails != null
                                                ? Column(
                                              children: <Widget>[
                                                gameGenresDetails != null
                                                    ? Container(
                                                    height: SizeConfig
                                                        .heightMultiplier *
                                                        28,


//                                                height: SizeConfig
//                                                        .heightMultiplier *
//                                                    15,

                                                    child:gameGenresDetails.description.isNotEmpty?
                                                    SingleChildScrollView(
                                                      scrollDirection:
                                                      Axis.vertical,

                                                      child: Text(
                                                        html2md.convert(
                                                            gameGenresDetails
                                                                .description),
                                                        style: AppTheme
                                                            .subTitleLights,
                                                        textScaleFactor:
                                                        1.1,
                                                        softWrap: true,
                                                      ),

                                                      padding: EdgeInsets
                                                          .only(left: SizeConfig
                                                          .heightMultiplier +
                                                          5, right: SizeConfig
                                                          .heightMultiplier +
                                                          5),
//
                                                    ):
                                                    Center(child:(Text("No info available :(",
                                                      style: AppTheme.subTitleLights,textScaleFactor: 1.2,))))


                                                // style: AppTheme.subText,


                                                // style: AppTheme.subText,

                                                    : Container(
                                                    height: SizeConfig
                                                        .heightMultiplier * 10,
                                                    child: FlareActor(
                                                        'assets/loader.flr',
                                                        alignment: Alignment
                                                            .center,
                                                        fit: BoxFit.contain,
                                                        animation: "loader"


                                                    )),


                                              ],
                                            )
                                                : Container(height: SizeConfig
                                                .heightMultiplier * 10,
                                                child: FlareActor(
                                                    'assets/loader.flr',
                                                    alignment: Alignment.center,
                                                    fit: BoxFit.contain,
                                                    animation: "loader"


                                                ));
                                          })
                                    ]))),


                        Column(children: <Widget>[


                          Container(
                              height: SizeConfig.heightMultiplier * 7,
                              alignment: Alignment.center,
                              padding: EdgeInsets.all(
                                  SizeConfig.heightMultiplier + 5),
                              child: Text(widget.genresDetailsArguments.gameName +
                                  " game list",
                                softWrap: true,
                                style: AppTheme.subTitleLights,
                                textScaleFactor: 1.3,

                              )),
//
//
//              Container(
//                height: SizeConfig.heightMultiplier*50,

//                child: Column(children: <Widget>[
//
//
//
//
//                  Container(
//                    height: SizeConfig.heightMultiplier*40,
//                    color: Colors.green,
                          FutureBuilder(
                              future: pageCount != 1
                                  ? restApiClient
                                  .showListOfGamesByGenres("com.gamersgram/1",pageCount, widget.genresDetailsArguments.gameId)
                                  .then((GameList responses) {
                                genresGameList = responses;
                              })
                                  : restApiClient
                                  .showListOfGamesByGenres("com.gamersgram/1",pageCount, widget.genresDetailsArguments.gameId)
                                  .then((GameList responses) {
                                genresGameList = responses;
                                int pageCounts =
                                (responses.count / responses.results.length)
                                    .floor();
                                // print("printcode" + pageCount.toString());
                                pages = new List();

                                for (int i = 1; i < pageCounts; i++) {
                                  //  print("pp"+pg.floor().toString());
                                  pages.add(i);
                                }
                              }),
                              builder: (BuildContext context,
                                  AsyncSnapshot snapshot) {
                                if (genresGameList == null) {
                                  return Container(
                                      height: SizeConfig.heightMultiplier * 15,

                                      child: FlareActor('assets/loader.flr',
                                          alignment: Alignment.center,
                                          fit: BoxFit.contain,
                                          animation: "loader"


                                      ));
                                }
                                return Column(
//              scrollDirection: Axis.vertical,
//
//              shrinkWrap: true,
                                  //   padding: EdgeInsets.all(5),

                                  children: <Widget>[


                                    genresWiseGamesWidget(),
//                                    pages.length != 0
//                                        ? footerWidget()
//                                        : Container(),

                                  ],);
                              }),


                        ],),


//                ],),)

                        //  filtersWidget(),

//                    ],
//                  )
//

                        // ),
                      ]))
                ])
            );
            // ]));
          });
    });
  }
}
