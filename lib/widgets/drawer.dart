import 'package:flutter/material.dart';
import 'package:mymendorr/screen/form/login.dart';
import '../forms/id_form.dart';
import '../screen/form/example.dart';
import '../screen/form/id.dart';
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
                MaterialPageRoute(builder: (context) => ExampleFormPage()),
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
            title: const Text("Start New ID Application "),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomeMaterial()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.contact_page),
            title: const Text("Registor"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => signupPage()),
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
