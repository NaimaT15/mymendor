import 'dart:async';
import 'package:flutter/material.dart';
import 'package:mymendorr/sliderimage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late Animation<double> topCircelAnimation;
  late Animation<double> bottomCircelAnimation;
  late Animation<double> logoAnimation;
  late AnimationController controller;
  String connectionStatus = 'Unknown';
  bool isConnectionExist = false;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: const Duration(seconds: 3), vsync: this);
    topCircelAnimation = Tween<double>(begin: 0, end: 200).animate(controller)
      ..addListener(() {
        setState(() {});
      });

    bottomCircelAnimation = Tween<double>(begin: 0, end: 350)
        .animate(controller)
      ..addListener(() {});

    logoAnimation = Tween<double>(begin: 0, end: 1).animate(controller)
      ..addListener(() {});
    controller.forward();

    Timer(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (BuildContext context) => const HomePage(),
        ),
      );
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        body: Container(
          width: width,
          height: height,
          color: const Color(0xFF0C3B2E),
          padding: EdgeInsets.only(
            top: width * 0.38,
          ),
          child: const Column(
            children: [
              CircleAvatar(
                backgroundImage: AssetImage("assets/images/slider1.jpg"),
                radius: 120,
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                'My Mendor',
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 45,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  goToMainPage() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (ctx) => const HomePage(),
      ),
    );
  }
}
