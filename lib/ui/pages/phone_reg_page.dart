import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:green_taxi/ui/widgets/header_widget.dart';
import 'otp_page.dart';

class PhoneRegPage extends StatefulWidget {
  static final routeName = "phone-page";
  @override
  _PhoneRegPageState createState() => _PhoneRegPageState();
}

class _PhoneRegPageState extends State<PhoneRegPage> {
  @override
  Widget build(BuildContext context) {
    final mQ = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: <Widget>[
          HeaderWidget(height: mQ.height * 0.5),
          SizedBox(
            height: mQ.height * 0.03,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Text(
                  "Hello, nice to meet you!",
                  style: TextStyle(
                    color: Color(0xff303030),
                    fontSize: 12,
                    fontFamily: 'Poppins',
                  ),
                ),
                SizedBox(height: mQ.height * 0.01),
                Text(
                  "Get moving with Green Taxi",
                  style: TextStyle(
                    color: Color(0xff303030),
                    fontSize: 18,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w700,
                  ),
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
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Center(
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: CountryCodePicker(
                      onChanged: (e) {},
                      // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
                      initialSelection: 'NG',
                      favorite: ['+39', 'FR'],
                      // optional. Shows only country name and flag
                      showCountryOnly: false,
                      // optional. Shows only country name and flag when popup is closed.
                      showOnlyCountryWhenClosed: false,
                      // optional. aligns the flag and the Text left
                      alignLeft: false,
                    ),
                  ),
                  Expanded(
                      flex: 2,
                      child: TextField(
                        autofocus: true,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Enter your mobile number",
                          hintStyle: TextStyle(
                            color: Color(0xff303030),
                            fontSize: 12,
                            fontFamily: 'Poppins',
                          ),
                        ),
                        onSubmitted: (e) {
                          Navigator.of(context).pushNamed(OtpPage.routeName);
                        },
                        keyboardType: TextInputType.number,
                      )),
                ],
              ),
            ),
          ),
          SizedBox(
            height: mQ.height * 0.1,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 40, right: 40),
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'By creating an account, you agree to our',
                    style: TextStyle(
                      color: Color(0xff303030),
                      fontSize: 12,
                      fontFamily: 'Poppins',
                    ),
                  ),
                  TextSpan(
                    text: ' Terms of Service',
                    style: TextStyle(
                      color: Color(0xff303030),
                      fontSize: 12,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  TextSpan(
                    text: ' and ',
                    style: TextStyle(
                      color: Color(0xff303030),
                      fontSize: 12,
                      fontFamily: 'Poppins',
                    ),
                  ),
                  TextSpan(
                    text: 'Privacy Policy',
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
