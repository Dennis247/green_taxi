import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:green_taxi/ui/pages/credit_card_page.dart';
import 'package:green_taxi/ui/pages/promo_code_page.dart';

import 'package:green_taxi/ui/pages/rate_driver_page.dart';
import 'package:green_taxi/ui/pages/ride_details_page.dart';
import 'package:green_taxi/ui/pages/ride_history_page.dart';
import 'package:green_taxi/ui/pages/settings_page.dart';
import 'package:green_taxi/ui/pages/support_page.dart';
import 'package:green_taxi/utils/constants.dart';
import 'package:green_taxi/utils/styles.dart';

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
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
            ),
            subtitle: Text(
              "Osagiede Dennis",
              style: CustomStyles.cardBoldDarkDrawerTextStyle,
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
                    Navigator.of(context)
                        .popAndPushNamed(RideHistoryPage.routeName);
                  },
                  child: Text(
                    "Ride History",
                    style: CustomStyles.cardBoldDarkDrawerTextStyle,
                  ),
                ),
                SizedBox(
                  height: 15,
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
                    style: CustomStyles.cardBoldDarkDrawerTextStyle,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context)
                        .popAndPushNamed(PromoCodePage.routeName);
                  },
                  child: Text(
                    "Promo Codes",
                    style: CustomStyles.cardBoldDarkDrawerTextStyle,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context)
                        .popAndPushNamed(CreditCardPage.routeName);
                  },
                  child: Text(
                    "Credit Card",
                    style: CustomStyles.cardBoldDarkDrawerTextStyle,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context)
                        .popAndPushNamed(SettingsPage.routeName);
                  },
                  child: Text(
                    "Settings",
                    style: CustomStyles.cardBoldDarkDrawerTextStyle,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context)
                        .popAndPushNamed(SupportPage.routeName);
                  },
                  child: Text(
                    "Support",
                    style: CustomStyles.cardBoldDarkDrawerTextStyle,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed('/');
                  },
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
