import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/services.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:green_taxi/ui/pages/book_taxi_page.dart';
import 'package:green_taxi/ui/pages/rate_driver_page.dart';
import 'package:green_taxi/utils/constants.dart';
import 'package:green_taxi/utils/styles.dart';

import 'package:green_taxi/model/place_model.dart';

class TaxiMovementPage extends StatefulWidget {
  static String routeName = "taxi-movement-page";
  final PlaceDetail fromPlaceDetail;
  final PlaceDetail toPlaceDetail;
  final Set<Polyline> polylines;
  final List<LatLng> polylineCoordinates;
  final LatLngBounds bound;

  const TaxiMovementPage(
      {Key key,
      this.fromPlaceDetail,
      this.toPlaceDetail,
      this.polylines,
      this.polylineCoordinates,
      this.bound})
      : super(key: key);
  @override
  _TaxiMovementPageState createState() => _TaxiMovementPageState();
}

class _TaxiMovementPageState extends State<TaxiMovementPage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  Completer<GoogleMapController> _controller = Completer();
  bool isMapCreated = false;
  final Key _mapKey = UniqueKey();
  Timer _demoTimer;
  Set<Marker> _markers = {};
  LatLng _initialCameraPosition;
  String _mapStyle;
  BitmapDescriptor _mylocation;
  BitmapDescriptor _taxilocation;
  bool _hasTripEnded = false;

  @override
  void dispose() {
    _demoTimer.cancel();
    super.dispose();
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

    _initialCameraPosition =
        LatLng(widget.toPlaceDetail.lat, widget.toPlaceDetail.lng);

    rootBundle.loadString('assets/images/map_style.txt').then((string) {
      _mapStyle = string;
    });

    super.initState();
  }

  int index = 0;
  void updatePolyLinePoints() async {
    _demoTimer = Timer.periodic(Duration(milliseconds: 300), (t) {
      updateTaxiOnMap(widget.polylineCoordinates[index]);
    });
  }

  void updateTaxiOnMap(LatLng taxiPosition) async {
    CameraPosition cPosition = CameraPosition(
      zoom: 13,
      tilt: 40,
      bearing: 30,
      target: LatLng(taxiPosition.latitude, taxiPosition.longitude),
    );
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(cPosition));
    setState(() {
      var newTaxiPosition =
          LatLng(taxiPosition.latitude, taxiPosition.longitude);
      _markers.removeWhere((m) => m.markerId.value == 'pickup');
      _markers.add(Marker(
          markerId: MarkerId('pickup'),
          position: newTaxiPosition, // updated position
          icon: _taxilocation));
      if (index == widget.polylineCoordinates.length - 1) {
        _hasTripEnded = true;
        _demoTimer.cancel();
        //journey has ended

      } else {
        index++;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: Drawer(),
      body: Stack(
        children: <Widget>[
          Container(
              height: MediaQuery.of(context).size.height, //- 230.0,
              child: GoogleMap(
                key: _mapKey,
                mapType: MapType.normal,
                zoomGesturesEnabled: true,
                // myLocationEnabled: true,
                markers: _markers,
                //  polylines: widget.polylines,
                initialCameraPosition:
                    CameraPosition(target: _initialCameraPosition, zoom: 13),
                onMapCreated: (GoogleMapController controller) {
                  controller.setMapStyle(_mapStyle);
                  _controller.complete(controller);
                  setState(() {
                    _markers.add(Marker(
                        markerId: MarkerId("my destination"),
                        position: LatLng(
                            widget.toPlaceDetail.lat, widget.toPlaceDetail.lng),
                        icon: _mylocation,
                        infoWindow: InfoWindow(
                          title: "My destination",
                        ),
                        onTap: () {}));

                    _markers.add(Marker(
                        markerId: MarkerId("pickup"),
                        position: LatLng(widget.fromPlaceDetail.lat,
                            widget.fromPlaceDetail.lng),
                        icon: _taxilocation,
                        infoWindow: InfoWindow(
                          title: "Pick Up Location",
                        ),
                        onTap: () {}));
                  });

                  Future.delayed(const Duration(milliseconds: 100), () {
                    CameraUpdate u2 =
                        CameraUpdate.newLatLngBounds(widget.bound, 50);
                    controller.animateCamera(u2).then((void v) {
                      //  check(u2, controller);
                    });
                  });
                },
              )),
          Positioned(
            top: 50.0,
            left: 10.0,
            right: 10.0,
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    MaterialButton(
                      onPressed: () {
                        _hasTripEnded
                            ? Navigator.of(context)
                                .pushReplacementNamed(RateDriverPage.routeName)
                            : Navigator.of(context).pop();
                      },
                      color: _hasTripEnded ? Colors.red : Colors.green,
                      textColor: Colors.white,
                      child: Icon(
                        _hasTripEnded ? FontAwesomeIcons.car : Icons.arrow_back,
                        size: 15,
                      ),
                      padding: EdgeInsets.all(6),
                      shape: CircleBorder(),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          !_hasTripEnded
                              ? "taxi will arrive"
                              : "taxi at destination",
                          style: CustomStyles.smallLightTextStyle,
                        ),
                        Text(
                          !_hasTripEnded
                              ? "Your Destination in 5 minutes"
                              : "Your trip has ended",
                          style: CustomStyles.normalTextStyle,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: !_hasTripEnded ? Constatnts.primaryColor : Colors.red,
        onPressed: () {
          !_hasTripEnded
              ? updatePolyLinePoints()
              : Navigator.of(context)
                  .pushReplacementNamed(RateDriverPage.routeName);
        },
        child: Icon(FontAwesomeIcons.taxi),
      ),
    );
  }
}
