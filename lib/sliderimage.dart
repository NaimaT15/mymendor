import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
import 'package:mymendorr/screen/login.dart';
import 'package:mymendorr/screen/schedluapp.dart';
import 'package:mymendorr/screen/signup.dart';
import 'package:mymendorr/widgets/drawer.dart';
import 'package:mymendorr/widgets/main_screen_card.dart';

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
  // a list of images' URLs
  int heightToBeReduced = 400;
  final List data = [
    {
      //"title": "Image 1",
      "url":
          "http://www.ethiopianproperties.com/wp-content/uploads/2016/01/DSC05392.jpg"
    },
    {
      //"title": "Image 2",
      "url":
          "http://www.ethiopianproperties.com/wp-content/uploads/2016/01/DSC05392.jpg"
    },
    {
      //"title": "Image 3",
      "url":
          "http://www.ethiopianproperties.com/wp-content/uploads/2016/01/DSC05392.jpg"
    },
    {
      //"title": "Image 4",
      "url":
          "http://www.ethiopianproperties.com/wp-content/uploads/2016/01/DSC05392.jpg"
    },
    {
      // "title": "Image 5",
      "url":
          "http://www.ethiopianproperties.com/wp-content/uploads/2016/01/DSC05392.jpg"
    },
    {
      //"title": "Image 6",
      "url":
          "http://www.ethiopianproperties.com/wp-content/uploads/2016/01/DSC05392.jpg"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('mymendor'),
      ),
      drawer: const CommonDrawer(
        isLoggedUser: false,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // Implement the image carousel
          CarouselSlider(
            options: CarouselOptions(
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 2),
              autoPlayAnimationDuration: const Duration(milliseconds: 400),
              height: 200,
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
                child: Image.network(item["url"], fit: BoxFit.fill),
              );
            }).toList(),
          ),
          const SizedBox(height: 30),
          const Text(
            'Well Come',
            style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w700,
                fontStyle: FontStyle.italic),
            textAlign: TextAlign.center,
          ),

          SingleChildScrollView(
            child: SizedBox(
                width: Get.width * .95,
                height: Get.height * .30,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      MainScreenCard(
                        imageUrl: 'assets/images/profile.jpg',
                        title: 'Start New Bid Application',
                        description:
                            "Lorem ipsum is placeholder text commonly used in the graphic, print, and publishing",
                        backgroundColor: Colors.blue[300],
                        openScreenName: 'bid-form',
                      ),
                      MainScreenCard(
                        imageUrl: 'assets/images/profile.jpg',
                        title: 'Start New ID Application',
                        description:
                            "Lorem ipsum is placeholder text commonly used in the graphic, print, and publishing",
                        backgroundColor: Colors.deepPurple[300],
                        openScreenName: 'id-form',
                      ),
                      MainScreenCard(
                        imageUrl: 'assets/images/profile.jpg',
                        title: 'Example Form',
                        description:
                            "Lorem ipsum is placeholder text commonly used in the graphic, print, and publishing",
                        backgroundColor: Colors.green[300],
                        openScreenName: 'example-form',
                      ),
                      const MainScreenCard(
                        imageUrl: 'assets/images/profile.jpg',
                        title: 'Register',
                        description:
                            "Lorem ipsum is placeholder text commonly used in the graphic, print, and publishing",
                      ),
                      const MainScreenCard(
                        imageUrl: 'assets/images/profile.jpg',
                        title: 'Check Status',
                        description:
                            "Lorem ipsum is placeholder text commonly used in the graphic, print, and publishing",
                      )
                    ],
                  ),
                )),
          )
        ],
      ),
    );
  }
}
