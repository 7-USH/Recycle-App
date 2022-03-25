// ignore_for_file: avoid_types_as_parameter_names

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:recycle_app/constants/constants.dart';

const double pinInvisible = -400;
const double pinVisible = 20;

class MapsPage extends StatefulWidget {
  MapsPage({Key? key, required this.souLat, required this.souLon})
      : super(key: key);
  static String id = "home";
  double souLat;
  double souLon;

  @override
  State<MapsPage> createState() => _MapsPageState();
}

class _MapsPageState extends State<MapsPage> {

  bool isTap = false;
  

  Set<Marker> _markers = {};
  late BitmapDescriptor mapMarker;
  double lat = 0.0;
  double lon = 0.0;

  void setCustomMarker() async {
    mapMarker = await BitmapDescriptor.fromAssetImage(
        const ImageConfiguration(), "assets/images/map_marker.jpg");
  }

  @override
  void initState() {
    super.initState();
    lat = widget.souLat;
    lon = widget.souLon;
    setCustomMarker();
  }

  void _onMapCreated(GoogleMapController _controller) {
    _controller.setMapStyle(Utils.mapStyle);
    setState(() {
      _markers.add(
        Marker(
          markerId: const MarkerId('id-1'),
          position: LatLng(widget.souLat, widget.souLon),
          onTap: (){
            isTap = !isTap;
            setState(() {});
          },
          infoWindow: InfoWindow(
              title: 'Temp',
              snippet: 'Nice Place',
              onTap: () {
                
              }),
          icon: mapMarker,
        ),
      );
    });
  }

  // ignore: prefer_final_fields

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    CameraPosition _kGooglePlex = CameraPosition(
      target: LatLng(lat, lon),
      zoom: 14.4746,
    );

    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          GoogleMap(
            mapToolbarEnabled: false,
            initialCameraPosition: _kGooglePlex,
            onMapCreated: _onMapCreated,
            zoomControlsEnabled: false,
            myLocationButtonEnabled: false,
            myLocationEnabled: false,
            rotateGesturesEnabled: false,
            zoomGesturesEnabled: false,
            compassEnabled: false,
            markers: _markers,
            onTap: (LatLng) {
              setState(() {
                isTap = false;
              });
            },
          ),
         AnimatedPositioned(
           curve: Curves.easeInOut,
           bottom: isTap ? pinVisible : pinInvisible,
           duration: const Duration(milliseconds: 500),
           child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            clipBehavior: Clip.hardEdge,
            margin: const EdgeInsets.all(20),
            padding: const EdgeInsets.only(left: 20, right: 20),
            height: size.height/5.5,
            width: size.width / 1.2,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(50),
                boxShadow: kButtonShadows),
            child: const Center(
              child: Text("My location"),
            )
            ),
          )
        ],
      ),
    );
  }
}

class Utils {
  static String mapStyle = '''
  [
  {
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#242f3e"
      }
    ]
  },
  {
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#746855"
      }
    ]
  },
  {
    "elementType": "labels.text.stroke",
    "stylers": [
      {
        "color": "#242f3e"
      }
    ]
  },
  {
    "featureType": "administrative.land_parcel",
    "elementType": "labels",
    "stylers": [
      {
        "visibility": "off"
      }
    ]
  },
  {
    "featureType": "administrative.locality",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#d59563"
      }
    ]
  },
  {
    "featureType": "poi",
    "elementType": "labels.text",
    "stylers": [
      {
        "visibility": "off"
      }
    ]
  },
  {
    "featureType": "poi",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#d59563"
      }
    ]
  },
  {
    "featureType": "poi.business",
    "stylers": [
      {
        "visibility": "off"
      }
    ]
  },
  {
    "featureType": "poi.park",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#263c3f"
      }
    ]
  },
  {
    "featureType": "poi.park",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#6b9a76"
      }
    ]
  },
  {
    "featureType": "road",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#38414e"
      }
    ]
  },
  {
    "featureType": "road",
    "elementType": "geometry.stroke",
    "stylers": [
      {
        "color": "#212a37"
      }
    ]
  },
  {
    "featureType": "road",
    "elementType": "labels.icon",
    "stylers": [
      {
        "visibility": "off"
      }
    ]
  },
  {
    "featureType": "road",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#9ca5b3"
      }
    ]
  },
  {
    "featureType": "road.highway",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#746855"
      }
    ]
  },
  {
    "featureType": "road.highway",
    "elementType": "geometry.stroke",
    "stylers": [
      {
        "color": "#1f2835"
      }
    ]
  },
  {
    "featureType": "road.highway",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#f3d19c"
      }
    ]
  },
  {
    "featureType": "road.local",
    "elementType": "labels",
    "stylers": [
      {
        "visibility": "off"
      }
    ]
  },
  {
    "featureType": "transit",
    "stylers": [
      {
        "visibility": "off"
      }
    ]
  },
  {
    "featureType": "transit",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#2f3948"
      }
    ]
  },
  {
    "featureType": "transit.station",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#d59563"
      }
    ]
  },
  {
    "featureType": "water",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#17263c"
      }
    ]
  },
  {
    "featureType": "water",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#515c6d"
      }
    ]
  },
  {
    "featureType": "water",
    "elementType": "labels.text.stroke",
    "stylers": [
      {
        "color": "#17263c"
      }
    ]
  }
]
''';
}
