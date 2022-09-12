
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:esrsshopping/Home/screen/HomeScreen.dart';
import 'package:esrsshopping/UploadProduct/Model/SellerProductArguments.dart';
import 'package:esrsshopping/UploadProduct/screens/ProductList.dart';
import 'package:esrsshopping/UploadProduct/screens/SellerProductDetails.dart';

import 'package:esrsshopping/userlogin/screen/userlogin_screen.dart';
import 'package:esrsshopping/util/constants.dart';
import 'package:esrsshopping/util/splashscreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:page_transition/page_transition.dart';

import 'orders/screen/CustomerOrderList.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  Stripe.publishableKey = 'pk_test_51KcVhbJXiDQqVJbyAHNEhlX1YoSGTj4GepKKTPAFICAlRtlcbC4Qfi8Hk5BEENnVeFrgk7ssCgq9vdYTLp5X2hYT001IvKQDmc';
  Stripe.merchantIdentifier = 'merchant.flutter.stripe.test';
  Stripe.urlScheme = 'flutterstripe';
  await Stripe.instance.applySettings();

 // MaterialApp(home: const MyApp());
  runApp(

      MaterialApp(

        initialRoute: '/splashscreen' ,

        onGenerateRoute: (RouteSettings settings) {

          //ProductArguments? args;
        // final  args= settings.arguments as ProductArguments ;

         final args = settings.arguments;




          switch (settings.name) {

            case '/UserLogIn':
              return

                PageTransition(
                  child:const UserLogIn(),
                  type: PageTransitionType.leftToRight,
                  settings: settings,
                );

              break;

            case '/splashscreen':
              return

                PageTransition(
                  child: SplashScreenState(),
                  type: PageTransitionType.leftToRight,
                  settings: settings,
                );

              break;

            case '/Home':
              return

                PageTransition(
                  child: HomePage(),
                  type: PageTransitionType.leftToRight,
                  settings: settings,
                );

              break;


            case '/CustomerOrderList':
              return

                PageTransition(
                  child:const CustomerOrderList(),
                  type: PageTransitionType.leftToRight,
                  settings: settings,
                );

              break;



            case '/ProductList' :

              SellerProductArguments? sellerProductArguments = args as SellerProductArguments?;

              return
                PageTransition(
                  child: ProductListState(),
                  type: PageTransitionType.leftToRight,
                  settings: settings,
                );

              break;

            case '/SellerProductDetails':
          SellerProductArguments? productDetailsArguments = args as SellerProductArguments?;

              return   PageTransition(
              child: SellerProductDetailsState(productDetailsArguments: SellerProductArguments(id: productDetailsArguments!.id,
                  sellerId: productDetailsArguments!.sellerId,
                  productDescription:productDetailsArguments!.productDescription,
                  productImages: productDetailsArguments!.productImages,
                  productDeliverInfo: productDetailsArguments.productDeliverInfo,
                  productName: productDetailsArguments!.productName,
                  productPrice: productDetailsArguments!.productPrice,
                  productQunatity:productDetailsArguments!.productQunatity,
                  categoryId: productDetailsArguments.categoryId,
                productBrand:productDetailsArguments.productBrand
               )),

              type: PageTransitionType.leftToRight,
              settings: settings,
              );
              break;

            default:
              return MaterialPageRoute(
                  builder: (_) =>
                      Scaffold(
                        body: Center(
                            child: Text('No route defined for ${settings.name}')),
                      ));

          }
        },
        // initialRoute: '/',
//      routes: {
//        // When navigating to the "/" route, build the FirstScreen widget.
//        '/': (context) => Homepage(),
//        // When navigating to the "/second" route, build the SecondScreen widget.
//        '/publisherhomepage': (context) => PublisherHomePage(),
//
//     //  '/PublisherDetailsState': (context) => PublisherDetails(),
//        '/platformhomepage': (context) => PlatformHomePage(),
//
//
//      },
      ));




}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }


  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
