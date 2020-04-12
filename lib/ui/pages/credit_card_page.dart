import 'package:flutter/material.dart';
import 'package:flutter_credit_card/credit_card_widget.dart';
import 'package:green_taxi/ui/widgets/header_widget.dart';
import 'package:green_taxi/utils/constants.dart';
import 'package:green_taxi/utils/styles.dart';

import 'add_credit_card_page.dart';

class CreditCardPage extends StatelessWidget {
  static final routeName = "credit-card";

  @override
  Widget build(BuildContext context) {
    final mQ = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          Container(
            width: mQ.width,
            height: mQ.height,
          ),
          NoLogoHeaderWidget(height: mQ.height * 0.5),
          Positioned(
              top: 100,
              left: 10,
              right: 10,
              child: Container(
                width: mQ.width,
                height: mQ.height * 0.75,
                child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return CreditCardWidget(
                      cardBgColor: Colors.white,
                      textStyle: CustomStyles.cardBoldDarkTextStyle,
                      height: 180,
                      cardNumber: "5399 4678 0987 5677",
                      expiryDate: "02/19",
                      cardHolderName: "OSAMUYIMEN OSAGIEDE DENNIS",
                      cvvCode: "789",
                      showBackView: false,
                    );
                  },
                  itemCount: 5,
                ),
              )),
          Positioned(
            top: 50.0,
            left: 0.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                MaterialButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  color: Colors.white,
                  textColor: Colors.green,
                  child: Icon(
                    Icons.arrow_back,
                    size: 15,
                  ),
                  padding: EdgeInsets.all(6),
                  shape: CircleBorder(),
                ),
                Text(
                  "Credit Card",
                  style: CustomStyles.cardBoldTextStyle,
                ),
              ],
            ),
          ),
          Positioned(
              bottom: 10,
              right: 5,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Text(
                    "Add New Card",
                    style: CustomStyles.cardBoldDarkTextStyleGreen,
                  ),
                  MaterialButton(
                    onPressed: () {
                      Navigator.of(context)
                          .pushNamed(AddCreditCardPage.routeName);
                    },
                    color: Colors.green,
                    textColor: Colors.white,
                    child: Icon(
                      Icons.arrow_forward,
                      size: 15,
                    ),
                    padding: EdgeInsets.all(6),
                    shape: CircleBorder(),
                  )
                ],
              )),
        ],
      ),
    );
  }
}
