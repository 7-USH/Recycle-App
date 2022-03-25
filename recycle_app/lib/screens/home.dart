import 'package:flutter/material.dart';
import 'package:recycle_app/constants/constants.dart';
class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);
  static String id = "home";

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int curr=0;
  final screens =[
      const Center(child: Text('Home',style: TextStyle(fontSize: 40),),)
      

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldColor,
      
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 40,
      
        
        currentIndex: curr,
        onTap: (index) =>curr=index,
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.blue,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        // ignore: prefer_const_literals_to_create_immutables
        items: [
          const BottomNavigationBarItem(

            
            icon: Icon(Icons.home,color: Colors.white,),
            label: 'Home',
            ),
             const BottomNavigationBarItem(
              
              icon: Icon(Icons.add,color: Colors.white,),
              label: 'Photo',
              
              ),

            // ignore: prefer_const_constructors
            BottomNavigationBarItem(
              icon: const Icon(Icons.map,color: Colors.white,),
              label: 'Maps', 
              
              
              
              ),

          
        ],
      ),

      
    );
  }
}
