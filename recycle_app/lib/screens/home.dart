// ignore_for_file: unnecessary_const, prefer_const_constructors, unnecessary_new

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:recycle_app/constants/constants.dart';
import 'package:recycle_app/screens/MapsPage.dart';
import 'package:recycle_app/screens/category_page.dart';
import 'package:recycle_app/screens/photo_page.dart';
import 'package:recycle_app/service/location.dart';
import 'package:recycle_app/widgets/ListCards.dart';
import 'package:recycle_app/widgets/card.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  static String id = "home";

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final screens = [
    const Center(
      child: Text(
        'Home',
        style: TextStyle(fontSize: 40),
      ),
    )
  ];

  void _onItemTap(int index) {
    setState(() {
      _selectedIndex = index;
    });

    if (_selectedIndex == 1) {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return MapsPage(souLat: latitude, souLon: longitude);
      }));
    }
  }

  late double latitude = 0;
  late double longitude = 0;

  void getLocation() async {
    MyLocation location = MyLocation();
    await location.getCurrentLocation();
    latitude = await location.getLatitude();
    print(latitude);
    longitude = await location.getLongitude();
    print(longitude);
    setState(() {});
  }

  @override
  void initState() {
    getLocation();
  }

  final TextEditingController _controller = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: scaffoldColor,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, PhotoPage.id);
        },
        child: FaIcon(
          // ignore: deprecated_member_use
          FontAwesomeIcons.add,
          color: scaffoldColor,
          size: 35,
        ),
        backgroundColor: Colors.white,
        hoverColor: Colors.blue,
        focusColor: Colors.red,
        elevation: 4,
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        SizedBox(
          height: 50,
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)),
                child: Icon(
                  Icons.person,
                  size: 25,
                  color: scaffoldColor,
                ),
              ),
              Text(
                "200 points",
                style: poppinFonts(Colors.white, FontWeight.normal, 15),
              )
            ],
          ),
        ),
        SizedBox(
          height: 12,
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: CupertinoSearchTextField(
            controller: _controller,
            placeholder: "Search Recycling Facilities",
            placeholderStyle: poppinFonts(Colors.grey, FontWeight.normal, 15),
            borderRadius: BorderRadius.circular(20),
            itemSize: 50,
            onChanged: (value) {
              //TODO
            },
          ),
        ),
        DetailCard(),
        Container(
          width: size.width,
          height: size.height / 5,
          child: ListView(
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CategoryPage(str: "Glass"),
                    ),
                  );
                },
                child: ListCard(
                    imgUrl: "assets/images/bottle.png", color: Colors.white10),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CategoryPage(str: "Paper"),
                    ),
                  );
                },
                child: ListCard(
                    imgUrl: "assets/images/documents.png",
                    color: Colors.white10),
              ),
              GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CategoryPage(str: "Electronics"),
                      ),
                    );
                  },
                  child: ListCard(
                      imgUrl: "assets/images/electronic-devices.png",
                      color: Colors.white10)),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CategoryPage(str: "Chemicals"),
                    ),
                  );
                },
                child: ListCard(
                    imgUrl: "assets/images/chemicals.png",
                    color: Colors.white10),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CategoryPage(str: "Plastic"),
                    ),
                  );
                },
                child: ListCard(
                    imgUrl: "assets/images/plastic.png", color: Colors.white10),
              ),
            ],
          ),
        )
      ]),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        iconSize: 40,
        currentIndex: _selectedIndex,
        onTap: _onItemTap,
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.blue,
        backgroundColor: scaffoldColor,

        elevation: 2.0,
        // ignore: prefer_const_literals_to_create_immutables
        items: [
          const BottomNavigationBarItem(
            icon: FaIcon(
              FontAwesomeIcons.home,
              color: Colors.white,
              size: 30,
            ),
            label: '',
          ), // ignore: prefer_const_constructors
          const BottomNavigationBarItem(
            icon: const Icon(
              Icons.location_on,
              color: Colors.white,
            ),
            label: '',
          ),
        ],
      ),
    );
  }
}
