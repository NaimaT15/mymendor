import 'dart:convert';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../handler/api_filehandler.dart';
import '../sliderimage.dart';

class FeedbackformBloc extends FormBloc<String, String> {
  final title = TextFieldBloc(
    validators: [
      FieldBlocValidators.required,
    ],
  );

  final Description = TextFieldBloc(
    validators: [
      FieldBlocValidators.required,
      // FieldBlocValidators.(value) => {},
    ],
  );

  FeedbackformBloc() {
    addFieldBlocs(
      fieldBlocs: [
        title,
        Description,
      ],
    );
  }

  @override
  void onSubmitting() async {
    final data = {
      "title": title.value,
      "Description": Description.value,
    };
    emitSuccess(successResponse: jsonEncode(data));
  }
}

class Feedbackform extends StatefulWidget {
  const Feedbackform({super.key});

  @override
  State<Feedbackform> createState() => _FeedbackformState();
}

class _FeedbackformState extends State<Feedbackform> {
  bool loading = false;
  String message = "";
  @override
  Widget build(BuildContext context) {
    final buildContextBuild = context;

    return BlocProvider(
      create: (context) => FeedbackformBloc(),
      child: Builder(
        builder: (context) {
          final formBloc = context.read<FeedbackformBloc>();
          return ModalProgressHUD(
            inAsyncCall: loading,
            child: Scaffold(
              appBar: AppBar(
                  backgroundColor: const Color(0xFF0C3B2E),
                  title: const Text('Feedback Form',
                      style: const TextStyle(color: Colors.white70))),
              body: FormBlocListener<FeedbackformBloc, String, String>(
                onSubmitting: (context, state) async {
                  setState(() {
                    loading = true;
                    message = "";
                  });
                  if (!state.isValid()) {
                    setState(() {
                      loading = false;
                      message = "Please fill the form";
                      showSnackBar(buildContextBuild, message);
                    });
                    return;
                  }
                  var body = {
                    "title": formBloc.title.value,
                    "description": formBloc.Description.value,
                  };
                  final registerRespones =
                      await submitFeedback(jsonEncode(body));
                  final Map parsed = json.decode(registerRespones.toString());
                  if (parsed["status"].toString() == "success") {
                    message = ("Successfully Submitted");
                    // ignore: use_build_context_synchronously
                    showSnackBar(buildContextBuild, message);
                  } else {
                    message =
                        ("There is an error in the feedback submission. Please try again");
                    // ignore: use_build_context_synchronously
                    showSnackBar(buildContextBuild, message);
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
                        TextFieldBlocBuilder(
                          textFieldBloc: formBloc.title,
                          decoration: const InputDecoration(
                              labelText: 'title', hintText: 'Enter your title'),
                        ),
                        TextFieldBlocBuilder(
                          textFieldBloc: formBloc.Description,
                          // suffixButton: SuffixButton.obscureText,
                          textAlignVertical: TextAlignVertical.top,
                          textAlign: TextAlign.start,
                          textStyle:
                              TextStyle(textBaseline: TextBaseline.alphabetic),

                          decoration: const InputDecoration(
                              hintTextDirection: TextDirection.ltr,
                              contentPadding: EdgeInsets.only(
                                  top: 100, left: 40, bottom: 100),
                              labelText: 'Description',
                              hintText: 'Enter your Description'),
                        ),
                        const SizedBox(height: 16),
                        message.isNotEmpty
                            ? Container(
                                margin: const EdgeInsets.all(10),
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
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: const Text(
                                'Submit your feedback! ',
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
          );
        },
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
