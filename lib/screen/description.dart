import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../handler/api_filehandler.dart';
import '../widgets/drawer.dart';

class Description extends StatefulWidget {
  final text;
  const Description({super.key, required this.text});

  @override
  State<Description> createState() => _DescriptionState();
}

class _DescriptionState extends State<Description> {
  bool loading = false;
  String description = "";
  @override
  initState() {
    super.initState();
    loadServices();
  }

  loadServices() async {
    setState(() {
      loading = true;
    });
    print("Loading description");
    var response = await getDescription(widget.text);
    description =
        "ksjflas lsfjalsj dflkdasj flkas jflks dflka sjklfj lkasj flas f";
    setState(() {
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(title: Text('Requirement Detail')),
          backgroundColor: const Color(0xFF0C3B2E),
          drawer: const CommonDrawer(),
          body: SizedBox(
              width: Get.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: Get.width * 0.9,
                    child: Text(
                      widget.text,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 48,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  SizedBox(height: 50),
                  ListTile(title: Text("required the following objects")),
                  SizedBox(height: 20),
                  ListTile(title: Text("take your ID with you.")),
                  SizedBox(height: 20),
                  ListTile(title: Text("you must have no debt.")),
                  SizedBox(height: 20),
                  ListTile(title: Text("you must have appointment."))
                ],
              ))),
    );
  }
}
