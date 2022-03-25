// ignore_for_file: unnecessary_const, prefer_const_constructors, unnecessary_new

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:recycle_app/constants/constants.dart';
import 'package:recycle_app/service/location.dart';

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
  }

  @override
  void initState() {
    // TODO: implement initState
    getcurrentlocation();
    super.initState();
  }

  final TextEditingController _controller = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: scaffoldColor,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          
        },
        child: FaIcon(
          FontAwesomeIcons.add,
          color: scaffoldColor,
          size: 35,
        ),
        backgroundColor: Colors.white,
        hoverColor: Colors.blue,
        focusColor: Colors.red,
        elevation: 2,
      ),
      body: Center(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  //TODO
                  radius: 30,
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
        ]),
      ),
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
