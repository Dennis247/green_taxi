import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:green_taxi/utils/styles.dart';

class RideHistoryWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 20.0, top: 30.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Icon(
                          FontAwesomeIcons.solidDotCircle,
                          size: 12,
                          color: Colors.green,
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'From - Kamieńskiego 11, Cracow',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 10,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        Text(
                          "Bonarka City Center",
                          style: CustomStyles.normalTextStyle,
                        ),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, top: 5.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Icon(
                          FontAwesomeIcons.solidDotCircle,
                          size: 12,
                          color: Colors.red,
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'From - Kamieńskiego 11, Cracow',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 10,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        Text(
                          "Bonarka City Center",
                          style: CustomStyles.normalTextStyle,
                        ),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(
                    "ID : 598598498954",
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      color: Colors.grey,
                      fontSize: 10,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                  Text(
                    'Today: 5:15 pm',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 10,
                      fontFamily: 'Poppins',
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
      margin: EdgeInsets.only(left: 25, right: 25),
      height: 185,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Color(0x33303030),
            offset: Offset(0, 5),
            blurRadius: 15,
            spreadRadius: 0,
          ),
        ],
      ),
    );
  }
}
