import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/services.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:green_taxi/model/card_model.dart';
import 'package:green_taxi/model/place_model.dart';
import 'package:green_taxi/model/ride_option_model.dart';
import 'package:green_taxi/pages/taxi_movement_page.dart';
import 'package:green_taxi/utils/constants.dart';
import 'package:green_taxi/utils/styles.dart';
import 'package:place_picker/uuid.dart';
import 'package:green_taxi/provider/google_map_service.dart';

class TaxiMovementPage extends StatefulWidget {
  static String routeName = "taxi-movement-page";
  final PlaceDetail fromPlaceDetail;
  final PlaceDetail toPlaceDetail;
  final Set<Polyline> polylines;
  final List<LatLng> polylineCoordinates;

  const TaxiMovementPage(
      {Key key,
      this.fromPlaceDetail,
      this.toPlaceDetail,
      this.polylines,
      this.polylineCoordinates})
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

  @override
  void initState() {
    BitmapDescriptor.fromAssetImage(
            ImageConfiguration(devicePixelRatio: 2.5), 'assets/images/taxi.png')
        .then((onValue) {
      _taxilocation = onValue;
    });

    BitmapDescriptor.fromAssetImage(ImageConfiguration(devicePixelRatio: 2.5),
            'assets/images/mylocation.png')
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
      if (index == widget.polylineCoordinates.length) {
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
                polylines: widget.polylines,
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
                },
              )),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          updatePolyLinePoints();
        },
        child: Icon(FontAwesomeIcons.taxi),
      ),
    );
  }
}
