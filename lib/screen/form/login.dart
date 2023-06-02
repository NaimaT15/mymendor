import 'dart:io';

import 'package:flutter/material.dart';
import 'package:mymendorr/forms/id_form.dart';
import 'package:mymendorr/widgets/drawer.dart';

import '../../forms/login_form.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CommonDrawer(
        isLoggedUser: false,
      ),
      body: LoginForm(),
    );
  }
}
