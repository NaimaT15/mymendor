import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

class BidFormBloc extends FormBloc<String, String> {
  final name = TextFieldBloc(
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
  final age = TextFieldBloc(
    validators: [
      FieldBlocValidators.required,
      // FieldBlocValidators.integer,
      // FieldBlocValidators.min(18),
    ],
  );

  BidFormBloc() {
    addFieldBlocs(
      fieldBlocs: [
        name,
        email,
        password,
        confirmPassword,
        age,
      ],
    );
  }

  @override
  void onSubmitting() async {
    final data = {
      "name": name.value,
      "email": email.value,
      "password": password.value,
      "age": int.parse(age.value),
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
            appBar: AppBar(title: const Text('Fill Bid Form')),
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
                        textFieldBloc: formBloc.name,
                        decoration: const InputDecoration(
                            labelText: 'Name', hintText: 'Enter your name'),
                      ),
                      TextFieldBlocBuilder(
                        textFieldBloc: formBloc.email,
                        decoration: const InputDecoration(
                            labelText: 'Email', hintText: 'Enter your email'),
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
                      TextFieldBlocBuilder(
                        textFieldBloc: formBloc.age,
                        decoration: const InputDecoration(
                            labelText: 'Age', hintText: 'Enter your age'),
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
          );
        },
      ),
    );
  }
}
