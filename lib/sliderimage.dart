import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
import 'package:mymendorr/screen/login.dart';
import 'package:mymendorr/screen/schedluapp.dart';
import 'package:mymendorr/screen/signup.dart';
import 'package:mymendorr/widgets/drawer.dart';
import 'package:mymendorr/widgets/main_screen_card.dart';

import 'handler/service.dart';
import 'model/announcement.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      // Remove the debug banner
      debugShowCheckedModeBanner: false,

      title: 'mymendor',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<AnnouncementModel> announcements = [];

  @override
  initState() {
    super.initState();
    getserviceListFromMain();
  }

  getAnnouncements() {
    var value = getAnnouncementsFromLocalStorage();
    final List<dynamic> parsed = json.decode(value.toString());
    return parsed;
  }

  getserviceListFromMain() async {
    await saveServiceListToLocalStorage();
    var temp = await saveAnnouncementListToLocalStorage();
    setState(() {
      announcements = temp;
    });
    await saveDepartmentListToLocalStorage();
  }

  // a list of images' URLs
  int heightToBeReduced = 400;
  final List data = [
    {
      //"title": "Image 1",
      "url": "assets/images/slider1.jpg"
    },
    {
      //"title": "Image 2",
      "url": "assets/images/slider2.jpg"
    },
    {
      //"title": "Image 3",
      "url": "assets/images/slider3.jpg"
    },
    {
      //"title": "Image 4",
      "url": "assets/images/slider1.jpg"
    },
    {
      // "title": "Image 5",
      "url": "assets/images/slider2.jpg"
    },
    {
      //"title": "Image 6",
      "url": "assets/images/slider1.jpg"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('mymendor'),
        backgroundColor: const Color(0xFF0C3B2E),
      ),
      drawer: const CommonDrawer(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // Implement the image carousel
          CarouselSlider(
            options: CarouselOptions(
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 2),
              autoPlayAnimationDuration: const Duration(milliseconds: 400),
              height: 260,
            ),
            items: data.map((item) {
              return GridTile(
                footer: Container(
                  padding: const EdgeInsets.all(15),
                  // color: Colors.black54,
                  // child: Text(
                  //    item["title"],
                  //   style: const TextStyle(color: Colors.white, fontSize: 20),
                  //   textAlign: TextAlign.right,
                ),
                child: Image.asset(item["url"], fit: BoxFit.fill),
              );
            }).toList(),
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            'Well Come',
            style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w700,
                fontStyle: FontStyle.italic),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 20,
          ),
          SingleChildScrollView(
            child: Container(
              // color: Colors.grey,
              child: SizedBox(
                  width: Get.width * .95,
                  child: SingleChildScrollView(
                    child: announcements.length > 0
                        ? Container(
                            height: Get.height * .15,
                            child: ListView.builder(
                              itemCount: announcements.length,
                              itemBuilder: (context, index) {
                                return Container(
                                  padding: const EdgeInsets.all(5.0),
                                  child: AnnouncementItem(
                                      announcements[index].title.toString(),
                                      announcements[index]
                                          .dateCreated
                                          .toString(),
                                      announcements[index]
                                          .description
                                          .toString()),
                                );
                              },
                            )
                            // Column(
                            //   children: [
                            // announcementItem('title', 'date',
                            //     'This is description and we expect it to be long'),
                            //   ],
                            // ),
                            )
                        : Center(child: Text('No annoucments')),
                  )),
            ),
          )
        ],
      ),
    );
  }

  Widget AnnouncementItem(title, date, description) {
    return Container(
      height: 400,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(20),
        // color: Colors.green,
      ),
      child: Column(
        children: [
          Row(
            // mainAxisAlignment: MainAxisAlignment.space-between,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              // Widget
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: Container(
                    child: Text(title,
                        style: TextStyle(
                          fontSize: 20,
                        ))),
              ),

              // Widget 2

              Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 15, 0),
                child: Container(child: Text(date)),
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Text(description),
        ],
      ),
    );
  }

  Widget announcementItem(title, date, description) {
    return Container(
      height: 20,
      // decoration: BoxDecoration(
      //   border: Border.all(
      //     color: Colors.black,
      //     width: 1,
      //   ),
      //   borderRadius: BorderRadius.circular(20),
      // ),
      child: Column(children: [
        Row(
          // mainAxisAlignment: MainAxisAlignment.space-between,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            // Widget
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
              child: Container(
                  child: Text(title,
                      style: TextStyle(
                        fontSize: 20,
                      ))),
            ),

            // Widget 2

            Padding(
              padding: const EdgeInsets.fromLTRB(0, 20, 20, 10),
              child: Container(child: Text(date)),
            ),
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        Text(description)
      ]),
    );
  }

  ListTile _title(String title, String date) {
    return ListTile(
      title: Text(title,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 20,
          )),
      // subtitle: Text(subtitle),
      leading: Text(
        date,
        // color: Colors.blue[500],
      ),
    );
  }
}
