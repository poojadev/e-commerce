

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

class UploadProducts extends StatefulWidget {
  @override
  _UploadProductsState createState() => _UploadProductsState();
}

class _UploadProductsState extends State<UploadProducts> {
  AppConstants appConstants=new AppConstants();
  bool uploading = false;
  double val = 0;
  late CollectionReference imgRef;
  late firebase_storage.Reference ref;
  List<String> imageUrls = <String>[];
  List<String>category=<String>[];
  var catogeryId;
  final List<File> _image = [];
 late String cid="";
  final picker = ImagePicker();
 late String sellerId="";


  TextEditingController ProductName = new TextEditingController();
  TextEditingController ProductDescription = new TextEditingController();
  TextEditingController ProductQuantity = new TextEditingController();
  TextEditingController ProductPrice = new TextEditingController();
  TextEditingController ProductDeliveryInfo = new TextEditingController();
  TextEditingController ProductBrand= new TextEditingController();

  TextEditingController ProductSale =new TextEditingController();




















  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   title: Text('Add Image'),
        //   actions: [
        //     FlatButton(
        //         onPressed: () {
        //           setState(() {
        //             uploading = true;
        //           });
        //           uploadFile().whenComplete(() => Navigator.of(context).pop());
        //         },
        //         child: Text(
        //           'upload',
        //           style: TextStyle(color: Colors.white),
        //         ))
        //   ],
        // ),
        body:

        SingleChildScrollView(child:


Container(
    width: SizeConfig.widthMultiplier*100,
    margin: const EdgeInsets.only(left: 20.0, right: 20.0),


    child:
        Column(
          children: [

           SizedBox(height: 60,),





            Container(
                padding: const EdgeInsets.all(10),
                child: TextFormField(

                  keyboardType: TextInputType.text,
                  controller: ProductName,
                  decoration: const InputDecoration(
                    hintText: 'Product Name',
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
                  decoration: const InputDecoration(
                    hintText: 'Product Price in GBP',
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
                  decoration: const InputDecoration(
                    hintText: 'Quantity',
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
                  decoration: const InputDecoration(
                    hintText: 'Product Description',
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
                decoration: const InputDecoration(
                  hintText: 'Delivery Information',
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
                  decoration: const InputDecoration(
                    hintText: 'Brand',
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
                  controller: ProductSale,
                  decoration: const InputDecoration(
                    hintText: 'Sale %',
                    hintStyle: TextStyle(color: Colors.grey),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                          Radius.circular(20.0)),
                    ),
                  ),
                )),



            StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance.collection("category").snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData)
                   return  const Text("Loading.....");
                  else {

                    var length = snapshot.data?.docs.length;
                    List<DropdownMenuItem> categories = [];

                    for (int i = 0; i < snapshot.data!.size; i++) {


                      categories.add(
                        DropdownMenuItem(
                          child: Text(
                            snapshot.data!.docs[i].get("categoryName"),
                            style: TextStyle(color:Colors.black),
                          ),
                          value: "${
                              snapshot.data!.docs[i].id}",
                        ),
                      );
                    }
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[

                        const SizedBox(width: 20.0),
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
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ],
                    );
                  }
                }),













            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton.icon(
                    onPressed: () {
                      print("image lengt" +_image.length.toString());
                      //  setState(() {

                      if(_image.length>2)
                      {
                        Alerts(context, "You can't upload more than 3 images");

                      }
                      else {
                        chooseImage('camera');
                      }
                      // })
                    },
                    icon: const Icon(Icons.camera),
                    label: const Text('camera')),
                ElevatedButton.icon(
                    onPressed: () => chooseImage('gallery'),
                    icon: const Icon(Icons.library_add),
                    label: const Text('Gallery')),
              ],
            ),

            Container(
              height: SizeConfig.heightMultiplier*30,
              padding: EdgeInsets.all(4),
              child: GridView.builder(
                  itemCount: _image.length ,
                  scrollDirection: Axis.horizontal,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  itemBuilder: (context, index) {

                    return  Container(
                        margin: EdgeInsets.all(3),
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: FileImage(_image[index]),
                                fit: BoxFit.cover)));






                  }),
            ),










            // uploading
            //     ? Center(
            //     child: Column(
            //       mainAxisSize: MainAxisSize.min,
            //       children: [
            //         Container(
            //           child: Text(
            //             'uploading...',
            //             style: TextStyle(fontSize: 20),
            //           ),
            //         ),
            //         SizedBox(
            //           height: 10,
            //         ),
            //         CircularProgressIndicator(
            //           value: val,
            //           valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
            //         )
            //       ],
            //     ))
            //     : Container(),




            Row(children: [

              Container(
                  width: SizeConfig.widthMultiplier*45,
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
                      onPressed: () async {
                        if (_image.isNotEmpty) {
                          for (var imageFile in _image) {
                            postImage(imageFile).then((downloadUrl) async {
                              imageUrls.add(downloadUrl.toString());

                              if (imageUrls.length == _image.length) {
                                print("Selected Images length" +
                                    imageUrls.toString());


                                await UserAuthSharedPreferences.instance
                                    .getStringValue("id")
                                    .then((value) {
                                  sellerId = value;
                                  String documentId =
                                  DateTime
                                      .now()
                                      .millisecondsSinceEpoch
                                      .toString();
                                  FirebaseFirestore.instance
                                      .collection(
                                      AppConstants.sellerProductTable)
                                      .doc(documentId)
                                      .set({
                                    AppConstants.sellerId: sellerId,
                                    AppConstants.productName: ProductName.value
                                        .text,
                                    AppConstants.productPrice: ProductPrice
                                        .value.text,
                                    AppConstants.productImages: imageUrls,
                                    AppConstants
                                        .productDescription: ProductDescription
                                        .value.text,
                                    AppConstants.productBrand: ProductBrand
                                        .value.text,
                                    AppConstants.productQuantity: int.parse(
                                        ProductQuantity.value.text),
                                    AppConstants.categoryId: catogeryId,
                                    "date": DateTime
                                        .now(),
                                     "sell":ProductSale.value.text,
                                    AppConstants
                                        .productDeliveryInfo: ProductDeliveryInfo
                                        .value.text,

                                  }).then((_) {
                                    Navigator.pushNamed(
                                        context, "/Home", arguments: null);
                                  });
                                });
                              }
                            }).catchError((err) {
                              print(err);
                            });
                          }
                        } else {
                          Alerts(context, "Please upload at least one image");
                        }
                      }


                        ,
                      child: const Text(
                        'Upload Product Info',
                        style: TextStyle(fontSize: 14,color: Colors.white),
                      ))),


              SizedBox(width: 5,),

              Container(
                  width: SizeConfig.widthMultiplier*30,
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









            ],),




          ],
        ) )));
  }
  //late  String inputSource;

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

    if(_image.length>2)
      {
        Alerts(context, "You can't upload more than 3 images");

      }
    else {
      setState(() {
        _image.add(File(pickedImage!.path));
      });
    }

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
    print("millisecondsSinceEpoch" +fileName);

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



}