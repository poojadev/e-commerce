

import 'dart:collection';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:esrsshopping/ui/ALertDialog.dart';
import 'package:esrsshopping/util/constants.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:path/path.dart' as Path;

import '../../ui/sizeConfig.dart';
import '../../util/localstorage/SharedPref.dart';
import '../Model/SellerProductArguments.dart';






class SellerProductDetails extends StatelessWidget {
  static const String routeName= "/SellerProductDetails";

  late SellerProductArguments  sellerProductArguments;

  SellerProductDetails({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SellerProductDetailsState(
//        id: genresId,
//        genresName: genresName,
//        pageDirection: pageDirection,
        key: key, productDetailsArguments: productDetailArguments,
      ),
    );
  }
  }

class SellerProductDetailsState extends StatefulWidget {


  const SellerProductDetailsState(
      {Key? key,  required this.productDetailsArguments})
      : super(key: key);


//  final int id;
//  final String genresName;
//  final int pageDirection;
  final SellerProductArguments productDetailsArguments;

  @override
  _SellerProductDetailsStateState createState() => _SellerProductDetailsStateState();
}
late SellerProductArguments  productDetailArguments ;

class _SellerProductDetailsStateState extends State<SellerProductDetailsState> {
  AppConstants appConstants=new AppConstants();
  bool uploading = false;
  double val = 0;
  late CollectionReference imgRef;
  late firebase_storage.Reference ref;
  List<String> imageUrls = <String>[];
  List<String>category=<String>[];
  var catogeryId;
   List<File> _image = [];
  late String cid="";
  final picker = ImagePicker();
  late String sellerId="";




  TextEditingController ProductName = new TextEditingController();
  TextEditingController ProductDescription = new TextEditingController();
  TextEditingController ProductQuantity = new TextEditingController();
  TextEditingController ProductPrice = new TextEditingController();
  TextEditingController ProductDeliveryInfo = new TextEditingController();
  TextEditingController ProductBrand= new TextEditingController();







  chooseImage(String inputSource) async {
    // ignore: deprecated_member_use
    // final pickedFileGallery = await picker.getImage(source: ImageSource.camera);
    // final pickedFileCamera = await picker.getImage(source: ImageSource.camera);


    var pickedFileGallery;
    var pickedFileCamera;
    var  pickedImage = await picker.pickImage(
        source: inputSource == 'gallery'
            ? ImageSource.gallery
            : ImageSource.camera,
        maxWidth: 1920);

    setState(() {
      _image.add(File(pickedImage!.path));

    });

    // if(ImageSource.camera==true)
    //   {
    //     // ignore: deprecated_member_use
    //     pickedFileCamera = await picker.getImage(source: ImageSource.camera);
    //
    //     setState(() {
    //       _image.add(File(pickedFileCamera!.path));
    //
    //     });
    //
    //   }
    // else
    //   {
    //     pickedFileGallery = await picker.getImage(source: ImageSource.gallery);
    //     setState(() {
    //       _image.add(File(pickedFileGallery!.path));
    //
    //     });
    //
    //
    //   }
    //
    //

    // ignore: unnecessary_null_comparison
    if (pickedImage?.path == null) retrieveLostData();
    // if (pickedFileCamera?.path == null) retrieveLostData();
  }

  Future<void> retrieveLostData() async {
    // ignore: deprecated_member_use
    LostData response = await picker.getLostData();

    if (response.isEmpty) {
      return;
    }
    if (response.file != null) {
      //  setState(() {
      _image.add(File(response.file!.path));
      //  });
    } else {
      print(response.file);
    }
  }

  Future uploadFile() async {
    int i = 1;

    for (var img in _image) {
      //  setState(() {
      val = i / _image.length;
      //   });
      ref = firebase_storage.FirebaseStorage.instance
          .ref()
          .child('images/${Path.basename(img.path)}');
      await ref.putFile(img).whenComplete(() async {
        await ref.getDownloadURL().then((value) {
          imgRef.add({'url': value});
          i++;
        });
      });
    }
  }
  Future<dynamic> postImage(File imageFile) async {
    String fileName = DateTime
        .now()
        .millisecondsSinceEpoch
        .toString();
    Reference reference = FirebaseStorage.instance.ref().child(fileName);
    print("URLRL" +fileName);
    UploadTask uploadTask = reference
        .putData((await imageFile.readAsBytes()).buffer.asUint8List());
    TaskSnapshot storageTaskSnapshot = await uploadTask.whenComplete(() {
      var url = reference.getDownloadURL();
      print("url" + url.toString());
    }).catchError((onError) {
      print(onError);
    });
    print("Ref" + storageTaskSnapshot.ref.getDownloadURL().toString());
    return storageTaskSnapshot.ref.getDownloadURL();
  }






     @override
  void initState() {
       // TODO: implement initState
       super.initState();
     }

       @override
       Widget build(BuildContext context) {
         ProductName.text = widget.productDetailsArguments.productName;
         ProductDescription.text =
             widget.productDetailsArguments.productDescription;
         ProductQuantity.text = widget.productDetailsArguments.productQunatity.toString();
         ProductPrice.text = widget.productDetailsArguments.productPrice;
         ProductDeliveryInfo.text =
             widget.productDetailsArguments.productDeliverInfo;
         ProductBrand.text = widget.productDetailsArguments.productBrand;
        // catogeryId=widget.productDetailsArguments.categoryId;

         // for (int i = 0; i <
         //     widget.productDetailsArguments.productImages.length; i++) {
         //   _image.add(File(widget.productDetailsArguments.productImages[i]));
         // }
         print("Obj" +widget.productDetailsArguments.productImages.toString());




         return LayoutBuilder(builder: (context, constraints) {
           return OrientationBuilder(builder: (context, orientation) {


             SizeConfig().init(constraints, orientation);


             return Scaffold(
                 backgroundColor: Colors.white,

                 body: CustomScrollView(slivers: <Widget>[
                   SliverList(
                       delegate: SliverChildListDelegate([


                 Container(
                 width: SizeConfig.widthMultiplier*100,
                     margin: const EdgeInsets.only(left: 20.0, right: 20.0),




             child:


             ListView(
               children: [


                 Container(
                     padding: const EdgeInsets.all(10),
                     child: TextFormField(
                       keyboardType: TextInputType.text,
                       controller: ProductName,
                       decoration: InputDecoration(
                         hintText: widget.productDetailsArguments.productName,
                         hintStyle: TextStyle(color: Colors.grey),
                         border: OutlineInputBorder(
                           borderRadius: BorderRadius.all(
                               Radius.circular(20.0)),
                         ),
                       ),
                     )),

                 const Gap(5, crossAxisExtent: 20),


                 Container(
                     padding: const EdgeInsets.all(10),
                     child: TextFormField(
                       keyboardType: TextInputType.number,
                       controller: ProductPrice,
                       decoration: InputDecoration(
                         hintText: widget.productDetailsArguments.productPrice,
                         hintStyle: TextStyle(color: Colors.grey),
                         border: OutlineInputBorder(
                           borderRadius: BorderRadius.all(
                               Radius.circular(20.0)),
                         ),
                       ),
                     )),

                 Container(
                     padding: const EdgeInsets.all(10),
                     child: TextFormField(
                       keyboardType: TextInputType.number,
                       controller: ProductQuantity,
                       decoration: InputDecoration(
                         hintText: widget.productDetailsArguments
                             .productQunatity.toString(),
                         hintStyle: TextStyle(color: Colors.grey),
                         border: OutlineInputBorder(
                           borderRadius: BorderRadius.all(
                               Radius.circular(20.0)),
                         ),
                       ),
                     )),


                 const Gap(5, crossAxisExtent: 20),

                 Container(
                     padding: const EdgeInsets.all(10),
                     child: TextFormField(
                       keyboardType: TextInputType.text,
                       controller: ProductDescription,
                       decoration: InputDecoration(
                         hintText: widget.productDetailsArguments
                             .productDescription,

                         hintStyle: TextStyle(color: Colors.grey),
                         border: OutlineInputBorder(
                           borderRadius: BorderRadius.all(
                               Radius.circular(20.0)),
                         ),
                       ),
                     )),


                 const Gap(5, crossAxisExtent: 20),
                 Container(
                   padding: const EdgeInsets.all(10),
                   child: TextFormField(
                     minLines: 2,
                     maxLines: 5,
                     controller: ProductDeliveryInfo,
                     keyboardType: TextInputType.multiline,
                     decoration: InputDecoration(
                       hintText: widget.productDetailsArguments
                           .productDeliverInfo,
                       hintStyle: TextStyle(color: Colors.grey),
                       border: OutlineInputBorder(
                         borderRadius: BorderRadius.all(Radius.circular(20.0)),
                       ),
                     ),
                   ),
                 ),


                 const Gap(5, crossAxisExtent: 20),


                 Container(
                     padding: const EdgeInsets.all(10),
                     child: TextFormField(
                       keyboardType: TextInputType.text,
                       controller: ProductBrand,
                       decoration: InputDecoration(
                         hintText: widget.productDetailsArguments.productBrand,
                         hintStyle: TextStyle(color: Colors.grey),
                         border: const OutlineInputBorder(
                           borderRadius: BorderRadius.all(
                               Radius.circular(20.0)),
                         ),
                       ),
                     )),



                 StreamBuilder<QuerySnapshot>(
                     stream: FirebaseFirestore.instance.collection("category")
                         .snapshots(),
                     builder: (context, snapshot) {
                       if (!snapshot.hasData)
                         return const Text("Loading.....");
                       else {
                         var length = snapshot.data?.docs.length;
                         List<DropdownMenuItem> categories = [];

                         for (int i = 0; i < snapshot.data!.size; i++) {
                           categories.add(
                             DropdownMenuItem(
                               child: Text(
                                 snapshot.data!.docs[i].get("categoryName"),
                                 style: TextStyle(color: Colors.black),
                               ),
                               value: "${
                                   snapshot.data!.docs[i].id}",
                             ),
                           );
                         }
                         return Row(
                           mainAxisAlignment: MainAxisAlignment.center,
                           children: <Widget>[

                             const SizedBox(width: 50.0),
                             DropdownButton<dynamic>(
                               items: categories,
                               onChanged: (currencyValue) {
                                 // final snackBar = SnackBar(
                                 //   content: Text(
                                 //     'Selected Currency value is $currencyValue',
                                 //     style: TextStyle(color: Color(0xff11b719)),
                                 //   ),
                                 // );
                                 // ignore: deprecated_member_use
                                 //Scaffold.of(context).showSnackBar(snackBar);
                                 setState(() {
                                   catogeryId = currencyValue;


                                   // cid=ds.id as int ;

                                 });
                               },
                               value: catogeryId,
                               isExpanded: false,
                               hint: new Text(
                                 "Choose Category",
                                 style: TextStyle(color:Colors.black),
                               ),
                             ),
                           ],
                         );
                       }
                     }),


                 widget.productDetailsArguments.productImages.isEmpty?  Row(
                   mainAxisAlignment: MainAxisAlignment.spaceAround,
                   children: [
                     ElevatedButton.icon(
                         onPressed: () {
                           //  setState(() {
                           chooseImage('camera');
                           // })
                         },

                         icon: const Icon(Icons.camera),

                         label: const Text('camera')),
                     ElevatedButton.icon(
                         onPressed: () => chooseImage('gallery'),
                         icon: const Icon(Icons.library_add),
                         label: const Text('Gallery')),
                   ],
                 ):Container(),

                 Container(
                   height: 200,
                   width: SizeConfig.widthMultiplier*90,
                   padding: EdgeInsets.all(4),
                   child:

                   GridView.builder(
                       itemCount:_image.isEmpty?widget.productDetailsArguments.productImages.length:_image.length,
                       scrollDirection: Axis.vertical,
                       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                           crossAxisCount: 3),
                       itemBuilder: (context, index) {
                         print("object" +widget.productDetailsArguments.productImages.length.toString());



                         return Stack(children: [

                           widget.productDetailsArguments.productImages.isNotEmpty?
                          Image.network( widget.productDetailsArguments.productImages[index]):

                           Container(
                               margin: EdgeInsets.all(3),
                               decoration: BoxDecoration(
                                   image: DecorationImage(
                                       image:  FileImage(File(_image.isNotEmpty?_image[index].path:"")),
                                       fit: BoxFit.cover)))



                           ,

                           Container(

                             alignment: Alignment.topRight,
                             child:
                             FloatingActionButton(
                               heroTag: "btn4",

                               child: const Icon(
                                   Icons
                                       .delete,
                                   color: Colors
                                       .blue),
                               backgroundColor:
                               Colors
                                   .white,
                               onPressed: () {

                                 setState(() {
                                   _image.isNotEmpty?  _image.removeAt(index)
                                   :widget.productDetailsArguments.productImages.removeAt(index);

                                 });











                               },
                             ),
                             height: SizeConfig.heightMultiplier*5,
                           ),

                           //


                         ],);


                         //  NetworkImage(widget.productDetailsArguments.productImages[index]);
                         // return  Container(
                         //     margin: EdgeInsets.all(3),
                         //     decoration: BoxDecoration(
                         //         image: DecorationImage(
                         //
                         //
                         //
                         //
                         //             image: FileImage(widget.productDetailsArguments.productImages),
                         //             fit: BoxFit.cover)));
                         //


                       }),
                 ),



                 // Container(
                 //   height: 200,
                 //   width: SizeConfig.widthMultiplier*60,
                 //   padding: EdgeInsets.all(4),
                 //   child: GridView.builder(
                 //       itemCount:_image.length,
                 //       scrollDirection: Axis.vertical,
                 //       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                 //           crossAxisCount: 3),
                 //       itemBuilder: (context, index) {
                 //         print("object" +widget.productDetailsArguments.productImages.length.toString());
                 //
                 //
                 //         return Stack(children: [
                 //
                 //
                 //           //
                 //           Container(
                 //               margin: EdgeInsets.all(3),
                 //               decoration: BoxDecoration(
                 //                   image: DecorationImage(
                 //                       image:  FileImage(File(_image.isNotEmpty?_image[index].path:"")),
                 //                       fit: BoxFit.cover)))
                 //
                 //
                 //         ],);
                 //
                 //
                 //         //  NetworkImage(widget.productDetailsArguments.productImages[index]);
                 //         // return  Container(
                 //         //     margin: EdgeInsets.all(3),
                 //         //     decoration: BoxDecoration(
                 //         //         image: DecorationImage(
                 //         //
                 //         //
                 //         //
                 //         //
                 //         //             image: FileImage(widget.productDetailsArguments.productImages),
                 //         //             fit: BoxFit.cover)));
                 //         //
                 //
                 //
                 //       }),
                 // ),












                 Row(children: [


                   Container(
                       width: SizeConfig.widthMultiplier*30,
                       height: SizeConfig.heightMultiplier*7,


                       child:    OutlinedButton(
                           style: OutlinedButton.styleFrom(
                               elevation: 6,
                               // padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                               padding: const EdgeInsets.all(15),

                               backgroundColor: Colors.black,
                               shape: RoundedRectangleBorder(
                                   borderRadius: BorderRadius.circular(30))),
                           onPressed: () async {

                             if (widget.productDetailsArguments.productImages
                                 .isEmpty)
                             {

                               if (_image.isNotEmpty){
                                 print("productDetailsArguments kjkj,j length" +
                                     _image.toString());
                                 for (var imageFile in _image) {
                                   postImage(imageFile).then((downloadUrl) async {
                                     // ignore: iterable_contains_unrelated_type
                                     imageUrls.add(downloadUrl.toString());


                                     if (imageUrls.length == _image.length) {
                                       print("Selected Imakhkhges length" +
                                           imageUrls.toString());

                                       await UserAuthSharedPreferences.instance
                                           .getStringValue("id")
                                           .then((value) {
                                         sellerId = value;
                                         print("token" + sellerId);

                                         var collection = FirebaseFirestore
                                             .instance
                                             .collection(
                                             AppConstants.sellerProductTable);
                                         collection
                                             .doc(widget.productDetailsArguments
                                             .id) // <-- Doc ID where data should be updated.
                                             .update({

                                           AppConstants.sellerId: widget
                                               .productDetailsArguments
                                               .sellerId,
                                           AppConstants.productName: ProductName
                                               .text,
                                           AppConstants
                                               .productPrice: ProductPrice
                                               .value.text,
                                           AppConstants
                                               .productImages: imageUrls,
                                           AppConstants
                                               .productDescription: ProductDescription
                                               .value.text,
                                           AppConstants
                                               .productBrand: ProductBrand
                                               .value.text,
                                           AppConstants.productQuantity: int
                                               .parse(
                                               ProductQuantity.value.text),
                                           AppConstants.categoryId: catogeryId,
                                           AppConstants
                                               .productDeliveryInfo: ProductDeliveryInfo
                                               .value.text,


                                         }

                                         ).then((_) {
                                           Navigator.pushNamed(
                                               context, "/ProductList",
                                               arguments: null);
                                         });
                                       });
                                     }
                                   }).catchError((err) {
                                     print(err);
                                   });
                                 }
                               }
                               else {
                                 print("Selected Imsfsdfages length" +
                                     imageUrls.toString());

                                 Alerts(context, "Please upload at least one image");

                               }


                             }
                             else {
                               if(widget.productDetailsArguments.productImages.isNotEmpty) {
                                 await UserAuthSharedPreferences.instance
                                     .getStringValue("id")
                                     .then((value) {
                                   sellerId = value;
                                   print("token" + sellerId);

                                   var collection = FirebaseFirestore.instance
                                       .collection(
                                       AppConstants.sellerProductTable);
                                   collection
                                       .doc(widget.productDetailsArguments
                                       .id) // <-- Doc ID where data should be updated.
                                       .update({

                                     AppConstants.sellerId: widget
                                         .productDetailsArguments.sellerId,
                                     AppConstants.productName: ProductName
                                         .text,
                                     AppConstants.productPrice: ProductPrice
                                         .value.text,
                                     AppConstants.productImages: widget
                                         .productDetailsArguments.productImages,
                                     AppConstants
                                         .productDescription: ProductDescription
                                         .value.text,
                                     AppConstants.productBrand: ProductBrand
                                         .value.text,
                                     AppConstants.productQuantity: int.parse(
                                         ProductQuantity.value.text),
                                     AppConstants.categoryId: catogeryId,
                                     AppConstants
                                         .productDeliveryInfo: ProductDeliveryInfo
                                         .value.text,


                                   }

                                   ).then((_) {
                                     Navigator.pushNamed(
                                         context, "/ProductList",
                                         arguments: null);
                                   });
                                 });
                               }
                               else {

                                 Alerts(context, "Please upload at least one image");

                               }
                             }
                           }
                           ,
                           child: const Text(
                             'Upload Product Info',
                             style: TextStyle(fontSize: 15,color: Colors.white),
                           ))),

                   Container(
                       width: SizeConfig.widthMultiplier*20,
                       height: SizeConfig.heightMultiplier*9,
                       padding: const EdgeInsets.all(10),


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



                   Container(
                       width: SizeConfig.widthMultiplier*24,
                       height: SizeConfig.heightMultiplier*9,
                       padding: const EdgeInsets.all(10),


                       child:    OutlinedButton(
                           style: OutlinedButton.styleFrom(
                               elevation: 6,
                               // padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                               padding: const EdgeInsets.all(6),

                               backgroundColor: Colors.black,
                               shape: RoundedRectangleBorder(
                                   borderRadius: BorderRadius.circular(10))),
                           onPressed: () async{

                             FirebaseFirestore.instance.collection(AppConstants.sellerProductTable).doc(widget.productDetailsArguments.id).delete().then((value) {
                               Navigator.pushNamed(context, "/Home",arguments: null);
                             });

                           },
                           child: const Text(
                             'Delete',
                             style: TextStyle(fontSize: 15,color: Colors.white),
                           ))),












                 ],),




               ],
             ),

                         height: SizeConfig.heightMultiplier*100,



                       )])

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
