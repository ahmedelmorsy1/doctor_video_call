// // ignore_for_file: avoid_print

// import 'dart:async';
// import 'package:flutter_credit_card/flutter_credit_card.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_checkout_payment/flutter_checkout_payment.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       title: "Test",
//       home: HomeScreen(),
//     );
//   }
// }

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({Key? key}) : super(key: key);

//   @override
//   _HomeScreenState createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   final GlobalKey<FormState> formKey = GlobalKey<FormState>();

//   String _isInit = "false";

//   String cardNumber = '';
//   String expiryDate = '';
//   String cardNameHolder = '';
//   String cvv = '';
//   bool cvvFocused = false;

//   @override
//   void initState() {
//     super.initState();
//     initPaymentSDK();
//   }

//   // Platform messages are asynchronous, so we initialize in an async method.
//   Future<void> initPaymentSDK() async {
//     // Platform messages may fail, so we use a try/catch PlatformException.
//     try {
//       bool? isSuccess =
//           await FlutterCheckoutPayment.init(key: "${Keys.TEST_KEY}");
//       //bool isSuccess =  await FlutterCheckoutPayment.init(key: "${Keys.TEST_KEY}", environment: Environment.LIVE);
//       print(isSuccess);
//       if (mounted) setState(() => _isInit = "true");
//     } on PlatformException {
//       if (mounted) setState(() => _isInit = "error");
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: const Text('Checkout Payment Plugin'),
//         ),
//         body: SafeArea(
//           child: Column(
//             children: <Widget>[
//               const SizedBox(height: 10),
//               Text("Checkout Init: $_isInit", style: const TextStyle(fontSize: 18)),
//               CreditCardWidget(
//                 cardNumber: cardNumber,
//                 expiryDate: expiryDate,
//                 cardHolderName: cardNameHolder,
//                 cvvCode: cvv,
//                 showBackView: cvvFocused,
//                 height: 180,
//                 width: 305,
//                 animationDuration: const Duration(milliseconds: 1000),
//                 onCreditCardWidgetChange: (_) {},
//               ),
//               Expanded(
//                 child: SingleChildScrollView(
//                   child: CreditCardForm(
//                     cardNumber: cardNumber,
//                     expiryDate: expiryDate,
//                     cardHolderName: cardNameHolder,
//                     cvvCode: cvv,
//                     onCreditCardModelChange: _onModelChange,
//                     themeColor: ThemeData.light().primaryColor,
//                     formKey: formKey,
//                   ),
//                 ),
//               ),
//               Wrap(
//                 alignment: WrapAlignment.spaceBetween,
//                 children: <Widget>[
//                   ElevatedButton(
//                     onPressed: _generateToken,
//                     child: const Padding(
//                         padding: EdgeInsets.all(12),
//                         child: Text(
//                           "Generate Token",
//                           style: TextStyle(fontSize: 14),
//                         )),
//                   ),
//                   ElevatedButton(
//                     onPressed: _cardValidation,
//                     child: const Padding(
//                         padding: EdgeInsets.all(12),
//                         child:  Text(
//                           "Card Validation",
//                           style: TextStyle(fontSize: 14),
//                         )),
//                   ),
//                   ElevatedButton(
//                     onPressed: _generateTokenWithAddress,
//                     child: const Padding(
//                         padding: EdgeInsets.all(12),
//                         child:  Text(
//                           "Generate Token with Address",
//                           style: TextStyle(fontSize: 14),
//                         )),
//                   ),
//                   ElevatedButton(
//                     onPressed: _handleThreeDSChallenge,
//                     child: const Padding(
//                         padding: EdgeInsets.all(12),
//                         child:  Text(
//                           "Handle 3DS",
//                           style: TextStyle(fontSize: 14),
//                         )),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 10),
//             ],
//           ),
//         ));
//   }

//   void _onModelChange(CreditCardModel model) {
//     setState(() {
//       cardNumber = model.cardNumber;
//       expiryDate = model.expiryDate;
//       cardNameHolder = model.cardHolderName;
//       cvv = model.cvvCode;
//       cvvFocused = model.isCvvFocused;
//     });
//   }

//   Future<void> _generateToken() async {
//     try {
//       // Show loading dialog
//       showDialog(
//         context: this.context,
//         barrierDismissible: false,
//         builder: (BuildContext context) {
//           return WillPopScope(
//               onWillPop: () => Future<bool>.value(false),
//               child: AlertDialog(
//                 title: const Text("Loading..."),
//                 content: Column(
//                     mainAxisSize: MainAxisSize.min,
//                     children: <Widget>[const CircularProgressIndicator()]),
//               ));
//         },
//       );

//       String number = cardNumber.replaceAll(" ", "");
//       String expiryMonth = expiryDate.substring(0, 2);
//       String expiryYear = expiryDate.substring(3);

//       print("$cardNumber, $cardNameHolder, $expiryMonth, $expiryYear, $cvv");

//       CardTokenisationResponse? response =
//           await FlutterCheckoutPayment.generateToken(
//               number: number,
//               name: cardNameHolder,
//               expiryMonth: expiryMonth,
//               expiryYear: expiryYear,
//               cvv: cvv);

//       // Hide loading dialog
//       Navigator.pop(context);

//       // Show result dialog
//       showDialog(
//         context: this.context,
//         builder: (BuildContext context) {
//           return AlertDialog(
//             title: const Text("Token"),
//             content: Text("${response!.token}"),
//             actions: <Widget>[
//               TextButton(
//                 child: const Text("Close"),
//                 onPressed: () => Navigator.pop(context),
//               )
//             ],
//           );
//         },
//       );
//     } catch (ex) {
//       // Hide loading dialog
//       Navigator.pop(context);

//       // Show error dialog
//       showDialog(
//         context: this.context,
//         builder: (BuildContext context) {
//           return AlertDialog(
//             title: const Text("Error"),
//             content: Text("${ex.toString()}"),
//             actions: <Widget>[
//               TextButton(
//                 child: const Text("Close"),
//                 onPressed: () => Navigator.pop(context),
//               )
//             ],
//           );
//         },
//       );
//     }
//   }

//   Future<void> _generateTokenWithAddress() async {
//     try {
//       // Show loading dialog
//       showDialog(
//         context: this.context,
//         barrierDismissible: false,
//         builder: (BuildContext context) {
//           return WillPopScope(
//               onWillPop: () => Future<bool>.value(false),
//               child: AlertDialog(
//                 title: const Text("Loading..."),
//                 content: Column(
//                     mainAxisSize: MainAxisSize.min,
//                     children: <Widget>[const CircularProgressIndicator()]),
//               ));
//         },
//       );

//       String number = cardNumber.replaceAll(" ", "");
//       String expiryMonth = expiryDate.substring(0, 2);
//       String expiryYear = expiryDate.substring(3);

//       print("$cardNumber, $cardNameHolder, $expiryMonth, $expiryYear, $cvv");

//       CardTokenisationResponse? response =
//           await FlutterCheckoutPayment.generateToken(
//         number: number,
//         name: cardNameHolder,
//         expiryMonth: expiryMonth,
//         expiryYear: expiryYear,
//         cvv: cvv,
//         billingModel: BillingModel(
//           addressLine1: "address line 1",
//           addressLine2: "address line 2",
//           postcode: "postcode",
//           country: "UK",
//           city: "city",
//           state: "state",
//           phoneModel: PhoneModel(
//             countryCode: "+44",
//             number: "07123456789",
//           ),
//         ),
//       );

//       // Hide loading dialog
//       Navigator.pop(context);

//       // Show result dialog
//       showDialog(
//         context: this.context,
//         builder: (BuildContext context) {
//           return AlertDialog(
//             title: const Text("Token"),
//             content: Text("${response!.token}"),
//             actions: <Widget>[
//               TextButton(
//                 child: const Text("Close"),
//                 onPressed: () => Navigator.pop(context),
//               )
//             ],
//           );
//         },
//       );
//     } catch (ex) {
//       // Hide loading dialog
//       Navigator.pop(context);

//       // Show error dialog
//       showDialog(
//         context: this.context,
//         builder: (BuildContext context) {
//           return AlertDialog(
//             title: const Text("Error"),
//             content: Text("${ex.toString()}"),
//             actions: <Widget>[
//               TextButton(
//                   child: const Text("Close"), onPressed: () => Navigator.pop(context))
//             ],
//           );
//         },
//       );
//     }
//   }

//   Future<void> _handleThreeDSChallenge() async {
//     try {
//       // Show loading dialog
//       showDialog(
//         context: this.context,
//         barrierDismissible: false,
//         builder: (BuildContext context) {
//           return WillPopScope(
//               onWillPop: () => Future<bool>.value(false),
//               child: AlertDialog(
//                 title: const Text("Loading..."),
//                 content: Column(
//                     mainAxisSize: MainAxisSize.min,
//                     children: <Widget>[const CircularProgressIndicator()]),
//               ));
//         },
//       );

//       String? response = await FlutterCheckoutPayment.handle3DS(
//         authUrl: 'https://sandbox.checkout.com/api2/v2/3ds/acs/687805',
//         successUrl: 'https://example.com/success',
//         failUrl: 'https://example.com/fail',
//       );

//       // Hide loading dialog
//       Navigator.pop(context);

//       // Show result dialog
//       showDialog(
//         context: this.context,
//         builder: (BuildContext context) {
//           return AlertDialog(
//             title: const Text("Response"),
//             content: Text("$response"),
//             actions: <Widget>[
//               TextButton(
//                 child: const Text("Close"),
//                 onPressed: () => Navigator.pop(context),
//               )
//             ],
//           );
//         },
//       );
//     } catch (ex) {
//       // Hide loading dialog
//       Navigator.pop(context);

//       // Show error dialog
//       showDialog(
//         context: this.context,
//         builder: (BuildContext context) {
//           return AlertDialog(
//             title: const Text("Error"),
//             content: Text("${ex.toString()}"),
//             actions: <Widget>[
//               TextButton(
//                 child: const Text("Close"),
//                 onPressed: () => Navigator.pop(context),
//               )
//             ],
//           );
//         },
//       );
//     }
//   }

//   Future<void> _cardValidation() async {
//     try {
//       // Show loading dialog
//       showDialog(
//         context: this.context,
//         barrierDismissible: false,
//         builder: (BuildContext context) {
//           return WillPopScope(
//               onWillPop: () => Future<bool>.value(false),
//               child: AlertDialog(
//                 title: const Text("Loading..."),
//                 content: Column(
//                     mainAxisSize: MainAxisSize.min,
//                     children: <Widget>[const CircularProgressIndicator()]),
//               ));
//         },
//       );

//       String number = cardNumber.replaceAll(" ", "");

//       print("$cardNumber");

//       bool? isValid = await FlutterCheckoutPayment.isCardValid(number: number);

//       // Hide loading dialog
//       Navigator.pop(context);

//       // Show result dialog
//       showDialog(
//         context: this.context,
//         builder: (BuildContext context) {
//           return AlertDialog(
//             title: const Text("Validation? "),
//             content: Text("$isValid"),
//             actions: <Widget>[
//               TextButton(
//                 child: const Text("Close"),
//                 onPressed: () => Navigator.pop(context),
//               )
//             ],
//           );
//         },
//       );
//     } catch (ex) {
//       // Hide loading dialog
//       Navigator.pop(context);

//       // Show error dialog
//       showDialog(
//         context: this.context,
//         builder: (BuildContext context) {
//           return AlertDialog(
//             title: const Text("Error"),
//             content: Text("${ex.toString()}"),
//             actions: <Widget>[
//               TextButton(
//                 child: const Text("Close"),
//                 onPressed: () => Navigator.pop(context),
//               )
//             ],
//           );
//         },
//       );
//     }
//   }
// }