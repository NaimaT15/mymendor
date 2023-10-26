import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mymendorr/handler/service.dart';
import 'package:mymendorr/model/department.dart';
import 'package:mymendorr/screen/form/feedback.dart';
import 'package:mymendorr/screen/form/login.dart';
import 'package:mymendorr/screen/form/register.dart';
import 'package:mymendorr/screen/requirment.dart';
import '../forms/id_form.dart';
import '../model/service.dart';
import '../screen/form/bid.dart';
import '../screen/form/id.dart';
import '../screen/form/schedule.dart';

class CommonDrawer extends StatefulWidget {
  const CommonDrawer({Key? key}) : super(key: key);

  @override
  State<CommonDrawer> createState() => _CommonDrawerState();
}

class _CommonDrawerState extends State<CommonDrawer> {
  bool isLoggedUser() {
    var isLogged = isUserLoggedIn();
    return isLogged;
    // return true;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color(0xFF0C3B2E),
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
                  color: const Color.fromARGB(255, 0, 0, 0),
                  borderRadius: BorderRadius.circular(100),
                  image: const DecorationImage(
                      image: AssetImage("assets/images/profile.jpg"),
                      fit: BoxFit.cover)),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home, color: Colors.white),
            title: const Text(
              "Home",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.history, color: Colors.white),
            title: const Text(
              "Requirment",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Requirement()),
              );
            },
          ),
          isLoggedUser()
              ? ListTile(
                  leading: const Icon(Icons.share, color: Colors.white),
                  title: const Text(
                    "Schedule Appointment",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ScheduleFormPage()),
                    );
                  },
                )
              : Container(),
          !isLoggedUser()
              ? ListTile(
                  leading: const Icon(Icons.share, color: Colors.white),
                  title: const Text(
                    "Start New ID Application ",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const IDForm()),
                    );
                  },
                )
              : Container(),
          !isLoggedUser()
              ? ListTile(
                  leading: const Icon(Icons.add, color: Colors.white),
                  title: const Text(
                    "Registor",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const RegisterPage()),
                    );
                  },
                )
              : Container(),
          ListTile(
            leading: const Icon(Icons.feedback, color: Colors.white),
            title: const Text(
              "Feedback",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const FeedbackPage()),
              );
            },
          ),
          !isLoggedUser()
              ? ListTile(
                  leading: const Icon(Icons.login, color: Colors.white),
                  title: const Text(
                    "Login",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginPage()),
                    );
                  },
                )
              : Container(),
          isLoggedUser()
              ? ListTile(
                  leading: const Icon(Icons.login, color: Colors.white),
                  title: const Text(
                    "Bid",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const BidFormPage()),
                    );
                  },
                )
              : Container(),
          isLoggedUser()
              ? ListTile(
                  leading: const Icon(Icons.logout, color: Colors.white),
                  title: const Text(
                    "Log out",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  onTap: () {
                    logout();
                    showSnackBar(context, "logged out successfully");
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => const LoginPage()),
                    // );
                  },
                )
              : Container(),
        ],
      ),
    );
  }

  void showSnackBar(BuildContext context, String text) {
    try {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
          text,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w300,
          ),
        ),
      ));
    } catch (error) {
      error.toString();
    }
  }
}
