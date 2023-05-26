import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:mymendorr/forms/bid_form.dart';
import 'package:mymendorr/sliderimage.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
      builder: (context, child) {
        return FormThemeProvider(
          theme: const FormTheme(
            checkboxTheme: CheckboxFieldTheme(
              canTapItemTile: true,
            ),
            // radioTheme: RadioFieldTheme(
            //   canTapItemTile: true,
            // ),
          ),
          child: child!,
        );
      },
      home: const HomePage(),
    );
  }
}
