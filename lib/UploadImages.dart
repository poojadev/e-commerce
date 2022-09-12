// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:esrsshopping/utils/MultiPickerApp.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter/material.dart';
// import 'package:multi_image_picker2/multi_image_picker2.dart';
//
// class UploadImages extends StatefulWidget {
//   final GlobalKey<ScaffoldState> globalKey;
//
//   const UploadImages({Key? key, required this.globalKey}) : super(key: key);
//
//   @override
//   _UploadImagesState createState() => new _UploadImagesState();
// }
//
// class _UploadImagesState extends State<UploadImages> {
//   List<Asset> images = <Asset>[];
//   List<String> imageUrls = <String>[];
//   String _error = 'No Error Dectected';
//   bool isUploading = false;
//
//   @override
//   void initState() {
//     super.initState();
//   }
//
//   Widget buildGridView() {
//     return GridView.count(
//       crossAxisCount: 3,
//       children: List.generate(images.length, (index) {
//         Asset asset = images[index];
//         print(asset.getByteData(quality: 100));
//         return Padding(
//           padding: EdgeInsets.all(8.0),
//           child: ThreeDContainer(
//             backgroundColor: MultiPickerApp.darker,
//             backgroundDarkerColor: MultiPickerApp.darker,
//             height: 50,
//             width: 50,
//             borderDarkerColor: MultiPickerApp.pauseButton,
//             borderColor: MultiPickerApp.pauseButtonDarker,
//             key: null,
//             child: ClipRRect(
//               borderRadius: BorderRadius.all(Radius.circular(15)),
//               child: AssetThumb(
//                 asset: asset,
//                 width: 300,
//                 height: 300,
//               ),
//             ),
//           ),
//         );
//       }),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: <Widget>[
//         Container(
//           child: Column(
//             children: <Widget>[
//               SizedBox(
//                 height: 20,
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: <Widget>[
//                   InkWell(
//                     onTap: loadAssets,
//                     child: ThreeDContainer(
//                       width: 130,
//                       height: 50,
//                       backgroundColor: MultiPickerApp.navigateButton,
//                       backgroundDarkerColor: MultiPickerApp.background,
//                       borderColor: Colors.blue,
//                       borderDarkerColor: Colors.red,
//                       child: Center(
//                           child: Text(
//                         "Pick images",
//                         style: TextStyle(color: Colors.white),
//                       )),
//                     ),
//                   ),
//                   InkWell(
//                     onTap: () {
//                       print("Image length" + images.length.toString());
//                       if (images.isEmpty) {
//                         showDialog(
//                             context: context,
//                             builder: (_) {
//                               return AlertDialog(
//                                 backgroundColor:
//                                     Theme.of(context).backgroundColor,
//                                 content: Text("No image selected",
//                                     style: TextStyle(color: Colors.white)),
//                                 actions: <Widget>[
//                                   InkWell(
//                                     onTap: () {
//                                       Navigator.pop(context);
//                                     },
//                                     child: ThreeDContainer(
//                                       borderColor: Colors.blue,
//                                       borderDarkerColor: Colors.red,
//                                       width: 80,
//                                       height: 30,
//                                       backgroundColor:
//                                           MultiPickerApp.navigateButton,
//                                       backgroundDarkerColor:
//                                           MultiPickerApp.background,
//                                       key: null,
//                                       child: Center(
//                                           child: Text(
//                                         "Ok",
//                                         style: TextStyle(color: Colors.white),
//                                       )),
//                                     ),
//                                   )
//                                 ],
//                               );
//                             });
//                       } else {
//                         SnackBar snackbar = SnackBar(
//                             content: Text('Please wait, we are uploading'));
//                         widget.globalKey.currentState?.showSnackBar(snackbar);
//                         uploadImages();
//                       }
//                     },
//                     child: ThreeDContainer(
//                       width: 130,
//                       height: 50,
//                       borderColor: Colors.blue,
//                       borderDarkerColor: Colors.red,
//                       backgroundColor: MultiPickerApp.navigateButton,
//                       backgroundDarkerColor: MultiPickerApp.background,
//                       child: const Center(
//                           child: Text(
//                         "Upload Images",
//                         style: TextStyle(color: Colors.white),
//                       )),
//                     ),
//                   ),
//                 ],
//               ),
//               SizedBox(
//                 height: 10,
//               ),
//               // Expanded(
//               //   child:
//               //   Container(
//               //       height: 200,
//               //       width: 400,
//               //
//               //       child:
//               //
//               //   buildGridView()),
//               // )
//             ],
//           ),
//         ),
//       ],
//     );
//   }
//
//   void uploadImages() {
//     for (var imageFile in images) {
//       postImage(imageFile).then((downloadUrl) {
//         imageUrls.add(downloadUrl.toString());
//         if (imageUrls.length == images.length) {
//           String documnetID = DateTime.now().millisecondsSinceEpoch.toString();
//           FirebaseFirestore.instance
//               .collection('images')
//               .doc(documnetID)
//               .set({'urls': imageUrls}).then((_) {
//             SnackBar snackbar =
//                 SnackBar(content: Text('Uploaded Successfully'));
//             widget.globalKey.currentState?.showSnackBar(snackbar);
//             setState(() {
//               images = [];
//               imageUrls = [];
//             });
//           });
//         }
//       }).catchError((err) {
//         print(err);
//       });
//     }
//   }
//
//   Future<void> loadAssets() async {
//     List<Asset> resultList = <Asset>[];
//     String error = 'No Error Dectected';
//     try {
//       resultList = await MultiImagePicker.pickImages(
//         maxImages: 10,
//         enableCamera: true,
//         selectedAssets: images,
//         cupertinoOptions: CupertinoOptions(takePhotoIcon: "chat"),
//         materialOptions: MaterialOptions(
//           actionBarColor: "#abcdef",
//           actionBarTitle: "Upload Image",
//           allViewTitle: "All Photos",
//           useDetailsView: false,
//           selectCircleStrokeColor: "#000000",
//         ),
//       );
//       print(resultList.length);
//       print((await resultList[0].getThumbByteData(122, 100)));
//       print((await resultList[0].getByteData()));
//
//       ///  print((await resultList[0].metadata));
//       ///
//
//     } on Exception catch (e) {
//       error = e.toString();
//     }
//
//     if (!mounted) return;
//     setState(() {
//       images = resultList;
//       _error = error;
//     });
//   }
//
//   Future<dynamic> postImage(Asset imageFile) async {
//     String fileName = DateTime.now().millisecondsSinceEpoch.toString();
//     Reference reference = FirebaseStorage.instance.ref().child(fileName);
//     UploadTask uploadTask =
//         reference.putData((await imageFile.getByteData()).buffer.asUint8List());
//     TaskSnapshot storageTaskSnapshot = await uploadTask.whenComplete(() {
//       var url = reference.getDownloadURL();
//       print("url" + url.toString());
//     }).catchError((onError) {
//       print(onError);
//     });
//     print("Ref" + storageTaskSnapshot.ref.getDownloadURL().toString());
//     return storageTaskSnapshot.ref.getDownloadURL();
//   }
// }
