import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:mymendorr/handler/service.dart';
import 'package:mymendorr/sliderimage.dart';

import '../handler/api_filehandler.dart';

class RegisterFormBloc extends FormBloc<String, String> {
  final ID = TextFieldBloc(
    validators: [
      FieldBlocValidators.required,
    ],
  );
  final firstName = TextFieldBloc();
  final lastName = TextFieldBloc();
  final email = TextFieldBloc();

  final password = TextFieldBloc(
    validators: [
      FieldBlocValidators.required,
    ],
  );
  final password2 = TextFieldBloc(
    validators: [
      FieldBlocValidators.required,
    ],
  );
  RegisterFormBloc() {
    addFieldBlocs(
      fieldBlocs: [ID, password, password2, email, lastName, firstName],
    );
  }

  @override
  void onSubmitting() async {
    final data = {
      "ID": ID.value,
      "password": password.value,
      "email": email.value,
      "firstName": firstName.value,
      "lastName": lastName.value
    };
    emitSuccess(successResponse: jsonEncode(data));
  }
}

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  bool loading = false;
  String message = "";
  // @override
  // Widget build(BuildContext context) {
  //   return BlocProvider(
  //     create: (context) => RegisterFormBloc(),
  //     child: Builder(
  //       builder: (context) {
  //         final formBloc = context.read<RegisterFormBloc>();
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
          text: 's',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w700,
            color: const Color(0xFF0C3B2E),
          ),
          children: [
            TextSpan(
              text: 'ign',
              style: TextStyle(color: Colors.black, fontSize: 30),
            ),
            TextSpan(
              text: 'up',
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

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final buildContextBuild = context;
    return BlocProvider(
        create: (context) => RegisterFormBloc(),
        child: Builder(builder: (context) {
          final formBloc = context.read<RegisterFormBloc>();
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
                                child: FormBlocListener<RegisterFormBloc,
                                    String, String>(
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
                                      var body = {
                                        "identification_number":
                                            formBloc.ID.value,
                                        "first_name": formBloc.firstName.value,
                                        "last_name": formBloc.lastName.value,
                                        "email": formBloc.email.value,
                                        "password": formBloc.password.value,
                                        "password2": formBloc.password2.value
                                      };
                                      final registerRespones =
                                          await register(jsonEncode(body));
                                      print(registerRespones.toString());
                                      final Map parsed = json
                                          .decode(registerRespones.toString());
                                      print(parsed.toString());
                                      if (parsed["first_name"].isNotEmpty) {
                                        setLoggedInUser(
                                            registerRespones.toString());

                                        showSnackBar(buildContextBuild,
                                            "Successfully registered");
                                        Get.to(() => HomePage());
                                      } else {
                                        showSnackBar(buildContextBuild,
                                            "There is an error in the registration");
                                        message =
                                            ("There is an error in the registration");
                                      }

                                      setState(() {
                                        loading = false;
                                      });
                                    } catch (er) {
                                      print("error : " + er.toString());
                                      setState(() {
                                        loading = false;
                                        message =
                                            "There was an error in the registration";
                                      });
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
                                            textFieldBloc: formBloc.ID,
                                            decoration: const InputDecoration(
                                                labelText: 'ID',
                                                hintText: 'Enter your ID'),
                                          ),
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
                                          TextFieldBlocBuilder(
                                            textFieldBloc: formBloc.email,

                                            // suffixButton: SuffixButton.obscureText,
                                            decoration: const InputDecoration(
                                                labelText: 'Email Address',
                                                hintText: 'Enter your Email'),
                                          ),
                                          TextFieldBlocBuilder(
                                            textFieldBloc: formBloc.password,
                                            suffixButton:
                                                SuffixButton.obscureText,
                                            decoration: const InputDecoration(
                                                labelText: 'Password',
                                                hintText:
                                                    'Enter your password'),
                                          ),
                                          TextFieldBlocBuilder(
                                            textFieldBloc: formBloc.password2,
                                            suffixButton:
                                                SuffixButton.obscureText,
                                            decoration: const InputDecoration(
                                                labelText: 'confirm password',
                                                hintText:
                                                    'Enter your password again'),
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
                              SizedBox(height: height * .04),
                              _loginAccountLabel(),
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

  Widget _loginAccountLabel() {
    return InkWell(
      onTap: () {
        // Navigator.push(
        //     context, MaterialPageRoute(builder: (context) => LoginPage()));
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 20),
        padding: EdgeInsets.all(15),
        alignment: Alignment.bottomCenter,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Already have an account ?',
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              width: 10,
            ),
            GestureDetector(
              onTap: () {
                // Loginfunction();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomePage(),
                  ),
                );
              },
              child: Text(
                'Login',
                style: TextStyle(
                    color: const Color(0xFF0C3B2E),
                    fontSize: 13,
                    fontWeight: FontWeight.w600),
              ),
            ),
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
