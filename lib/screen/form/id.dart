import 'dart:io';

import 'package:flutter/material.dart';
import 'package:mymendorr/forms/id_form.dart';
import 'package:mymendorr/widgets/drawer.dart';

class IDFormPage extends StatefulWidget {
  const IDFormPage({super.key});

  @override
  State<IDFormPage> createState() => _IDFormPageState();
}

class _IDFormPageState extends State<IDFormPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CommonDrawer(),
      body: IDForm(),
    );
  }
}
