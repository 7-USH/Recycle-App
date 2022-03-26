// ignore_for_file: must_be_immutable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:recycle_app/constants/constants.dart';
import 'package:recycle_app/screens/recycleitem_page.dart';

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
  List collections = [];

  bool isTap = false;

  Set<Marker> _markers = {};

  late BitmapDescriptor mapMarker;
  double lat = 0.0;
  double lon = 0.0;

  void setCustomMarker() async {
    mapMarker = await BitmapDescriptor.fromAssetImage(
        const ImageConfiguration(), "assets/images/map_marker.jpg");
  }

  List markerData = [];
  Future fetchData() async {
    collections.add(FirebaseFirestore.instance.collection("Glass"));
    collections.add(FirebaseFirestore.instance.collection("Chemicals"));
    collections.add(FirebaseFirestore.instance.collection("Electronics"));
    collections.add(FirebaseFirestore.instance.collection("Paper"));
    collections.add(FirebaseFirestore.instance.collection("Plastic"));
    for (var item in collections) {
      await item.get().then((querySnapshot) {
        for (var element in querySnapshot.docs) {
          markerData.add(
            element.data(),
          );
        }
      });
    }
    setState(() {
      for (var item in markerData) {
        print(item['username']);
        print("");
        print("");
        print(item['latitude']);
        print(item['longitude']);
      }
    });
  }

  @override
  void initState() {
    super.initState();
    lat = widget.souLat;
    lon = widget.souLon;
    setCustomMarker();
    fetchData();
  }

  void _onMapCreated(GoogleMapController _controller) {
    _controller.setMapStyle(Utils.mapStyle);
    setState(() {
      print("KJFFKJFJKJANFBFJ");
      for (int i = 0; i < markerData.length; i++) {
        LatLng curLocation =
            LatLng(markerData[i]['latitude'], markerData[i]['longitude']);
        _markers.clear();
        _markers.add(
          Marker(
            markerId: MarkerId(i.toString()),
            position: curLocation,
            onTap: () {
              isTap = !isTap;
              setState(() {});
            },
            infoWindow: InfoWindow(
                title: "ffnfnf", snippet: 'Nice Place', onTap: () {}),
            icon: BitmapDescriptor.defaultMarker,
          ),
        );
      }
    });
  }

  // ignore: prefer_final_fields

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    CameraPosition _kGooglePlex = CameraPosition(
      target: LatLng(widget.souLat, widget.souLon),
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
            zoomGesturesEnabled: false,
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
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => RecycleItemPage())));
              },
              child: Hero(
                tag: "1",
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  clipBehavior: Clip.hardEdge,
                  margin: const EdgeInsets.all(20),
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  height: size.height / 5.5,
                  width: size.width / 1.2,
                  decoration: BoxDecoration(
                      color: scaffoldColor.withOpacity(0.8),
                      borderRadius: BorderRadius.circular(50),
                      boxShadow: kButtonShadows),
                  child: Center(
                    child: Text(
                      "My location",
                      style: poppinFonts(Colors.white, FontWeight.normal, 20),
                    ),
                  ),
                ),
              ),
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
