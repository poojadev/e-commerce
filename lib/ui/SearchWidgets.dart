//
//
//
//import 'package:flutter/material.dart';
//import 'package:flutter/widgets.dart';
//import 'package:gamerszone/util/ui/searchkar.dart';
//import 'package:provider/provider.dart';
//
//
//class SearchWidget extends StatelessWidget {
//  // This widget is the root of your application.
//  @override
//  Widget build(BuildContext context) {
//    return MaterialApp(
//        title: 'Flutter Demo',
//        theme: ThemeData(
//          primarySwatch: Colors.blue,
//
//        ),
//        home: ChangeNotifierProvider<AppState>(
//          builder: (_) => AppState(),
//          child: SearchWidgetState(),
//        ));
//  }
//}
//class SearchWidgetState extends StatefulWidget {
//  SearchWidgetState({Key key,
//
//    this.title}) : super(key: key);
//
//  // This widget is the home page of your application. It is stateful, meaning
//  // that it has a State object (defined below) that contains fields that affect
//  // how it looks.
//
//  // This class is the configuration for the state. It holds the values (in this
//  // case the title) provided by the parent (in this case the App widget) and
//  // used by the build method of the State. Fields in a Widget subclass are
//  // always marked "final".
//  final String title;
//
//  @override
//  _SearchWidgetState createState() => _SearchWidgetState();
//
//}
//
//
//
////List<GamePublisherResult>publisherDetailsResult=new List();
//
//
//
//class _SearchWidgetState extends State<SearchWidgetState> {
//  @override
//  Widget build(BuildContext context) {
//    // TODO: implement build
//    final appState = Provider.of<AppState>(context);
//
//
//    return appState.searchs();
//}
//
//}
