import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:mymendorr/screen/login.dart';
import 'package:mymendorr/screen/schedluapp.dart';
import 'package:mymendorr/screen/signup.dart';

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
      "title": "Image 1",
      "url": "https://www.kindacode.com/wp-content/uploads/2022/07/bottle.jpeg"
    },
    {
      "title": "Image 2",
      "url":
          "https://www.kindacode.com/wp-content/uploads/2022/07/flower-4.jpeg"
    },
    {
      "title": "Image 3",
      "url":
          "https://www.kindacode.com/wp-content/uploads/2022/07/flower-3.jpeg"
    },
    {
      "title": "Image 4",
      "url":
          "https://www.kindacode.com/wp-content/uploads/2022/07/flower-1.jpeg"
    },
    {
      "title": "Image 5",
      "url":
          "https://cdn.pixabay.com/photo/2020/04/19/12/26/thread-5063401_960_720.jpg"
    },
    {
      "title": "Image 6",
      "url":
          "https://www.kindacode.com/wp-content/uploads/2022/07/flower-2.jpeg"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('mymendor'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.all(8.0),
          children: [
            UserAccountsDrawerHeader(
              accountName: Text("Naima Tilahu"),
              accountEmail: Text("naim@t"),
              currentAccountPicture: Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(100),
                    image: DecorationImage(
                        image: AssetImage("assets/photo_large.jpg"),
                        fit: BoxFit.cover)),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text("Home"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.history),
              title: Text("Requirment"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomeMaterial()),
                );
              },
            ),
            ExpansionTile(
              title: Text('Schedule A ppointment'),
              leading: Icon(Icons.view_list),
              children: <Widget>[
                GestureDetector(
                  child: SizedBox(
                      width: 250,
                      height: 35,
                      child: Container(
                          decoration: BoxDecoration(
                            color: Colors.black26,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: const Card(
                              child: Center(child: Text("nigd fikad"))))),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomeMaterial()),
                    );
                  },
                ),
                const SizedBox(
                  height: 7,
                ),
                GestureDetector(
                  child: SizedBox(
                      width: 250,
                      height: 35,
                      child: Container(
                          decoration: BoxDecoration(
                            color: Colors.black26,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: const Card(
                              child: Center(child: Text("ginbata fikad."))))),
                  onTap: () {},
                ),
                const SizedBox(
                  height: 7,
                ),
                GestureDetector(
                  child: SizedBox(
                      width: 250,
                      height: 35,
                      child: Container(
                          decoration: BoxDecoration(
                            color: Colors.black26,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: const Card(
                              child: Center(child: Text("wetat ina sport."))))),
                  onTap: () {},
                ),
                const SizedBox(
                  height: 7,
                ),
                GestureDetector(
                  child: SizedBox(
                      width: 250,
                      height: 40,
                      child: Container(
                          decoration: BoxDecoration(
                            color: Colors.black26,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: const Card(
                              child: Center(child: Text("Arso Ader."))))),
                  onTap: () {},
                ),
                const SizedBox(
                  height: 7,
                ),
                GestureDetector(
                  child: SizedBox(
                      width: 250,
                      height: 35,
                      child: Container(
                          decoration: BoxDecoration(
                            color: Colors.black26,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: const Card(
                              child: Center(child: Text("Betoch & Limat"))))),
                  onTap: () {},
                ),
                const SizedBox(
                  height: 7,
                ),
                GestureDetector(
                  child: SizedBox(
                      width: 250,
                      height: 35,
                      child: Container(
                          decoration: BoxDecoration(
                            color: Colors.black26,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Card(
                              child: Center(child: Text("Betoch & Limat."))))),
                  onTap: () {},
                ),
                SizedBox(
                  height: 7,
                ),
                GestureDetector(
                  child: SizedBox(
                      width: 250,
                      height: 35,
                      child: Container(
                          decoration: BoxDecoration(
                            color: Colors.black26,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Card(
                              child: Center(child: Text("Betoch & Limat."))))),
                  onTap: () {},
                ),
                SizedBox(
                  height: 7,
                ),
                GestureDetector(
                  child: SizedBox(
                      width: 250,
                      height: 35,
                      child: Container(
                          decoration: BoxDecoration(
                            color: Colors.black26,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Card(
                              child: Center(child: Text("Betoch & Limat"))))),
                  onTap: () {},
                ),
              ],
            ),
            ListTile(
              leading: const Icon(Icons.share),
              title: const Text("Announcement"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.contact_page),
              title: Text("Registor"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignUpPage()),
                );
              },
            )
          ],
        ),
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
                    color: Colors.black54,
                    child: Text(
                      item["title"],
                      style: const TextStyle(color: Colors.white, fontSize: 20),
                      textAlign: TextAlign.right,
                    )),
                child: Image.network(item["url"], fit: BoxFit.contain),
              );
            }).toList(),
          ),
          const SizedBox(height: 30),
          const Text(
            'Well Come',
            style: TextStyle(
              fontSize: 24,
            ),
            textAlign: TextAlign.center,
          ),

          SizedBox(
            height: MediaQuery.of(context).size.height - heightToBeReduced,
            child: ListView(
              scrollDirection: Axis.vertical,
              children: [
                const Card(
                    child: ListTile(
                  title: Text("List Item 1"),
                )),
                Card(
                  child: ListTile(
                    // ignore: prefer_const_constructors
                    title: Text("List Item 2"),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                // ignore: prefer_const_constructors
                SizedBox(
                  child: const Card(
                      child: ListTile(
                    title: Text(
                        "science, history, and just about anything that was put in front of us. We were a sponge with no preconceived notions about the world."),
                  )),
                ),
              ],
              shrinkWrap: true,
              reverse: true,
              padding: EdgeInsets.all(10),
              itemExtent: 90,
            ),
          ),
        ],
      ),
    );
  }
}
