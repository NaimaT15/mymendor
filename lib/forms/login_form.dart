import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../handler/api_filehandler.dart';
import '../handler/service.dart';
import '../screen/form/login.dart';
import '../screen/form/register.dart';
import '../sliderimage.dart';
import 'register_form.dart';

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

  Widget _entryField(String title, {bool isPassword = false}) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          const SizedBox(
            height: 10,
          ),
          TextField(
              obscureText: isPassword,
              decoration: const InputDecoration(
                  border: InputBorder.none,
                  fillColor: Color(0xfff3f3f4),
                  filled: true))
        ],
      ),
    );
  }

  Widget _submitButton() {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(vertical: 15),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.grey.shade200,
                offset: Offset(2, 4),
                blurRadius: 5,
                spreadRadius: 2)
          ],
          gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                Color.fromARGB(255, 33, 123, 233),
                Color.fromARGB(255, 41, 131, 226)
              ])),
      child: Text(
        'Login',
        style: TextStyle(fontSize: 20, color: Colors.white),
      ),
    );
  }

  Widget _title() {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
          text: 'l',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w700,
            color: const Color(0xFF0C3B2E),
          ),
          children: [
            TextSpan(
              text: 'o',
              style: TextStyle(color: Colors.black, fontSize: 30),
            ),
            TextSpan(
                text: 'gin',
                style: TextStyle(
                  color: const Color(0xFF0C3B2E),
                )),
          ]),
    );
  }

  Widget _emailPasswordWidget() {
    return Column(
      children: <Widget>[
        _entryField("Username"),
        _entryField("Password", isPassword: true),
      ],
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   return BlocProvider(
  //     create: (context) => LoginFormBloc(),
  //     child: Builder(
  //       builder: (context) {
  //         final formBloc = context.read<LoginFormBloc>();
  //         return ModalProgressHUD(
  //           inAsyncCall: loading,
  //           child: Scaffold(
  //             appBar: AppBar(title: const Text('Fill ID Form')),
  //             body: ),
  //         );
  //       },
  //     ),
  //   );
  // }

  Widget _loginAccountLabel() {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => RegisterPage()));
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 20),
        padding: EdgeInsets.all(15),
        alignment: Alignment.bottomCenter,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Create Account',
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              'Registor',
              style: TextStyle(
                  color: const Color(0xFF0C3B2E),
                  fontSize: 13,
                  fontWeight: FontWeight.w600),
            ),
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
        create: (context) => LoginFormBloc(),
        child: Builder(builder: (context) {
          final formBloc = context.read<LoginFormBloc>();
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
                              SizedBox(height: height * .2),
                              _title(),
                              // LoginForm(),

                              // const SizedBox(
                              //   height: 50,
                              // ),
                              Container(
                                height: 340,
                                alignment: Alignment.center,
                                child: FormBlocListener<LoginFormBloc, String,
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
                                      final response = await login(
                                          id: formBloc.ID.value,
                                          password: formBloc.password.value);
                                      if (response.statusCode == 401) {
                                        setState(() {
                                          message =
                                              "Incorrect password or username";
                                        });
                                        return;
                                      }
                                      final Map parsed =
                                          json.decode(response.toString());

                                      if (parsed["access"]
                                          .toString()
                                          .isNotEmpty) {
                                        var tokenString = {
                                          "access": parsed['access'],
                                          "refresh": parsed['refresh']
                                        };
                                        saveTokenToStorage(tokenString);
                                        message = ("Successfully logged in");
                                        showSnackBar(
                                            buildContextBuild, message);

                                        Get.to(() => HomePage());
                                      } else {
                                        loading = false;
                                        message = ("incorrect passord or id");
                                        showSnackBar(
                                            buildContextBuild, message);
                                      }

                                      setState(() {
                                        loading = false;
                                      });
                                    } catch (er) {
                                      setState(() {
                                        loading = false;
                                        message =
                                            "Incorrect password or username";
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
                                            textFieldBloc: formBloc.password,
                                            suffixButton:
                                                SuffixButton.obscureText,
                                            decoration: const InputDecoration(
                                                labelText: 'Password',
                                                hintText:
                                                    'Enter your password'),
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
                                                  color: Colors.blue[400],
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
                              SizedBox(height: height * .14),
                              _loginAccountLabel(),
                            ],
                          ),
                        ),
                      ),
                      Positioned(top: 40, left: 0, child: _backButton()),
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
