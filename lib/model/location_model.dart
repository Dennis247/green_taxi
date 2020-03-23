import 'package:flutter/material.dart';

class LocationModel {
  final String id;
  final double longitude;
  final double latitude;
  final String name;

  LocationModel(
      {@required this.id,
      @required this.longitude,
      @required this.latitude,
      @required this.name});
}
