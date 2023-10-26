import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../handler/api_filehandler.dart';
import '../handler/service.dart';
import '../model/service.dart';

class ScheduleAppointmentFormBloc extends FormBloc<String, String> {
  final service = SelectFieldBloc(
    items: ['Option 1', 'Option 2'],
    validators: [FieldBlocValidators.required],
  );
  final department = SelectFieldBloc(
    items: ['Option 1', 'Option 2'],
    validators: [FieldBlocValidators.required],
  );
  List<Service> listModel = [];
  final date = InputFieldBloc<DateTime?, Object>(initialValue: null);
  final serviceField = SelectFieldBloc<Map<String, dynamic>, dynamic>(
    name: 'service',
    validators: [FieldBlocValidators.required],
  );
  ScheduleAppointmentFormBloc() : super(autoValidate: false) {
    addFieldBlocs(fieldBlocs: [date, service, department]);
    var services = getServices();
    var departments = getDepartments();
    service.updateItems(services);
    department.updateItems(departments);
  }

  List<String> getServices() {
    var value = getServicesFromLocalStorage();
    final List<dynamic> parsed = json.decode(value.toString());
    List<String> myfinal = [];
    for (var ele in parsed) {
      myfinal.add(ele['name']);
    }
    return myfinal;
  }

  List<String> getDepartments() {
    var value = getDepartmentFromLocalStorage();
    final List<dynamic> parsed = json.decode(value.toString());
    List<String> myfinal = [];
    for (var ele in parsed) {
      myfinal.add(ele['name']);
    }
    return myfinal;
  }

  void addErrors() {
    date.addFieldError('Date required');
    service.addFieldError('Service Required!');
  }

  @override
  void onSubmitting() async {
    final data = {
      "title": service.value,
      "Description": date.value,
    };
    emitSuccess(successResponse: jsonEncode(data));
  }
}

class ScheduleAppointmentForm extends StatefulWidget {
  const ScheduleAppointmentForm({super.key});

  @override
  State<ScheduleAppointmentForm> createState() =>
      _ScheduleAppointmentFormState();
}

getServiceId(name) {
  var value = getServicesFromLocalStorage();
  final List<dynamic> parsed = json.decode(value.toString());

  for (var ele in parsed) {
    if (name == ele['name']) {
      return ele['ID'];
    }
  }
  return 0;
}

getDepartmentId(name) {
  var value = getDepartmentFromLocalStorage();
  final List<dynamic> parsed = json.decode(value.toString());

  for (var ele in parsed) {
    if (name == ele['name']) {
      return ele['ID'];
    }
  }
  return 0;
}

class _ScheduleAppointmentFormState extends State<ScheduleAppointmentForm> {
  bool loading = false;
  String message = "";
  @override
  Widget build(BuildContext context) {
    final buildContextBuild = context;

    return BlocProvider(
      create: (context) => ScheduleAppointmentFormBloc(),
      child: Builder(
        builder: (context) {
          final formBloc = context.read<ScheduleAppointmentFormBloc>();
          return ModalProgressHUD(
            inAsyncCall: loading,
            child: Scaffold(
              // appBar:
              //     AppBar(title: const Text('Fill Schedule Appointment Form')),
              body: Container(
                height: Get.height,
                child: Stack(
                  children: <Widget>[
                    // Positioned(
                    //   top: -MediaQuery.of(context).size.height * .15,
                    //   right: -MediaQuery.of(context).size.width * .4,
                    //   child: BezierContainer(),
                    // ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            SizedBox(height: Get.height * .2),
                            _title(),
                            // LoginForm(),

                            // const SizedBox(
                            //   height: 50,
                            // ),
                            Container(
                              height: 400,
                              alignment: Alignment.topLeft,
                              child: FormBlocListener<
                                  ScheduleAppointmentFormBloc, String, String>(
                                onSubmitting: (context, state) async {
                                  setState(() {
                                    loading = true;
                                    message = "";
                                  });
                                  var serviceId =
                                      getServiceId(formBloc.service.value);
                                  var departmentId = getDepartmentId(
                                      formBloc.department.value);
                                  var newFormatteddate = formBloc.date.value
                                      .toString()
                                      .substring(0, 10);

                                  var body = {
                                    "service_ID": serviceId,
                                    "app_date": newFormatteddate,
                                    "dep_ID": departmentId
                                  };
                                  final response =
                                      await submitAppointment(jsonEncode(body));
                                  if (response.data != null) {
                                    showSnackBar(buildContextBuild,
                                        "Successfully registered");
                                  } else {
                                    message =
                                        ("There is an error in the feedback submission. Please try again");
                                    showSnackBar(buildContextBuild,
                                        "There is an error in the feedback submission. Please try again");
                                  }
                                  setState(() {
                                    loading = false;
                                  });
                                },
                                onSuccess: (context, state) {
                                  print(state.successResponse);
                                },
                                onFailure: (context, state) {},
                                child: SingleChildScrollView(
                                  physics: const ClampingScrollPhysics(),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 24.0, vertical: 8),
                                    child: Column(
                                      children: <Widget>[
                                        DropdownFieldBlocBuilder<String>(
                                          selectFieldBloc: formBloc.service,
                                          decoration: const InputDecoration(
                                            labelText: 'Choose service',
                                          ),
                                          itemBuilder: (context, value) =>
                                              FieldItem(
                                            child: Text(value),
                                          ),
                                        ),
                                        DropdownFieldBlocBuilder<String>(
                                          selectFieldBloc: formBloc.department,
                                          decoration: const InputDecoration(
                                            labelText: 'Choose Department',
                                          ),
                                          itemBuilder: (context, value) =>
                                              FieldItem(
                                            child: Text(value),
                                          ),
                                        ),
                                        DateTimeFieldBlocBuilder(
                                          dateTimeFieldBloc: formBloc.date,
                                          format: DateFormat('yyyy-mm-dd'),
                                          initialDate: DateTime.now(),
                                          firstDate: DateTime.now(),
                                          lastDate: DateTime.now()
                                              .add(Duration(days: 365)),
                                          // selectableDayPredicate: _excludeWeekends,
                                          decoration: const InputDecoration(
                                            labelText:
                                                'DateTimeFieldBlocBuilder',
                                            prefixIcon:
                                                Icon(Icons.calendar_today),
                                            helperText: 'Date',
                                          ),
                                        ),
                                        const SizedBox(height: 16),
                                        message.isNotEmpty
                                            ? Container(
                                                margin:
                                                    const EdgeInsets.all(10),
                                                child: Text(
                                                  message,
                                                  style: const TextStyle(
                                                    color: Colors.red,
                                                    fontSize: 13,
                                                  ),
                                                ),
                                              )
                                            : Container(),
                                        GestureDetector(
                                          onTap: formBloc.submit,
                                          child: Container(
                                              width: Get.width * 9,
                                              padding: const EdgeInsets.only(
                                                top: 10,
                                                bottom: 10,
                                              ),
                                              decoration: BoxDecoration(
                                                color: const Color(0xFF0C3B2E),
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                              ),
                                              child: const Text(
                                                'Submit',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  fontSize: 21,
                                                  fontWeight: FontWeight.w300,
                                                  color: Colors.white,
                                                ),
                                              )),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(top: 40, left: 0, child: _backButton()),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  bool _excludeWeekends(DateTime day) {
    // Exclude weekends (Saturday and Sunday)
    return day.weekday != DateTime.saturday && day.weekday != DateTime.sunday;
  }

  Widget _title() {
    return RichText(
      textAlign: TextAlign.center,
      text: const TextSpan(
          text: 'Schedule',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w700,
            color: const Color(0xFF0C3B2E),
          ),
          children: [
            TextSpan(text: ' '),
            TextSpan(
              text: 'AppointMent',
              style: TextStyle(color: Colors.black, fontSize: 30),
            ),
            TextSpan(text: ' '),
            TextSpan(
              text: 'Form',
              style: TextStyle(color: const Color(0xFF0C3B2E), fontSize: 30),
            ),
          ]),
    );
  }

  Widget _backButton() {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.only(left: 0, top: 10, bottom: 10),
              child: const Icon(Icons.keyboard_arrow_left, color: Colors.black),
            ),
            const Text('Back',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500))
          ],
        ),
      ),
    );
  }

  void showSnackBar(BuildContext context, String text) {
    try {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
          text,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w300,
          ),
        ),
      ));
    } catch (error) {
      error.toString();
    }
  }
}
