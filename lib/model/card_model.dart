import 'package:flutter/material.dart';

class UserCardModel {
  final String id;
  final String imageUrl;
  final String cardNumber;

  UserCardModel(
      {@required this.id, @required this.imageUrl, @required this.cardNumber});
}
