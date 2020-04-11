import 'package:flutter/material.dart';
import 'package:green_taxi/model/card_model.dart';

class TestPages extends StatefulWidget {
  @override
  _TestPagesState createState() => _TestPagesState();
}

class _TestPagesState extends State<TestPages> {
  var _img = new Image.network(
      "https://upload.wikimedia.org/wikipedia/commons/thumb/8/89/TUCPamplona10.svg/500px-TUCPamplona10.svg.png");

  List<UserCardModel> _cards = [
    UserCardModel(
        id: "1",
        imageUrl: 'assets/images/img_visa_logo.png',
        cardNumber: "**** **** **** 5687"),
    UserCardModel(
        id: "2",
        imageUrl: 'assets/images/img_visa_logo.png',
        cardNumber: "**** **** **** 9987"),
    UserCardModel(
        id: "3",
        imageUrl: 'assets/images/img_visa_logo.png',
        cardNumber: "**** **** **** 7879")
  ];
  UserCardModel _selectedalvalue;

  @override
  void initState() {
    _selectedalvalue = _cards[0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Test Drop"),
      ),
      body: new Container(
        width: MediaQuery.of(context).size.width,
        height: 50.0,
        child: DropdownButton<UserCardModel>(
          icon: const Icon(
            Icons.arrow_drop_down,
            color: Colors.green,
          ),
          items: _cards.map((UserCardModel value) {
            return new DropdownMenuItem<UserCardModel>(
                value: value,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Image.asset(value.imageUrl),
                    Text(value.cardNumber),
                  ],
                ));
          }).toList(),

          onChanged: (value) {
            setState(() {
              _selectedalvalue = value;
            });
          },
          isExpanded: true,
          value: _selectedalvalue,
          // onSaved: (value) {

          // },
        ),
      ),
    );
  }
}
