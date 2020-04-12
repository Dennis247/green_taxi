import 'package:flutter/material.dart';
import 'package:green_taxi/ui/pages/add_credit_card_page.dart';
import 'package:green_taxi/ui/pages/book_taxi_page.dart';
import 'package:green_taxi/ui/pages/credit_card_page.dart';

import 'package:green_taxi/ui/pages/rate_driver_page.dart';
import 'package:green_taxi/ui/pages/ride_details_page.dart';
import 'package:green_taxi/ui/pages/ride_history_page.dart';
import 'package:green_taxi/ui/pages/taxi_movement_page.dart';
import 'package:green_taxi/ui/pages/settings_page.dart';
import 'package:green_taxi/ui/pages/support_page.dart';
import 'package:green_taxi/ui/pages/promo_code_page.dart';

import 'package:green_taxi/ui/pages/otp_page.dart';
import 'package:green_taxi/ui/pages/phone_reg_page.dart';
import 'package:green_taxi/utils/custom_route.dart';

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
          pageTransitionsTheme: PageTransitionsTheme(builders: {
            TargetPlatform.iOS: CustomPageTransitionBuilder(),
            TargetPlatform.android: CustomPageTransitionBuilder(),
          })),
      home: PhoneRegPage(),
      routes: {
        PhoneRegPage.routeName: (context) => PhoneRegPage(),
        OtpPage.routeName: (context) => OtpPage(),
        BookTaxiPage.routeName: (context) => BookTaxiPage(),
        TaxiMovementPage.routeName: (context) => TaxiMovementPage(),
        RideHistoryPage.routeName: (context) => RideHistoryPage(),
        SettingsPage.routeName: (context) => SettingsPage(),
        SupportPage.routeName: (context) => SupportPage(),
        PromoCodePage.routeName: (context) => PromoCodePage(),
        CreditCardPage.routeName: (context) => CreditCardPage(),
        AddCreditCardPage.routeName: (context) => AddCreditCardPage(),
        RateDriverPage.routeName: (context) => RateDriverPage(),
        RideDetailsPage.routeName: (context) => RideDetailsPage()
      },
    );
  }
}
