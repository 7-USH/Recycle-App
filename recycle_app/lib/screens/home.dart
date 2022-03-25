// ignore_for_file: unnecessary_const

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:recycle_app/constants/constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  static String id = "home";

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
 
  void _onItemTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        iconSize: 40,
        currentIndex: _selectedIndex,
        onTap: _onItemTap,
        unselectedItemColor: Colors.white,
        selectedItemColor: const Color(0xFFd00657),
        backgroundColor:scaffoldColor,
        elevation: 0.0,
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
