import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../handler/api_filehandler.dart';

class LoginFormBloc extends FormBloc<String, String> {
  final ID = TextFieldBloc(
    validators: [
      FieldBlocValidators.required,
    ],
  );

  final password = TextFieldBloc(
    validators: [
      FieldBlocValidators.required,
      // FieldBlocValidators.(value) => {},
    ],
  );

  LoginFormBloc() {
    addFieldBlocs(
      fieldBlocs: [
        ID,
        password,
      ],
    );
  }

  @override
  void onSubmitting() async {
    final data = {
      "ID": ID.value,
      "password": password.value,
    };
    emitSuccess(successResponse: jsonEncode(data));
  }
}

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool loading = false;
  String message = "";
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginFormBloc(),
      child: Builder(
        builder: (context) {
          final formBloc = context.read<LoginFormBloc>();
          return ModalProgressHUD(
            inAsyncCall: loading,
            child: Scaffold(
              appBar: AppBar(title: const Text('Fill ID Form')),
              body: FormBlocListener<LoginFormBloc, String, String>(
                onSubmitting: (context, state) async {
                  setState(() {
                    loading = true;
                    message = "";
                  });

                  final loginn = await login(
                      id: formBloc.ID.value, password: formBloc.password.value);
                  final Map parsed = json.decode(loginn.toString());

                  if (parsed["message"] == "Success") {
                    print("write the code to go the screen you want here");
                    message = ("write the code to go the screen you want here");
                  } else {
                    print("incorrect passord or id or any other error message");
                    message =
                        ("incorrect passord or id or any other error message");
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
                          textFieldBloc: formBloc.ID,
                          decoration: const InputDecoration(
                              labelText: 'ID', hintText: 'Enter your ID'),
                        ),
                        TextFieldBlocBuilder(
                          textFieldBloc: formBloc.password,
                          suffixButton: SuffixButton.obscureText,
                          decoration: const InputDecoration(
                              labelText: 'Password',
                              hintText: 'Enter your password'),
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
                                color: Colors.blue[400],
                                borderRadius: BorderRadius.circular(15),
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
          );
        },
      ),
    );
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}
