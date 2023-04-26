import 'package:flutter/material.dart';

class MyContainerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            title: Text("mymendor"),
            leading: const Padding(
              padding: EdgeInsets.only(left: 1.0),
            ),
            backgroundColor: Colors.green,
          ),
          body: Column(
            children: [
              Container(
                width: double.infinity,
                height: 110.0,
                decoration: BoxDecoration(
                  border: Border.all(
                      color: Colors.black38,
                      width: 1.0,
                      style: BorderStyle.solid),
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.white,
                ),
                margin: const EdgeInsets.all(15),
                padding: const EdgeInsets.all(20),
                alignment: Alignment.center,
                transform: Matrix4.rotationZ(0),
                child: const Column(
                  // ignore: prefer_const_literals_to_create_immutables
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    Text("Packages", style: TextStyle(fontSize: 15)),
                    Text("Round 3", style: TextStyle(fontSize: 15)),
                    Text("15000", style: TextStyle(fontSize: 15)),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                height: 110.0,
                decoration: BoxDecoration(
                  border: Border.all(
                      color: Colors.black38,
                      width: 1.0,
                      style: BorderStyle.solid),
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.white,
                ),
                margin: const EdgeInsets.all(15),
                padding: const EdgeInsets.all(20),
                alignment: Alignment.center,
                transform: Matrix4.rotationZ(0),
                child: const Column(
                  // ignore: prefer_const_literals_to_create_immutables
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    Text("Packages", style: TextStyle(fontSize: 15)),
                    Text("Round 3", style: TextStyle(fontSize: 15)),
                    Text("15000", style: TextStyle(fontSize: 15)),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                height: 110.0,
                decoration: BoxDecoration(
                  border: Border.all(
                      color: Colors.black38,
                      width: 1.0,
                      style: BorderStyle.solid),
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.white,
                ),
                margin: const EdgeInsets.all(15),
                padding: const EdgeInsets.all(20),
                alignment: Alignment.center,
                transform: Matrix4.rotationZ(0),
                child: const Column(
                  // ignore: prefer_const_literals_to_create_immutables
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    Text("Packages", style: TextStyle(fontSize: 15)),
                    Text("Round 3", style: TextStyle(fontSize: 15)),
                    Text("15000", style: TextStyle(fontSize: 15)),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
