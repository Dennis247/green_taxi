import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:green_taxi/ui/widgets/header_widget.dart';
import 'package:green_taxi/utils/constants.dart';
import 'package:green_taxi/utils/styles.dart';

class RideDetailsPage extends StatefulWidget {
  static final routeName = "ride-details-page";

  @override
  _RideDetailsPageState createState() => _RideDetailsPageState();
}

class _RideDetailsPageState extends State<RideDetailsPage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  Completer<GoogleMapController> _controller = Completer();
  GoogleMapController mapController;
  bool isMapCreated = false;
  final Key _mapKey = UniqueKey();
  Set<Marker> _markers = {};
  static const LatLng _center = const LatLng(6.5244, 3.3792);
  LatLng _lastMapPosition = _center;

  String _mapStyle;
  BitmapDescriptor _mylocation;
  BitmapDescriptor _taxilocation;
  LatLng _initialCameraPosition = LatLng(6.5273, 3.3414);
  LatLng _destinationPosition = LatLng(6.6018, 3.3515);

  LatLngBounds bound;

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
    _controller.complete(controller);
    //   controller.setMapStyle(_mapStyle);
    setState(() {
      _markers.clear();
      addMarker(
          _initialCameraPosition, "PickUp", "Shopping Mall", _taxilocation);
      addMarker(_destinationPosition, "Destination", "My Home", _mylocation);
    });

    Future.delayed(const Duration(milliseconds: 100), () {
      CameraUpdate u2 = CameraUpdate.newLatLngBounds(bound, 50);
      this.mapController.animateCamera(u2).then((void v) {
        check(u2, this.mapController);
      });
    });
  }

  void addMarker(LatLng mLatLng, String mTitle, String mDescription,
      BitmapDescriptor marker) {
    _markers.add(Marker(
      markerId:
          MarkerId((mTitle + "_" + _markers.length.toString()).toString()),
      position: mLatLng,
      infoWindow: InfoWindow(
        title: mTitle,
        snippet: mDescription,
      ),
      icon: marker,
    ));
  }

  @override
  void initState() {
    BitmapDescriptor.fromAssetImage(ImageConfiguration(devicePixelRatio: 2.5),
            'assets/images/mylocation.png')
        .then((onValue) {
      _taxilocation = onValue;
    });

    BitmapDescriptor.fromAssetImage(ImageConfiguration(devicePixelRatio: 2.5),
            'assets/images/mydestination.png')
        .then((onValue) {
      _mylocation = onValue;
    });

    rootBundle.loadString('assets/images/map_style.txt').then((string) {
      _mapStyle = string;
    });

    getLatLngBounds(_initialCameraPosition, _destinationPosition);

    super.initState();
  }

  void _onCameraMove(CameraPosition position) {
    _lastMapPosition = position.target;
  }

  void getLatLngBounds(LatLng from, LatLng to) {
    if (from.latitude > to.latitude && from.longitude > to.longitude) {
      bound = LatLngBounds(southwest: to, northeast: from);
    } else if (from.longitude > to.longitude) {
      bound = LatLngBounds(
          southwest: LatLng(from.latitude, to.longitude),
          northeast: LatLng(to.latitude, from.longitude));
    } else if (from.latitude > to.latitude) {
      bound = LatLngBounds(
          southwest: LatLng(to.latitude, from.longitude),
          northeast: LatLng(from.latitude, to.longitude));
    } else {
      bound = LatLngBounds(southwest: from, northeast: to);
    }
  }

  void check(CameraUpdate u, GoogleMapController c) async {
    c.animateCamera(u);
    //  mapController.animateCamera(u);
    LatLngBounds l1 = await c.getVisibleRegion();
    LatLngBounds l2 = await c.getVisibleRegion();
    print(l1.toString());
    print(l2.toString());
    if (l1.southwest.latitude == -90 || l2.southwest.latitude == -90)
      check(u, c);
  }

  _buildRideInfo(
    String point,
    String title,
    String subtitle,
    Color color,
  ) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Column(
          children: <Widget>[
            Icon(
              FontAwesomeIcons.solidDotCircle,
              size: 12,
              color: color,
            ),
          ],
        ),
        SizedBox(
          width: 15,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('$point - $title', style: CustomStyles.smallLightTextStyle),
            SizedBox(
              height: 3,
            ),
            Text(
              subtitle,
              style: CustomStyles.normalTextStyle,
            ),
          ],
        )
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
              top: 100,
              left: 10,
              right: 10,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  alignment: Alignment.center,
                  width: mQ.width,
                  height: mQ.height * 0.8,
                  decoration: new BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: Colors.white,
                    borderRadius: new BorderRadius.all(Radius.circular(5.0)),
                    boxShadow: [
                      BoxShadow(
                          color: Color(0x29000000),
                          offset: Offset(0, 5),
                          blurRadius: 6,
                          spreadRadius: 0)
                    ],
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0, top: 30.0),
                          child: _buildRideInfo(
                              "From",
                              "72 Evbotubu lane Benin",
                              "My Home",
                              Colors.green),
                        ),
                        Padding(
                            padding: const EdgeInsets.only(left: 20, top: 10),
                            child: _buildRideInfo(
                                "To",
                                "Ring road center mami market",
                                "Shopping Mall",
                                Colors.red)),
                        Container(
                            margin: const EdgeInsets.all(20),
                            height: MediaQuery.of(context).size.height * 0.3,
                            child: GoogleMap(
                              key: _mapKey,
                              mapType: MapType.normal,
                              zoomGesturesEnabled: true,
                              markers: _markers,
                              onMapCreated: _onMapCreated,
                              initialCameraPosition: CameraPosition(
                                target: _center,
                                zoom: 11.0,
                              ),
                              onCameraMove: _onCameraMove,
                            )),
                        ListTile(
                          leading: Icon(
                            FontAwesomeIcons.user,
                            color: Constatnts.primaryColor,
                            size: 35,
                          ),
                          title: Text("DRIVER",
                              style: CustomStyles.smallLightTextStyle),
                          subtitle: Text(
                            "Paul Marcharty",
                            style: CustomStyles.cardBoldDarkTextStyle,
                          ),
                          trailing: Text(
                            "12 dec 2020",
                            style: CustomStyles.smallLightTextStyle,
                          ),
                        ),
                        ListTile(
                          leading: Icon(
                            FontAwesomeIcons.moneyCheck,
                            color: Constatnts.primaryColor,
                            size: 30,
                          ),
                          title: Text("PAYMENT",
                              style: CustomStyles.smallLightTextStyle),
                          subtitle: Text(
                            "N 5000",
                            style: CustomStyles.cardBoldDarkTextStyle,
                          ),
                          trailing: Text(
                            "CARD PAYMENT",
                            style: CustomStyles.smallLightTextStyle,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        )
                      ],
                    ),
                  ),
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
                  "Ride Details",
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
