import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class BidFormBloc extends FormBloc<String, String> {
  final first_name = TextFieldBloc(
    validators: [
      FieldBlocValidators.required,
    ],
  );
  final last_name = TextFieldBloc(
    validators: [
      FieldBlocValidators.required,
    ],
  );
  final email = TextFieldBloc(
    validators: [
      FieldBlocValidators.required,
      FieldBlocValidators.email,
    ],
  );

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
  final confirmPassword = TextFieldBloc(
    validators: [
      FieldBlocValidators.required,
    ],
  );

  BidFormBloc() {
    addFieldBlocs(
      fieldBlocs: [
        first_name,
        last_name,
        email,
        ID,
        password,
        confirmPassword,
      ],
    );
  }

  @override
  void onSubmitting() async {
    final data = {
      "first_name": first_name.value,
      "last_name": last_name.value,
      "email": email.value,
      "ID": ID.value,
      "password": password.value,
    };
    emitSuccess(successResponse: jsonEncode(data));
  }
}

class BidForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BidFormBloc(),
      child: Builder(
        builder: (context) {
          final formBloc = context.read<BidFormBloc>();
          return Scaffold(
            appBar: AppBar(title: const Text('Signup')),
            body: FormBlocListener<BidFormBloc, String, String>(
              onSubmitting: (context, state) {},
              onSuccess: (context, state) {
                print(state.successResponse);
              },
              onFailure: (context, state) {},
              child: SingleChildScrollView(
                physics: const ClampingScrollPhysics(),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8),
                  child: Column(
                    children: <Widget>[
                      TextFieldBlocBuilder(
                        textFieldBloc: formBloc.first_name,
                        decoration: const InputDecoration(
                            labelText: 'first_name',
                            hintText: 'Enter your first_name'),
                      ),
                      TextFieldBlocBuilder(
                        textFieldBloc: formBloc.first_name,
                        decoration: const InputDecoration(
                            labelText: 'last_name',
                            hintText: 'Enter your last_name'),
                      ),
                      TextFieldBlocBuilder(
                        textFieldBloc: formBloc.email,
                        decoration: const InputDecoration(
                            labelText: 'Email', hintText: 'Enter your email'),
                      ),
                      TextFieldBlocBuilder(
                        textFieldBloc: formBloc.first_name,
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
                      TextFieldBlocBuilder(
                        textFieldBloc: formBloc.confirmPassword,
                        suffixButton: SuffixButton.obscureText,
                        decoration: const InputDecoration(
                            labelText: 'Confirm Password',
                            hintText: 'Re-enter your password'),
                      ),
                      const SizedBox(height: 16),
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
                              'CREATE ACCOUNT',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 21,
                                fontWeight: FontWeight.w300,
                                color: Colors.white,
                              ),
                            )),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushReplacementNamed(context, "/signin");
                        },
                        child: Text(
                          "Already have an account?",
                          style: GoogleFonts.roboto(
                              textStyle: const TextStyle(
                                  color: Colors.white70,
                                  fontSize: 13,
                                  decoration: TextDecoration.underline,
                                  letterSpacing: 0.5)),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
