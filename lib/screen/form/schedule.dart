import 'package:flutter/material.dart';
import 'package:mymendorr/forms/schedule_form.dart';
import 'package:mymendorr/widgets/drawer.dart';

class ScheduleFormPage extends StatefulWidget {
  const ScheduleFormPage({super.key, s});
  @override
  State<ScheduleFormPage> createState() => _ScheduleFormPageState();
}

class _ScheduleFormPageState extends State<ScheduleFormPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      drawer: CommonDrawer(),
      body: ScheduleAppointmentForm(),
    );
  }
}
