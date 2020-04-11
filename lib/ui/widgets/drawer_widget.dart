import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:green_taxi/pages/credit_card_page.dart';
import 'package:green_taxi/pages/promo_code_page.dart';
import 'package:green_taxi/pages/rate_driver_page.dart';
import 'package:green_taxi/pages/support_page.dart';
import 'package:green_taxi/utils/constants.dart';
import 'package:green_taxi/utils/styles.dart';
import 'package:green_taxi/pages/ride_history_page.dart';
import 'package:green_taxi/pages/settings_page.dart';
import 'package:share/share.dart';

class DrawerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          ListTile(
            leading: Icon(
              FontAwesomeIcons.user,
              color: Constatnts.primaryColor,
              size: 40,
            ),
            title: Text(
              "Good Morning",
              style: TextStyle(fontSize: 10, fontWeight: FontWeight.w400),
            ),
            subtitle: Text(
              "Osagiede Dennis",
              style: CustomStyles.cardBoldDarkTextStyle,
            ),
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.only(left: 35, top: 25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed(RateDriverPage.routeName);
                  },
                  child: Text(
                    "Rate Your Driver",
                    style: CustomStyles.cardBoldDarkTextStyle,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed(RideHistoryPage.routeName);
                  },
                  child: Text(
                    "Ride History",
                    style: CustomStyles.cardBoldDarkTextStyle,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: () {
                    Share.share(
                      "https://github.com/Dennis247/green_taxi",
                      subject: "Invite Your Friend To Green Taxi",
                    );
                  },
                  child: Text(
                    "Invite Friends",
                    style: CustomStyles.cardBoldDarkTextStyle,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed(PromoCodePage.routeName);
                  },
                  child: Text(
                    "Promo Codes",
                    style: CustomStyles.cardBoldDarkTextStyle,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed(CreditCardPage.routeName);
                  },
                  child: Text(
                    "Credit Card",
                    style: CustomStyles.cardBoldDarkTextStyle,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed(SettingsPage.routeName);
                  },
                  child: Text(
                    "Settings",
                    style: CustomStyles.cardBoldDarkTextStyle,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed(SupportPage.routeName);
                  },
                  child: Text(
                    "Support",
                    style: CustomStyles.cardBoldDarkTextStyle,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: () {},
                  child: Text(
                    "Log Out",
                    style: CustomStyles.cardBoldDarkTextStyle,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
