// ignore_for_file: non_constant_identifier_names, must_be_immutable

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
  List items = [];
  late final CollectionReference ItemList;
  @override
  void initState() {
    final CollectionReference ItemList =
        FirebaseFirestore.instance.collection(widget.str);

    Future fetchItemList() async {
      await ItemList.get().then((querySnapshot) {
        for (var element in querySnapshot.docs) {
          items.add(element.data());
        }
      });
      setState(() {});
    }

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
        title: Text(
          "${widget.str} Item Records",
          style: const TextStyle(
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
                    boxShadow: kButtonShadows),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          width: size.width / 2,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                "Weight: " + items[index]["weight"] + " kg",
                                style: poppinFonts(
                                    Colors.white, FontWeight.bold, 20),
                              ),
                              Expanded(
                                child: Text(
                                  items[index]["Description"],
                                  style: poppinFonts(
                                    Colors.white,
                                    FontWeight.normal,
                                    12,
                                  ),
                                  textAlign: TextAlign.justify,
                                ),
                              ),
                              Text(
                                "by ${items[index]["username"]}",
                                style: poppinFonts(
                                    Colors.white, FontWeight.w200, 12),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        height: 200,
                        constraints: const BoxConstraints(
                          maxHeight: 200,
                          maxWidth: 100,
                        ),
                        width: 100,
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20)),
                        child: Image.network(
                          items[index]["image"],
                          fit: BoxFit.cover,
                        ),
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
