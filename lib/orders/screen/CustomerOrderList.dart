
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:esrsshopping/userlogin/controller/FirebaseService.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../ui/sizeConfig.dart';
import '../../util/constants.dart';
import '../../util/localstorage/SharedPref.dart';

class CustomerOrderList extends StatefulWidget {
  static const String routeName= "/CustomerOrderList";

  const CustomerOrderList({Key? key}) : super(key: key);

  @override
  _CustomerOrderListState createState() => _CustomerOrderListState();
}




















class _CustomerOrderListState extends State<CustomerOrderList> {

  String userId="";

  getUserId() async {
    await UserAuthSharedPreferences.instance
        .getStringValue("id")
        .then((value) {
      userId = value;
    });
  }

  @override
  void initState() {
    super.initState();
    getUserId().whenComplete(() {
      setState(() {});
    });
  }




  Widget confirmOrderList() {

    print("userI" +userId);
    return                 Container(
        color: Colors.white,
        child: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection("sellerOrders").where("sellerUserId",isEqualTo: userId)

              .snapshots(),
          builder:
              (context, AsyncSnapshot<QuerySnapshot> snapshot) {

            return !snapshot.hasData
                ? const Center(
              child: CircularProgressIndicator(),
            )
                : SizedBox(
              height: SizeConfig.heightMultiplier*80,
              width: SizeConfig.widthMultiplier*93,
              child: ListView.builder(
                  itemCount: snapshot.data?.size,
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    // QueryDocumentSnapshot<Object?>?
                    // documentSnapshot =
                    // snapshot.data?;



                    //myString = myString.replaceAll(" GBP ", " "); // myString is "s t r"
                    // print("PRR" +splitted[0]);
                    // double Price= double.parse( splitted[0]);

                    // int qty = int.parse(snapshot
                    //     .data?.docs[index]
                    //     .get("qty"));
                    //



                    // print("OKKK" + to.toString());


                    return GestureDetector(
                        child: Container(
                            width:
                            SizeConfig.widthMultiplier *
                                90,

                            padding: const EdgeInsets.all(10),
                            child: Card(
                                elevation: 8,
                                color: Colors.white,
                                child: Column(
                                    children: [
                                      // CachedNetworkImage(
                                      //   imageUrl: (documentSnapshot!.get(AppConstants.productImages)[0]),
                                      //   imageBuilder: (context,
                                      //       imageProvider) =>
                                      //       Container(
                                      //         height: 100,
                                      //         width: 200,
                                      //
                                      //
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
                                      //           child:
                                      //
                                      //           Text(
                                      //               "Loading"
                                      //
                                      //
                                      //           )),
                                      //   errorWidget: (context,
                                      //       url, error) =>
                                      //       Icon(Icons.error),
                                      // ),
                                      Container(
                                        margin: const EdgeInsets
                                            .all(3),
                                        child: Text(
                                            snapshot?.data!.docs[index].get(
                                                AppConstants
                                                    .productName),
                                            style: TextStyle(
                                                fontSize: 10)),
                                      ),

                                      Container(
                                        margin: const EdgeInsets
                                            .all(13),
                                        child: Text(
                                            snapshot.data!.docs[index].get(
                                                "qty").toString(),
                                            style: TextStyle(
                                                fontSize: 14)),
                                        // height: SizeConfig.heightMultiplier*2,
                                      ),




                                      Row(children: [

                                        Container(
                                          padding: EdgeInsets.all(10),

                                          child:   OutlinedButton(

                                            onPressed: () async {
                                              print("Order" +   snapshot?.data!.docs[index].get(
                                                  "customerTrasactionId") );

                                              FirebaseFirestore.instance.collection("sellerOrders").doc(snapshot?.data!.docs[index].id).update(

                                                  {
                                                    "orderstatus":"Rejected",
                                                    "sellermsg":"Sorry we could not accept your order"


                                                  }
                                              );




                                              FirebaseFirestore.instance.collection("customerOrderTable").
                                              where("customerTrasactionId",isEqualTo:        snapshot?.data!.docs[index].get(
                                                  "customerTrasactionId")

                                              )
                                                  .get().then((value) {

                                                for(int i=0;i<value.size;i++) {
                                                  FirebaseFirestore.instance
                                                      .collection(
                                                      "customerOrderTable")
                                                      .doc(value.docs[i].id).update({
                                                    "orderstatus":"Rejected",
                                                    "sellermsg":"Sorry we could not accept your order"


                                                  });
                                                }




                                              });






                                            },
                                            style: OutlinedButton.styleFrom(
                                                elevation: 6,
                                                // padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                                                padding: const EdgeInsets.all(15),

                                                backgroundColor: Colors.black,
                                                shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.circular(30))),
                                            child: const Text(
                                              'Reject',
                                              style: TextStyle(fontSize: 15,color: Colors.white),
                                            ),
                                          ),
                                        ),



                                        Container(
                                          padding: EdgeInsets.all(10),
                                          child:   OutlinedButton(

                                            onPressed: () async {
                                              FirebaseFirestore.instance.collection("sellerOrders").doc(snapshot?.data!.docs[index].id).update(

                                                  {
                                                    "orderstatus":"Accepted",
                                                    "sellermsg":"Delivery On the way"


                                                  }
                                              );




                                              FirebaseFirestore.instance.collection("customerOrderTable").
                                              where("customerTrasactionId",isEqualTo:       snapshot?.data!.docs[index].get(
                                                  "customerTrasactionId")

                                              )
                                                  .get().then((value) {

                                                for(int i=0;i<value.size;i++) {
                                                  FirebaseFirestore.instance
                                                      .collection(
                                                      "customerOrderTable")
                                                      .doc(value.docs[i].id).update({
                                                    "orderstatus":"Accepted",
                                                    "sellermsg":"Delivery On the way"




                                                  });
                                                }




                                              });


                                            },
                                            style: OutlinedButton.styleFrom(
                                                elevation: 6,
                                                // padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                                                padding: const EdgeInsets.all(15),

                                                backgroundColor: Colors.black,
                                                shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.circular(30))),
                                            child: const Text(
                                              'Accept',
                                              style: TextStyle(fontSize: 15,color: Colors.white),
                                            ),
                                          ),
                                        )



                                      ],),



                                      SizedBox(height: 10,)


                                    ]))),
                        // setState(() {



                        //
                        // Container(
                        //   height: 90,
                        //   width: 200,
                        //   margin: EdgeInsets.all(3),
                        //   child: FadeInImage.memoryNetwork(
                        //       fit: BoxFit.cover,
                        //       placeholder: kTransparentImage,
                        //       image: documentSnapshot?.get(AppConstants.productImages)),

                        onTap: () {
                          // String pr=documentSnapshot!.get(AppConstants.cartPrice.replaceAll(" GBP", "")) ;


                          Navigator.pushNamed(context, "h",arguments: null);
                        });
                  }),
            );
          },
        )

    );
  }

  @override
  Widget build(BuildContext context) {
    getUserId();



    return LayoutBuilder(builder: (context, constraints) {
      return OrientationBuilder(builder: (context, orientation) {


        SizeConfig().init(constraints, orientation);


        return Scaffold(
            backgroundColor: Colors.white,

    body: CustomScrollView(slivers: <Widget>[
    SliverList(
    delegate: SliverChildListDelegate([




    Container(
      height: SizeConfig.heightMultiplier*90,
      width: SizeConfig.widthMultiplier*90,


      child: Column(children: [
        confirmOrderList(),

        Container(
            width: SizeConfig.widthMultiplier*45,
            height: SizeConfig.heightMultiplier*9,


            child:    OutlinedButton(
                style: OutlinedButton.styleFrom(
                    elevation: 6,
                    // padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                    padding: const EdgeInsets.all(6),

                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
                onPressed: () async{
                  Navigator.pushNamed(context, "/Home",arguments: null);

                },
                child: const Text(
                  'Back',
                  style: TextStyle(fontSize: 15,color: Colors.white),
                ))),




      ],)







    ),])

          //  filtersWidget(),

//                    ],
//                  )
//

          // ),
        )]));

        // ]));
      });
    });
  }
}
