import 'package:flutter/material.dart';
import 'package:mymendorr/screen/bid.dart';
import 'package:mymendorr/forms/bid_form.dart';
import 'package:mymendorr/screen/login.dart';
import '../screen/schedluapp.dart';
import '../screen/signup.dart';

class CommonDrawer extends StatefulWidget {
  final isLoggedUser = false;

  const CommonDrawer({Key? key, required bool isLoggedUser}) : super(key: key);

  @override
  State<CommonDrawer> createState() => _CommonDrawerState();
}

class _CommonDrawerState extends State<CommonDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: const EdgeInsets.all(8.0),
        children: [
          UserAccountsDrawerHeader(
            accountName: const Text("Naima Tilahu"),
            accountEmail: const Text("naim@t"),
            currentAccountPicture: Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(100),
                  image: const DecorationImage(
                      image: AssetImage("assets/images/profile.jpg"),
                      fit: BoxFit.cover)),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text("Home"),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.history),
            title: const Text("Requirment"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomeMaterial()),
              );
            },
          ),
          widget.isLoggedUser
              ? ExpansionTile(
                  title: const Text('Schedule A ppointment'),
                  leading: const Icon(Icons.view_list),
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
                          MaterialPageRoute(
                              builder: (context) => HomeMaterial()),
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
                                  child:
                                      Center(child: Text("ginbata fikad."))))),
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
                                  child: Center(
                                      child: Text("wetat ina sport."))))),
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
                                  child:
                                      Center(child: Text("Betoch & Limat"))))),
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
                                  child:
                                      Center(child: Text("Betoch & Limat."))))),
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
                                  child:
                                      Center(child: Text("Betoch & Limat."))))),
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
                                  child:
                                      Center(child: Text("Betoch & Limat"))))),
                      onTap: () {},
                    ),
                  ],
                )
              : Container(),
          ListTile(
            leading: const Icon(Icons.share),
            title: const Text("Announcement"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const BidFormPage()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.contact_page),
            title: const Text("Registor"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SignUpPage()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.contact_page),
            title: const Text("Login"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const LoginPage()),
              );
            },
          )
        ],
      ),
    );
  }
}
