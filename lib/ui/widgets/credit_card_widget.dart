import 'package:flutter/material.dart';
import 'package:flutter_credit_card/credit_card_widget.dart';
import 'package:green_taxi/utils/styles.dart';

class CreditCardWIdget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
  }
}
