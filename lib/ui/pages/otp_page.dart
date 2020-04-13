import 'package:flutter/material.dart';
import 'package:green_taxi/ui/widgets/header_widget.dart';
import 'package:green_taxi/utils/styles.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import 'book_taxi_page.dart';

class OtpPage extends StatefulWidget {
  static final routeName = "otp-page";
  @override
  _OtpPageState createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  @override
  Widget build(BuildContext context) {
    final mQ = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: <Widget>[
          Stack(
            children: <Widget>[
              HeaderWidget(height: mQ.height * 0.5),
              Positioned(
                top: 20.0,
                left: 0.0,
                child: MaterialButton(
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
              )
            ],
          ),
          SizedBox(
            height: mQ.height * 0.03,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Text("Phone Verification", style: CustomStyles.smallTextStyle),
                SizedBox(height: mQ.height * 0.01),
                Text(
                  "Enter your OTP code below",
                  style: CustomStyles.mediumTextStyle,
                ),
              ],
            ),
          ),
          SizedBox(
            height: mQ.height * 0.05,
          ),
          Card(
            margin: EdgeInsets.only(left: 20, right: 20),
            elevation: 6.0,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(3.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                        flex: 3,
                        child: PinCodeTextField(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          textInputType: TextInputType.number,
                          length: 4,
                          obsecureText: false,
                          inactiveColor: Colors.black,
                          animationType: AnimationType.fade,
                          shape: PinCodeFieldShape.underline,
                          animationDuration: Duration(milliseconds: 300),
                          borderRadius: BorderRadius.circular(5),
                          fieldHeight: 30,
                          fieldWidth: 25,
                          autoFocus: true,
                          onChanged: (value) {
                            setState(() {
                              // currentText = value;
                            });
                          },
                        )),
                    Expanded(
                        flex: 1,
                        child: MaterialButton(
                          onPressed: () {
                            Navigator.of(context)
                                .pushReplacementNamed(BookTaxiPage.routeName);
                          },
                          color: Colors.green,
                          textColor: Colors.white,
                          child: Icon(
                            Icons.arrow_forward,
                            size: 15,
                          ),
                          padding: EdgeInsets.all(6),
                          shape: CircleBorder(),
                        ))
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: mQ.height * 0.1,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: RichText(
              textAlign: TextAlign.start,
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Resend Code in',
                    style: TextStyle(
                      color: Color(0xff303030),
                      fontSize: 12,
                      fontFamily: 'Poppins',
                    ),
                  ),
                  TextSpan(
                    text: ' 10 Seconds',
                    style: TextStyle(
                      color: Color(0xff303030),
                      fontSize: 12,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
