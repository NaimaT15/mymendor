import 'dart:io';

import 'package:flutter/material.dart';
import 'package:mymendorr/forms/id_form.dart';
import 'package:mymendorr/forms/register_form.dart';
import 'package:mymendorr/widgets/drawer.dart';

import '../../forms/login_form.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      drawer: CommonDrawer(),
      body: RegisterForm(),
    );
  }
}
