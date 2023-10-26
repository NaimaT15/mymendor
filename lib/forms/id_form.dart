import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:mymendorr/handler/service.dart';
import 'package:mymendorr/sliderimage.dart';

import '../handler/api_filehandler.dart';

class IDFormBloc extends FormBloc<String, String> {
  final ID = TextFieldBloc(
    validators: [
      FieldBlocValidators.required,
    ],
  );
  final firstName = TextFieldBloc();
  final lastName = TextFieldBloc();
  final date = InputFieldBloc<DateTime?, Object>(initialValue: null);

  IDFormBloc() {
    addFieldBlocs(
      fieldBlocs: [date, lastName, firstName],
    );
  }

  @override
  void onSubmitting() async {
    final data = {
      "date": date.value,
      "firstName": firstName.value,
      "lastName": lastName.value
    };
    emitSuccess(successResponse: jsonEncode(data));
  }
}

class IDForm extends StatefulWidget {
  const IDForm({super.key});

  @override
  State<IDForm> createState() => _IDFormState();
}

class _IDFormState extends State<IDForm> {
  bool loading = false;
  String message = "";
  // @override
  // Widget build(BuildContext context) {
  //   return BlocProvider(
  //     create: (context) => IDFormBloc(),
  //     child: Builder(
  //       builder: (context) {
  //         final formBloc = context.read<IDFormBloc>();
  //         return ModalProgressHUD(
  //           inAsyncCall: loading,
  //           child: Scaffold(
  //             appBar: AppBar(title: const Text('Fill Register Form')),
  //             body:  ),
  //         );
  //       },
  //     ),
  //   );
  // }

  Widget _title() {
    return RichText(
      textAlign: TextAlign.center,
      text: const TextSpan(
          text: 'ID ',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w700,
            color: const Color(0xFF0C3B2E),
          ),
          children: [
            TextSpan(
              text: ' Form ',
              style: TextStyle(color: Colors.black, fontSize: 30),
            ),
            // TextSpan(
            //   text: 'up',
            //   style: TextStyle(color: const Color(0xFF0C3B2E), fontSize: 30),
            // ),
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

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final buildContextBuild = context;

    return BlocProvider(
        create: (context) => IDFormBloc(),
        child: Builder(builder: (context) {
          final formBloc = context.read<IDFormBloc>();
          return ModalProgressHUD(
              inAsyncCall: loading,
              child: Scaffold(
                body: Container(
                  height: height,
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
                              SizedBox(height: height * .12),
                              _title(),
                              // LoginForm(),

                              // const SizedBox(
                              //   height: 50,
                              // ),
                              Container(
                                height: Get.height * .7,
                                alignment: Alignment.topLeft,
                                child: FormBlocListener<IDFormBloc, String,
                                    String>(
                                  onSubmitting: (context, state) async {
                                    setState(() {
                                      loading = true;
                                      message = "";
                                    });
                                    if (!state.isValid()) {
                                      setState(() {
                                        loading = false;
                                        message = "Please fill the form";
                                      });
                                      return;
                                    }
                                    try {
                                      var newFormatteddate = formBloc.date.value
                                          .toString()
                                          .substring(0, 10);

                                      var body = {
                                        "first_name": formBloc.firstName.value,
                                        "last_name": formBloc.lastName.value,
                                        "app_date": newFormatteddate,
                                      };

                                      final registerRespones =
                                          await submitIdForm(jsonEncode(body));
                                      print("response : " +
                                          registerRespones.toString());
                                      var tempArray = [
                                        "Your appointment is received and pending."
                                      ];

                                      if (tempArray.toString() ==
                                          registerRespones.toString()) {
                                        setLoggedInUser(
                                            registerRespones.toString());
                                        message = "Successfully submitted";
                                        // ignore: use_build_context_synchronously
                                        showSnackBar(buildContextBuild,
                                            "Successfully submitted");

                                        // Get.to(() => HomePage());
                                      } else {
                                        // ignore: use_build_buildContextBuild_synchronously
                                        showSnackBar(buildContextBuild,
                                            "There is an error in the Id form submission");
                                        message =
                                            ("There is an error in the Id form submission");
                                      }

                                      setState(() {
                                        loading = false;
                                      });
                                    } catch (er) {
                                      print("er : " + er.toString());
                                      setState(() {
                                        loading = false;
                                        message =
                                            "There was an error in the ID form submission";
                                      });
                                      showSnackBar(buildContextBuild, message);
                                    }
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
                                          TextFieldBlocBuilder(
                                            textFieldBloc: formBloc.firstName,
                                            // suffixButton: SuffixButton.obscureText,
                                            decoration: const InputDecoration(
                                                labelText: 'First Name',
                                                hintText:
                                                    'Enter your First Name'),
                                          ),
                                          TextFieldBlocBuilder(
                                            textFieldBloc: formBloc.lastName,
                                            // suffixButton: SuffixButton.obscureText,
                                            decoration: const InputDecoration(
                                                labelText: 'Last Name',
                                                hintText:
                                                    'Enter your Last Name'),
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
                                                  color:
                                                      const Color(0xFF0C3B2E),
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

                              // _submitButton(),
                            ],
                          ),
                        ),
                      ),
                      Positioned(top: 15, left: 0, child: _backButton()),
                    ],
                  ),
                ),
              ));
        }));
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
