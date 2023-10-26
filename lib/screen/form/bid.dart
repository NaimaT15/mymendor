import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:mymendorr/forms/bid_form.dart';
import 'package:mymendorr/widgets/drawer.dart';

class BidFormPage extends StatefulWidget {
  const BidFormPage({super.key});

  @override
  State<BidFormPage> createState() => _BidFormPageState();
}

class _BidFormPageState extends State<BidFormPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CommonDrawer(),
      body: PaymentForm(),
    );
  }
}
