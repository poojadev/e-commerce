import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
// import 'package:multi_image_picker2/multi_image_picker2.dart';
import '../util/ui/sizeConfig.dart';
import '../utils/MultiPickerApp.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class UploadProductsScreen extends StatelessWidget {
  const UploadProductsScreen({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(color: Colors.black),
        backgroundColor: Colors.grey[900],
        primaryColor: Colors.grey[900],
      ),
      home: const UploadProducts(),
    );
  }
}

class UploadProducts extends StatefulWidget {
  const UploadProducts({Key? key}) : super(key: key);

  @override
  _UploadProductsState createState() => _UploadProductsState();
}

class _UploadProductsState extends State<UploadProducts> {
  @override
  Widget build(BuildContext context) {
    TextEditingController ProductName = new TextEditingController();
    TextEditingController ProductDescription = new TextEditingController();
    TextEditingController ProductQuantity = new TextEditingController();
    TextEditingController ProductPrice = new TextEditingController();
    TextEditingController ProductLocation = new TextEditingController();
    SfRangeValues _values = SfRangeValues(40.0, 80.0);




   /*
       Price range
    */
    RangeValues _rangeValues = RangeValues(0.3, 0.7);


    int flag=1;
    List<Asset> images = <Asset>[];
    List<Asset> gridImages = <Asset>[];

    List<String> imageUrls = <String>[];
    String _error = 'No Error Dectected';
    bool isUploading = false;
   late  Asset asset;
    Widget buildGridView() {

      print("Inside gridview" +gridImages.length.toString());
      print("Inside gridview flag value" +flag.toString());

      return GridView.count(
        //shrinkWrap: true,
        scrollDirection: Axis.vertical,
        crossAxisCount: 3,

        children: List.generate(gridImages.length, (index) {
            asset = gridImages[index];
            print(asset.getByteData(quality: 100));

          return Padding(
            padding: EdgeInsets.all(8.0),
            child: Container(
              color: Colors.deepOrangeAccent,

              // backgroundColor: MultiPickerApp.darker,
              // backgroundDarkerColor: MultiPickerApp.darker,
              height: 100,
              width: 200,
              // borderDarkerColor: MultiPickerApp.pauseButton,
              // borderColor: MultiPickerApp.pauseButtonDarker,

              key: null,
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(15)),
                child: AssetThumb(
                  asset: asset,
                  width: 100,
                  height: 100,
                ),
              ),
            ),
          );
        }),
      );
    }

/*
  Upload images on storage
 */


    Future<dynamic> postImage(Asset imageFile) async {
      String fileName = DateTime
          .now()
          .millisecondsSinceEpoch
          .toString();
      Reference reference = FirebaseStorage.instance.ref().child(fileName);
      UploadTask uploadTask = reference
          .putData((await imageFile.getByteData()).buffer.asUint8List());
      TaskSnapshot storageTaskSnapshot = await uploadTask.whenComplete(() {
        var url = reference.getDownloadURL();
        print("url" + url.toString());
      }).catchError((onError) {
        print(onError);
      });
      print("Ref" + storageTaskSnapshot.ref.getDownloadURL().toString());
      return storageTaskSnapshot.ref.getDownloadURL();
    }

    /*
      get data between 2 price ranges

     */
    ///TODO- add user input for price range

    Future<QuerySnapshot> getProductsBetweenPrices(
        ) async {

      final response = await FirebaseFirestore.instance
          .collection('product')
          .where(
          'productPrice',
          isGreaterThan: "1200" ,
          isLessThan: "500",
         ).get();
      for(int i=0;i<response.size;i++) {
        print("response" + response.docs[i].get("productName"));
      }
      return response;

    }


///this function will return products between two price  range

    Future<QuerySnapshot> getProductsWithRange(
        ) async {

      final response = await FirebaseFirestore.instance
          .collection('product')
          .where(
        'productPrice',
        isGreaterThan: "1200" ,
        isLessThan: "500",
      ).get();


      for(int i=0;i<response.size;i++) {
        print("response" + response.docs[i].get("productName"));

      }

      return response;


    }











    Future<void> loadAsset(gridImages) async {
      List<Asset> resultList = <Asset>[];
      String error = 'No Error Dectected';
      print("images lenght" +images.length.toString());
      try {

        for(int i=0;i<images.length;i++) {
          gridImages.add(resultList[i]);
          // setState(() {
          //
          // });
        }
       // gridImages =images;

        // print(resultList.length);
        // print((await resultList[0].getThumbByteData(122, 100)));
        // print((await resultList[0].getByteData()));

        ///  print((await resultList[0].metadata));
        ///

      } on Exception catch (e) {
        error = e.toString();
      }


      print("gridImage length in" + gridImages.length.toString());
      // });

      // setState(() {
      //    for(int i=0;i<resultList.length;i++)
      //      {
      //        imageUrls.add(resultList[i].name.toString());
      //        print("Image added from assets" +resultList[i].name.toString());
      //      }
      images = resultList;

      _error = error;
      //});
    }






    /*  Load images from local storage */

   //  Future<void> loadAssets() async {
   //    List<Asset> resultList = <Asset>[];
   //    String error = 'No Error Dectected';
   //    try {
   //      resultList = await MultiImagePicker.pickImages(
   //        maxImages: 10,
   //        enableCamera: true,
   //        selectedAssets: images,
   //         cupertinoOptions: CupertinoOptions(takePhotoIcon: "chat"),
   //          materialOptions: const MaterialOptions(
   //          actionBarColor: "#abcdef",
   //          actionBarTitle: "Upload Image",
   //          allViewTitle: "All Photos",
   //          useDetailsView: false,
   //          selectCircleStrokeColor: "#000000",
   //        ),
   //      )
   //    ;
   //      // print(resultList.length);
   //      // print((await resultList[0].getThumbByteData(122, 100)));
   //      // print((await resultList[0].getByteData()));
   //
   //      ///  print((await resultList[0].metadata));
   //      ///
   //
   //    } on Exception catch (e) {
   //      error = e.toString();
   //    }
   //    gridImages=resultList;
   //
   //  //  setState(() {
   //
   //    // buildGridView();
   //    //loadAsset(gridImages);
   //
   //      print("Flag value" +flag.toString());
   //
   //  //  });
   //
   //    if (!mounted) return;
   //   // setState(() {
   //      print("gridImage length" + gridImages.length.toString());
   //   // });
   //
   // // setState(() {
   // //    for(int i=0;i<resultList.length;i++)
   // //      {
   // //        imageUrls.add(resultList[i].name.toString());
   // //        print("Image added from assets" +resultList[i].name.toString());
   // //      }
   //      images = resultList;
   //
   //      _error = error;
   //    //});
   //  }

    /* upload images to FireBase Storage  */


    // void uploadImages(){
    //   for ( var imageFile in images) {
    //     postImage(imageFile).then((downloadUrl) {
    //       imageUrls.add(downloadUrl.toString());
    //       if(imageUrls.length==images.length){
    //         String documnetID = DateTime.now().millisecondsSinceEpoch.toString();
    //         FirebaseFirestore.instance.collection('images').doc(documnetID).set({
    //           'urls':imageUrls
    //         }).then((_){
    //           SnackBar snackbar = SnackBar(content: Text('Uploaded Successfully'));
    //           widget.globalKey.currentState?.showSnackBar(snackbar);
    //           setState(() {
    //             images = [];
    //             imageUrls = [];
    //           });
    //         });
    //       }
    //     }).catchError((err) {
    //       print(err);
    //     });
    //   }
    //
    // }


    return Scaffold(
        appBar: AppBar(
          title: Text('Stripe Tutorial'),
        ),


        bottomNavigationBar:BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.deepOrangeAccent,
          selectedItemColor: Colors.white,
          elevation: 4.0,

          unselectedItemColor: Colors.white.withOpacity(.60),
          selectedFontSize: 14,
          unselectedFontSize: 14,
          onTap: (value) {
            // Respond to item press.
            print("Menu pressed" +value.toString());
            switch(value)
            {
              case 0:





                break;
            }

          },
          items: const [
            BottomNavigationBarItem(
              label: "Search",
              icon: Icon(Icons.search),
            ),
            BottomNavigationBarItem(
              label: "Home",
              icon: Icon(Icons.home),
            ),
            BottomNavigationBarItem(
              label: "Favorites",
              icon: Icon(Icons.favorite),
            ),
            BottomNavigationBarItem(
              label: "cart",
              backgroundColor: Colors.deepOrangeAccent,
              icon: Icon(Icons.shopping_cart),
            ),
            BottomNavigationBarItem(
              label: "settings",
              icon: Icon(Icons.settings),
            ),
          ],
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: SizedBox(

              height: 900,
              width: 900,

              child:


          Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              const SizedBox(
                height: 100,
                child: Text("Upload Products"),
              ),
              Gap(5, crossAxisExtent: 20),
              Container(
                  padding: const EdgeInsets.all(10),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    controller: ProductName,
                    decoration: const InputDecoration(
                      hintText: 'Product Name',
                      hintStyle: TextStyle(color: Colors.grey),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      ),
                    ),
                  )),
              const Gap(5, crossAxisExtent: 20),
              Container(
                  padding: const EdgeInsets.all(10),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    controller: ProductQuantity,
                    decoration: const InputDecoration(
                      hintText: 'Quantity',
                      hintStyle: TextStyle(color: Colors.grey),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      ),
                    ),
                  )),
              const Gap(5, crossAxisExtent: 20),
              Container(
                  padding: const EdgeInsets.all(10),
                  child: TextFormField(
                    controller: ProductPrice,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      hintText: 'Price',
                      hintStyle: TextStyle(color: Colors.grey),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      ),
                    ),
                  )),
              const Gap(5, crossAxisExtent: 20),
              Container(
                padding: const EdgeInsets.all(10),
                child: TextFormField(
                  minLines: 2,
                  maxLines: 5,
                  controller: ProductDescription,
                  keyboardType: TextInputType.multiline,
                  decoration: const InputDecoration(
                    hintText: 'Description',
                    hintStyle: TextStyle(color: Colors.grey),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    ),
                  ),
                ),
              ),


              const Gap(5, crossAxisExtent: 20),


              SizedBox(
                // height: 200,
                // width: 400,
                child: Column(
                  children: <Widget>[
                   // SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        InkWell(
                          onTap:()async
                          {
                            await loadAssets();

                             await  getProductsWithRange();









                          },
                          child: ThreeDContainer(
                            width: 130,
                            height: 50,
                            backgroundColor: MultiPickerApp.navigateButton,
                            backgroundDarkerColor: MultiPickerApp.background,
                            borderColor: Colors.blue,
                            borderDarkerColor: Colors.red,
                            child: Center(child: Text("Pick images",
                              style: TextStyle(color: Colors.white),)),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            print("Image length" + images.length.toString());
                            if (images.isEmpty) {
                              showDialog(context: context, builder: (_) {
                                return AlertDialog(
                                  backgroundColor: Theme
                                      .of(context)
                                      .backgroundColor,
                                  content: const Text("No image selected",
                                      style: TextStyle(color: Colors.white)),
                                  actions: <Widget>[
                                    InkWell(
                                      onTap: () {
                                        Navigator.pop(context);
                                      },
                                      child: ThreeDContainer(
                                        borderColor: Colors.blue,
                                        borderDarkerColor: Colors.red,
                                        width: 80,
                                        height: 30,
                                        backgroundColor: MultiPickerApp
                                            .navigateButton,
                                        backgroundDarkerColor: MultiPickerApp
                                            .background,
                                        key: null,
                                        child: const Center(child: Text("Ok",
                                          style: TextStyle(
                                              color: Colors.white),)),
                                      ),
                                    )
                                  ],
                                );
                              });
                            }
                            else {

                              SnackBar snackbar = SnackBar(content: Text(
                                  'Please wait, we are uploading'));
                              //widget.globalKey.currentState?.showSnackBar(snackbar);
                              // uploadImages();
                            }
                          },
                          child: ThreeDContainer(
                            width: 130,
                            height: 50,
                            borderColor: Colors.blue,
                            borderDarkerColor: Colors.red,
                            backgroundColor: MultiPickerApp.navigateButton,
                            backgroundDarkerColor: MultiPickerApp.background,
                            child: const Center(child: Text("Upload Images",
                              style: TextStyle(color: Colors.white),)),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10,),
                    //
                    // SizedBox(height: 200,
                    // width: 200,
                    // child:

                  // flag==1 ?buildGridView():Text("ok")),
                 // gridImages.isNotEmpty?buildGridView(gridImages):Text("data")),

                 // FutureBuilder(
                 //        future: loadAsset(gridImages),
                 //        builder: (context, snapshot) {
                 //          print("Connection state inside");
                 //
                 //        switch (snapshot.connectionState) {
                 //            case ConnectionState.waiting:
                 //              return Center(
                 //                child: CircularProgressIndicator(),
                 //              );
                 //            case ConnectionState.done:
                 //              if (snapshot.hasError)
                 //                return Text(snapshot.error.toString());
                 //              else
                 //                return buildGridView();
                 //
                 //
                 //            default:
                 //              return Text('Unhandle State');
                 //          }
                 //        },
                 //      )),
                      // :Text("No images selected"))



                    SfRangeSlider(
                      min: 20.0,
                      max: 100.0,
                      values: _values,
                      interval: 10,
                      showTicks: true,
                      showLabels: true,
                      minorTicksPerInterval: 1,
                      onChanged: (SfRangeValues values){
                        setState(() {
                          _values = values;
                          print("VALUE" + values.toString());
                        });
                      },
                    ),



                        // : Text("No images selected"))


                  ],
                ),
              ),


              Container(
                padding: const EdgeInsets.all(20),
                height: 60,
                decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [
                        Color.fromRGBO(255, 143, 158, 1),
                        Color.fromRGBO(255, 188, 143, 1),
                      ],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(25.0),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.pink.withOpacity(0.2),
                        spreadRadius: 4,
                        blurRadius: 10,
                        offset: Offset(0, 3),
                      )
                    ]),
                child: Center(
                  child: GestureDetector(
                    onTap: () {
                      print("Selected Images length");

                      for (var imageFile in images) {
                        postImage(imageFile).then((downloadUrl) {
                          imageUrls.add(downloadUrl.toString());
                          if (imageUrls.length == images.length) {

                            print("Selected Images length"+ imageUrls.toString());
                            print("Product" +ProductName.text.toString());
                            String documnetID =
                            DateTime
                                .now()
                                .millisecondsSinceEpoch
                                .toString();
                            FirebaseFirestore.instance
                                .collection('product')
                                .doc(documnetID)
                                .set({
                              'productName': ProductName.text.toString(),
                              'productPrice': ProductPrice.text.toString(),
                              'productQuantity': ProductQuantity.text
                                  .toString(),
                              'productDescription':
                              ProductDescription.text.toString(),
                              'productImages': imageUrls,
                            }).then((_) {




                                 images = [];
                                 imageUrls = [];                              // SnackBar snackbar =
                              // SnackBar(content: Text('Uploaded Successfully'));
                              // widget.globalKey.currentState?.showSnackBar(snackbar);
                              // setState(() {
                              //   // images = [];
                              //   // imageUrls = [];
                              // });
                            });
                          }
                        }).catchError((err) {
                          print(err);
                        });
                      }
                    },
                    child: const Text("Upload Products",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontFamily: "Netflix",
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                        letterSpacing: 0.0,
                        color: Colors.white

                        ,
                      ),
                    ),
                  ),
                ),
              ),
            ]

            ,

          ))

          ,

        )

    );
  }
}
