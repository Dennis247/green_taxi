import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:green_taxi/ui/widgets/header_widget.dart';
import 'package:green_taxi/utils/constants.dart';
import 'package:green_taxi/utils/styles.dart';

class SupportPage extends StatelessWidget {
  static final routeName = "support";

  _buildRowWidgets(IconData iconData, String title, String subtitle) {
    return Row(
      children: <Widget>[
        Icon(
          iconData,
          color: Constatnts.primaryColor,
        ),
        SizedBox(
          width: 20,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              title,
              style: TextStyle(
                color: Colors.grey,
                fontSize: 10,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w300,
              ),
            ),
            new Text(subtitle, style: CustomStyles.smallTextStyle)
          ],
        ),
      ],
    );
  }

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
              top: mQ.height * 0.18,
              child: Container(
                height: 500,
                width: mQ.width,
                child: ListView(
                  children: <Widget>[
                    new Container(
                      width: 150,
                      height: 150,
                      decoration: new BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xffd6d6d6),
                        boxShadow: [
                          BoxShadow(
                              color: Color(0x29000000),
                              offset: Offset(0, 5),
                              blurRadius: 6,
                              spreadRadius: 0)
                        ],
                      ),
                      child: Center(
                        child: Icon(
                          Icons.headset,
                          color: Colors.white,
                          size: 100,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Contact us@",
                      textAlign: TextAlign.center,
                      style: CustomStyles.cardBoldDarkTextStyle,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30, top: 30),
                      child: Column(
                        children: <Widget>[
                          _buildRowWidgets(FontAwesomeIcons.facebook,
                              "facebook", "facebook.com/osagiededennis"),
                          SizedBox(
                            height: 25,
                          ),
                          _buildRowWidgets(FontAwesomeIcons.twitter, "twitter",
                              "twitter.com/Xource_Code"),
                          SizedBox(
                            height: 25,
                          ),
                          _buildRowWidgets(FontAwesomeIcons.instagram,
                              "instagram", "instagram.com/xource_code"),
                        ],
                      ),
                    )
                  ],
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
                  "Call Center",
                  style: CustomStyles.cardBoldTextStyle,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
