

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:esrsshopping/UploadProduct/screens/Categories.dart';
import 'package:esrsshopping/UploadProduct/screens/SellerProductDetails.dart';
import 'package:esrsshopping/ui/sizeConfig.dart';
import 'package:esrsshopping/util/constants.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

import '../../util/localstorage/SharedPref.dart';
import 'UploadProduct.dart';
import '../Model/SellerProductArguments.dart';




// class ProductList extends StatelessWidget {
//   static const String routeName= "/ProductDetails";

//   late SellerProductArguments  productDetailArguments ;
//
//   ProductList({Key? key}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: ProductListState(
// //        id: genresId,
// //        genresName: genresName,
// //        pageDirection: pageDirection,
//         key: key, productDetailsArguments: productDetailArguments,
//       ),
//     );
//   }
// }
class ProductListState extends StatefulWidget {
  static const String routeName= "/ProductList";

//   const ProductListState(
//       {Key? key,  required this.productDetailsArguments})
//       : super(key: key);
//
//
// //  final int id;
// //  final String genresName;
// //  final int pageDirection;
//   final SellerProductArguments productDetailsArguments;

  @override
  _ProductListStateState createState() => _ProductListStateState();
}



late SellerProductArguments  productDetailArguments ;

class _ProductListStateState extends State<ProductListState> {

  TextEditingController ProductName = new TextEditingController();
  TextEditingController ProductDescription = new TextEditingController();
  TextEditingController ProductQuantity = new TextEditingController();
  TextEditingController ProductPrice = new TextEditingController();
  TextEditingController ProductLocation = new TextEditingController();

  List<String> imageUrls = <String>[];

  List<String>category=<String>[];
  late String sellerId="";

  @override
  void initState() {
    super.initState();
    //  imgRef = FirebaseFirestore.instance.collection('imageURLs');
    category= <String>[];
    category.add("Graphics Card");
    category.add("Motherboard");
    category.add("Cabinet");
    category.add("Mouse");
    category.add("RAM");
    category.add("Headsets");
    category.add("Keyboard");
    category.add("Chair");
    category.add("Processors");
    category.add("Graphics Card");
    category.add("Gaming Eyewear");
    category.add("Mice & Accessories");

    getUserId().whenComplete(() {
      setState(() {});
    });

    //
    // for(int i=0;i<category.length;i++)
    //   {
    //     FirebaseFirestore.instance
    //         .collection('category')
    //         .doc()
    //         .set({
    //       'categoryName': category[i],
    //     }).then((_) {
    //
    //     });
    //
    //   }

  }




  getUserId() async {
    await UserAuthSharedPreferences.instance
        .getStringValue("id")
        .then((value) {
      sellerId = value;
    });
  }



  @override
  Widget build(BuildContext context) {
getUserId();


print("seller Id" +sellerId);

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        foregroundColor: Colors.black,
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => UploadProducts()));
        },
      ),
      body:







          //function retrive specific seller products
      StreamBuilder(
        stream: FirebaseFirestore.instance.collection(AppConstants.sellerProductTable).where(AppConstants.sellerId,isEqualTo: sellerId).

        snapshots(),
        builder: (context,         AsyncSnapshot<QuerySnapshot> snapshot) {

          return !snapshot.hasData
              ? Center(
            child: CircularProgressIndicator(),
          )
              : Container(

            padding: EdgeInsets.all(4),
            child: GridView.builder(
                itemCount: snapshot.data?.docs.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemBuilder: (context, index) {

                  QueryDocumentSnapshot<Object?>? documentSnapshot = snapshot.data?.docs[index];



                  return GestureDetector(
                    child:

                    Card(child:

                        Container(
                          height: SizeConfig.heightMultiplier*40,


                 child:   ListView(



                   children: [




                      //
                      Container(
                        height:SizeConfig.heightMultiplier*16,
                        width: SizeConfig.widthMultiplier*80,

                        margin: EdgeInsets.all(3),
                        child: FadeInImage.memoryNetwork(
                            fit: BoxFit.cover,
                            placeholder: kTransparentImage,
                            image: documentSnapshot?.get(AppConstants.productImages)[0]),
                      ),

                   Container(
                       margin: const EdgeInsets.all(3),
                       child:Text(documentSnapshot?.get(AppConstants.productName))),


                 ],)))
                    ,


                    onTap: ()
                  {


                    SellerProductArguments productArguments= SellerProductArguments(sellerId:documentSnapshot!.get(AppConstants.sellerId),
                        productName:documentSnapshot!.get(AppConstants.productName),
                        productImages:documentSnapshot.get(AppConstants.productImages),
                        productDescription:documentSnapshot!.get(AppConstants.productDescription),
                        productPrice:documentSnapshot!.get(AppConstants.productPrice),
                        productDeliverInfo: documentSnapshot!.get(AppConstants.productDeliveryInfo),
                        productQunatity: documentSnapshot.get(AppConstants.productQuantity),
                      categoryId:"",
                      id: documentSnapshot!.id,
                      productBrand: documentSnapshot!.get(AppConstants.productBrand)


                    );


                    print("SellerProductArguments" +documentSnapshot!.get(AppConstants.productName));

                    Navigator.pushNamed(context, SellerProductDetails.routeName,arguments: productArguments);


                  }



                  );






                }),
          );
        },
      ),
    );
  }
}