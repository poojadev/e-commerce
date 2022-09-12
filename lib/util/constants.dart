import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';


//import 'package:html/parser.dart';


//const String ordering="",pageNo=" ",id=" ";
const String gameName=" ";
const String sDate=" ",eDate=" ";

class AppConstants {




  /*

      seller table fields
   */

  static const String sellerTable="SellerDetails";
  static const String sellerEmailId="sellerEmailId";
  static const String sellerName="sellerName";
  static const String sellerUserId="sellerUserId";


  /*
       seller product table fields
   */


  static const String sellerProductTable="sellerProducts";
  static const String productImages="productImages";
  static const  String productName   ="productName";
  static const String productPrice="productPrice";
  static const String sellerId="sellerUserId";
  static const String categoryId="categoryId";
  static const String productDescription="productDescription";
  static const String productQuantity="productQuantity";
  static const String productDeliveryInfo="productDeliveryInfo";
  static const String productBrand="productBrand";



  /*
       Order History
   */

  static const String orderTable="orderDetails";
  static const String customerId="customerId";
  static const String productId="productId";
  static const String orderQuantity="orderQuantity";
  static const String orderTotalPrice="orderTotalPrice";
  static const String orderLocation="orderLocation";











}

/*

  company wise game list url=https://api.rawg.io/api/games?publishers=20987
  all publisher/compnay=https://api.rawg.io/api/publishers
  game geners =https://api.rawg.io/api/genres
  https://api.rawg.io/api/games?platforms=4&page=2
https://api.rawg.io/api/publishers?page=2
https://api.rawg.io/api/games?dates=2019-12-01,2019-12-07&platforms=3

https://api.rawg.io/api/games?dates=2019-11-01,2019-11-30&ordering=-added

 */