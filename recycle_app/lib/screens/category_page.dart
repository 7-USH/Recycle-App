import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:recycle_app/constants/constants.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({Key? key}) : super(key: key);

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
    print(items.length);
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
                            items[index]["description"],
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                          Text(
                            "Weight: ${items[index]["Weight"]}",
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                            ),
                          ),
                          Text(
                            "Username: ${items[index]["username"]}",
                            style:
                                poppinFonts(Colors.white, FontWeight.bold, 15),
                          ),
                          Text(
                            "Location: ${items[index]["Location"].latitude}°N, ${items[index]["Location"].longitude}°S",
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 100,
                        child: Image.network(items[index]["image"]),
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
