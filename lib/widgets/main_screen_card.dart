import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mymendorr/forms/bid_form.dart';
import 'package:mymendorr/forms/id_form.dart';
import 'package:mymendorr/sliderimage.dart';

import '../forms/example_form.dart';

class MainScreenCard extends StatelessWidget {
  final imageUrl;
  final title;
  final description;
  final backgroundColor;
  final openScreenName;
  const MainScreenCard({
    super.key,
    this.imageUrl,
    this.title,
    this.description,
    this.backgroundColor = Colors.grey,
    this.openScreenName = "main",
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {
        if (openScreenName == "main")
          {
            //here goes screen that should be called
          }
        else if (openScreenName == "bid-form")
          {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => BidForm()),
            )
          }
        else if (openScreenName == "id-form")
          {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => IDForm()),
            )
          }
        else if (openScreenName == "example-form")
          {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const AllFieldsForm()),
            )
          }
      },
      child: Container(
        margin: const EdgeInsets.only(top: 5, bottom: 5),
        width: Get.width,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          color: backgroundColor,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 50,
              height: 50,
              margin: const EdgeInsets.only(top: 5),
              child: Image.asset(imageUrl),
            ),
            Container(
              margin: const EdgeInsets.only(
                top: 15,
              ),
              child: Text(
                title,
                style:
                    const TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
              ),
            ),
            Container(
              width: Get.width * 0.9,
              margin: const EdgeInsets.only(
                bottom: 15,
                top: 15,
              ),
              child: Text(
                description,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
