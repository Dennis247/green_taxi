import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:green_taxi/ui/pages/book_taxi_page.dart';
import 'package:green_taxi/ui/widgets/header_widget.dart';
import 'package:green_taxi/utils/constants.dart';
import 'package:green_taxi/utils/styles.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class RateDriverPage extends StatefulWidget {
  static final routeName = "rate-driver";

  @override
  _RateDriverPageState createState() => _RateDriverPageState();
}

class _RateDriverPageState extends State<RateDriverPage> {
  double rating = 0.0;
  _buildDurationTime(String title, String subtitle) {
    return Column(
      children: <Widget>[
        Text(title,
            textAlign: TextAlign.center,
            style: CustomStyles.smallLightTextStyle),
        Text(
          subtitle,
          style: CustomStyles.cardBoldDarkTextStyle2,
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
                height: mQ.height * 0.8,
                width: mQ.width,
                child: ListView(
                  children: <Widget>[
                    Container(
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
                          FontAwesomeIcons.user,
                          color: Colors.white,
                          size: 75,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text("Your Driver",
                        textAlign: TextAlign.center,
                        style: CustomStyles.smallLightTextStyle),
                    Text(
                      "Dennis Osagiede",
                      textAlign: TextAlign.center,
                      style: CustomStyles.cardBoldDarkTextStyle,
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        _buildDurationTime("Time", "15 min"),
                        _buildDurationTime("Price", "N 1000"),
                        _buildDurationTime("Distance", "15 km"),
                      ],
                    ),
                    SizedBox(
                      height: mQ.height * 0.05,
                    ),
                    Text("Dennis",
                        textAlign: TextAlign.center,
                        style: CustomStyles.smallLightTextStyle),
                    Text(
                      "How is your trip ?",
                      textAlign: TextAlign.center,
                      style: CustomStyles.cardBoldDarkTextStyle,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Center(
                        child: SmoothStarRating(
                      rating: rating,
                      size: 45,
                      filledIconData: Icons.star,
                      halfFilledIconData: Icons.star_half,
                      defaultIconData: Icons.star_border,
                      starCount: 5,
                      allowHalfRating: false,
                      spacing: 2.0,
                      onRatingChanged: (value) {
                        setState(() {
                          rating = value;
                        });
                      },
                    )),
                    SizedBox(
                      height: 10,
                    ),
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
                  "You are in place !",
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
                    "Submit",
                    style: CustomStyles.cardBoldDarkTextStyleGreen,
                  ),
                  MaterialButton(
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
                  )
                ],
              )),
        ],
      ),
    );
  }
}
