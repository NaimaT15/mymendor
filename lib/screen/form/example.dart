import 'dart:io';

import 'package:flutter/material.dart';
import 'package:mymendorr/forms/example_form.dart';
import 'package:mymendorr/widgets/drawer.dart';

class ExampleFormPage extends StatefulWidget {
  const ExampleFormPage({super.key});

  @override
  State<ExampleFormPage> createState() => _ExampleFormPageState();
}

class _ExampleFormPageState extends State<ExampleFormPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CommonDrawer(),
      body: const AllFieldsForm(),
    );
  }
}
