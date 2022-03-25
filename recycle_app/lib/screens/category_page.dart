import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:recycle_app/constants/constants.dart';

class CategoryPage extends StatefulWidget {
  

  String str;
  CategoryPage({
    Key? key,
    required this.str,
  }) : super(key: key);

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  final CollectionReference ItemList =
      FirebaseFirestore.instance.collection("Glass");

  List items = [];
  Future fetchItemList() async {
    await ItemList.get().then((querySnapshot) {
      for (var element in querySnapshot.docs) {
        items.add(element.data());
      }
    });
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    fetchItemList();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          "Glass Item Records",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      backgroundColor: scaffoldColor,
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Container(
                height: 150,
                width: size.width,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            items[index]["Description"],
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                          // Text(
                          //   "Weight: ${items[index]["Weight"]}",
                          //   style: const TextStyle(
                          //     color: Colors.white,
                          //     fontSize: 15,
                          //   ),
                          // ),
                          Text(
                            "Username: ${items[index]["username"]}",
                            style:
                                poppinFonts(Colors.white, FontWeight.bold, 15),
                          ),
                        ],
                      ),
                      Image.network(
                        items[index]["image"],
                        fit: BoxFit.scaleDown,
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
          itemCount: items.length,
        ),
      ),
    );
  }
}
