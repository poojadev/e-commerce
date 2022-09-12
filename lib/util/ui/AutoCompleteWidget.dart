//
//
//
//
//import 'package:flutter/material.dart';
//import 'package:autocomplete_textfield/autocomplete_textfield.dart';
//
//Widget gameSearchWidget()
//{
//  return
//    Container(
//
//        color: Colors.green,
//
//
//        child:
//        textField = new AutoCompleteTextField<GameListDetails>(
//            decoration: new InputDecoration(fillColor: Colors.redAccent,
//              hintText: "Search Item",
//            ),
//            key: newkey,
//
//            submitOnSuggestionTap: true,
//            clearOnSubmit: true,
//            controller: editingController,
//            suggestions: gameListDetails,
//            textInputAction: TextInputAction.go,
//            textChanged: (item) {
//              currentText = item;
//              print("editingController names" +item);
//              //  print("names" +editingController.text);
//
//              setState(() {
//                if(item.length==0)
//                {
//                  gameListDetails.clear();
//                }
//
////              if (item
////                .contains(editingController.text)) {
//                gameListDetails==null?  CircularProgressIndicator(
//                    valueColor: AlwaysStoppedAnimation<Color>(
//                        Colors.green)): restApiClient.showSearchedGames(item.trim())
//                    .then((GameList responses) {
//                  gameListDetails=new List();
//                  gameListDetailsResponse = responses;
//                  //gameListDetails=new List();
//                  gameListDetails.addAll(responses.results);
//                  //    gameListDetailsResponse=responses;
//                  //
//                  //   gameListDetails=new List();
////
//                  //   gameListDetails.addAll(responses.results);
//                  print("length og game details" +responses.results.length.toString());
//
//                  print("count" + gameListDetailsResponse.count.toString());
//                  print("length og game details" +gameListDetails.length.toString());
//                  gameSearchResult(gameListDetails);
//
//                });
//                //  }
//
//                // textField.textField.controller.text = item;
//
//              });
//            },
//            itemSubmitted: (item) {
//
////
////            if (gameListDetailsResponse
////                .results
////                .contains(item)) {
//              setState(() {
//                currentText = item.name;
//                // gameSearchResult(gameListDetails);
//
//                //  gameListDetails.add(item);
//                print("ayyyoi");
//                // currentText = "";
//                //    textField.textField.controller.text = item.name;
//
//              });
//              // }
//
//              // gameName=item;
//
//
//            },
//            itemBuilder: (context, item) {
//              return Container();
////
////            SingleChildScrollView(child:
////            Container(height: 200,child:
////
////
////                Card(
////                    color: Colors.black38,
////                    elevation: 11,
////
////                    child:
////
////            Stack(children: <Widget>[
////
////            Padding(
////            padding: EdgeInsets.all(8.0), child: new Text(item.name)),
////              Divider(height: 2,color: Colors.black12,),
////              item.background_image!=null? Image.network(item.background_image,fit: BoxFit.cover,
////              height: 40,
////              width: 40,):Container(),
////
////            ],))));
//
//
//
//
//            },
//            itemSorter: (a, b) {
//              return a.name.compareTo(b.name);
//            },
//            itemFilter: (item, query) {
//              return item.name.toLowerCase().startsWith(query.toLowerCase());
//            }
//        ) );
//}