import 'package:flutter/material.dart';
import 'package:green_taxi/pages/book_taxi_page.dart';
import 'package:green_taxi/pages/otp_page.dart';
import 'package:green_taxi/pages/phone_reg_page.dart';
import 'package:green_taxi/pages/taxi_movement_page.dart';
import 'package:green_taxi/pages/testPages.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Green Taxi',
      theme: ThemeData(
        // is not restarted.
        primarySwatch: Colors.green,
      ),
      home: PhoneRegPage(),
      routes: {
        PhoneRegPage.routeName: (context) => PhoneRegPage(),
        OtpPage.routeName: (context) => OtpPage(),
        BookTaxiPage.routeName: (context) => BookTaxiPage(),
        TaxiMovementPage.routeName: (context) => TaxiMovementPage()
      },
    );
  }
}
