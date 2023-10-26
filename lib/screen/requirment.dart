import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mymendorr/screen/description.dart';
import 'package:mymendorr/widgets/drawer.dart';

import '../handler/api_filehandler.dart';
import '../handler/service.dart';

class Requirement extends StatefulWidget {
  const Requirement({super.key});

  @override
  State<Requirement> createState() => _RequirementState();
}

class _RequirementState extends State<Requirement> {
  String description = "";
  List<String> items = [];
  bool loading = false;
  @override
  initState() {
    super.initState();
    loadServices();
  }

  List<String> getServices() {
    var value = getServicesFromLocalStorage();
    final List<dynamic> parsed = json.decode(value.toString());
    List<String> myfinal = [];
    for (var ele in parsed) {
      myfinal.add(ele['name']);
    }
    return myfinal;
  }

  loadServices() async {
    setState(() {
      items = [];
      loading = true;
    });
    var response = getServices();
    setState(() {
      loading = false;
      items = response;
    });
  }

  getText() {
    description = "this is a requirement description";
    return description;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            backgroundColor: const Color(0xFF0C3B2E),
            title: Text('Requirement')),
        drawer: const CommonDrawer(),
        body: Container(
            width: Get.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 30),
                  height: 50,
                  child: Text(
                    'Choose the Service',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 28,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Expanded(
                    child: ListView.builder(
                        itemCount: items.length,
                        itemBuilder: (BuildContext ctxt, int i) {
                          return singleList(items[i]);
                        }))
              ],
            )),
      ),
    );
  }

  Widget singleList(String text) {
    return GestureDetector(
      onTap: () {
        // if (text == "ID") {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Description(text: text)),
        );
        // }
      },
      child: Container(
        width: Get.width,
        padding: const EdgeInsets.all(15),
        margin: const EdgeInsets.all(6),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey,
            width: 2,
          ),
        ),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text(
            text,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Container(
              width: 36,
              height: 36,
              child: Image.asset(
                'assets/images/right-arrow.png',
              ))
        ]),
      ),
    );
  }
}
