import 'dart:io';

import 'package:flutter/material.dart';
import 'package:mymendorr/forms/example_form.dart';
import 'package:mymendorr/forms/feedback_form.dart';
import 'package:mymendorr/forms/schedule_form.dart';
import 'package:mymendorr/widgets/drawer.dart';

class FeedbackPage extends StatefulWidget {
  const FeedbackPage({super.key});

  @override
  State<FeedbackPage> createState() => _FeedbackPageState();
}

class _FeedbackPageState extends State<FeedbackPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      drawer: CommonDrawer(),
      body: Feedbackform(),
    );
  }
}
