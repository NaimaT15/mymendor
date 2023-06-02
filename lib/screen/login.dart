// import 'package:flutter/material.dart';
// import 'package:mymendorr/handler/api_filehandler.dart';
// import 'package:mymendorr/screen/login.dart';
// import 'package:google_fonts/google_fonts.dart';

// import '../forms/login_form.dart';

// class LoginPage extends StatefulWidget {
//   const LoginPage({Key? key, this.title}) : super(key: key);

//   final String? title;

//   @override
//   _LoginPageState createState() => _LoginPageState();
// }

// class _LoginPageState extends State<LoginPage> {
//   void Loginfunction() async {
//     final loginn = await login(8790, '1234');
//     print('login' + loginn.toString());
//   }

//   Widget _backButton() {
//     return InkWell(
//       onTap: () {
//         Navigator.pop(context);
//       },
//       child: Container(
//         padding: const EdgeInsets.symmetric(horizontal: 10),
//         child: Row(
//           children: <Widget>[
//             Container(
//               padding: const EdgeInsets.only(left: 0, top: 10, bottom: 10),
//               child: const Icon(Icons.keyboard_arrow_left, color: Colors.black),
//             ),
//             const Text('Back',
//                 style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500))
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _entryField(String title, {bool isPassword = false}) {
//     return Container(
//       margin: const EdgeInsets.symmetric(vertical: 10),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: <Widget>[
//           Text(
//             title,
//             style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
//           ),
//           const SizedBox(
//             height: 10,
//           ),
//           TextField(
//               obscureText: isPassword,
//               decoration: const InputDecoration(
//                   border: InputBorder.none,
//                   fillColor: Color(0xfff3f3f4),
//                   filled: true))
//         ],
//       ),
//     );
//   }

//   Widget _submitButton() {
//     return Container(
//       width: MediaQuery.of(context).size.width,
//       padding: EdgeInsets.symmetric(vertical: 15),
//       alignment: Alignment.center,
//       decoration: BoxDecoration(
//           borderRadius: BorderRadius.all(Radius.circular(5)),
//           boxShadow: <BoxShadow>[
//             BoxShadow(
//                 color: Colors.grey.shade200,
//                 offset: Offset(2, 4),
//                 blurRadius: 5,
//                 spreadRadius: 2)
//           ],
//           gradient: LinearGradient(
//               begin: Alignment.centerLeft,
//               end: Alignment.centerRight,
//               colors: [
//                 Color.fromARGB(255, 33, 123, 233),
//                 Color.fromARGB(255, 41, 131, 226)
//               ])),
//       child: Text(
//         'Login',
//         style: TextStyle(fontSize: 20, color: Colors.white),
//       ),
//     );
//   }

//   Widget _loginAccountLabel() {
//     return InkWell(
//       onTap: () {
//         Navigator.push(
//             context, MaterialPageRoute(builder: (context) => LoginPage()));
//       },
//       child: Container(
//         margin: EdgeInsets.symmetric(vertical: 20),
//         padding: EdgeInsets.all(15),
//         alignment: Alignment.bottomCenter,
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Text(
//               'Already have an account ?',
//               style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
//             ),
//             SizedBox(
//               width: 10,
//             ),
//             GestureDetector(
//               onTap: () {
//                 Loginfunction();
//               },
//               child: Text(
//                 'Login',
//                 style: TextStyle(
//                     color: Color.fromARGB(255, 35, 123, 223),
//                     fontSize: 13,
//                     fontWeight: FontWeight.w600),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _title() {
//     return RichText(
//       textAlign: TextAlign.center,
//       text: TextSpan(
//           text: 'l',
//           style: TextStyle(
//               fontSize: 30,
//               fontWeight: FontWeight.w700,
//               color: Color.fromARGB(255, 26, 112, 233)),
//           children: [
//             TextSpan(
//               text: 'o',
//               style: TextStyle(color: Colors.black, fontSize: 30),
//             ),
//             TextSpan(
//               text: 'gin',
//               style: TextStyle(
//                   color: Color.fromARGB(255, 16, 104, 228), fontSize: 30),
//             ),
//           ]),
//     );
//   }

//   Widget _emailPasswordWidget() {
//     return Column(
//       children: <Widget>[
//         _entryField("Username"),
//         _entryField("Password", isPassword: true),
//       ],
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     final height = MediaQuery.of(context).size.height;
//     return Scaffold(
//       body: Container(
//         height: height,
//         child: Stack(
//           children: <Widget>[
//             // Positioned(
//             //   top: -MediaQuery.of(context).size.height * .15,
//             //   right: -MediaQuery.of(context).size.width * .4,
//             //   child: BezierContainer(),
//             // ),
//             Container(
//               padding: const EdgeInsets.symmetric(horizontal: 20),
//               child: SingleChildScrollView(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: <Widget>[
//                     SizedBox(height: height * .2),
//                     _title(),
//                     LoginForm(),

//                     // const SizedBox(
//                     //   height: 50,
//                     // ),
//                     // _emailPasswordWidget(),
//                     // const SizedBox(
//                     //   height: 20,
//                     // ),
//                     // _submitButton(),
//                     SizedBox(height: height * .14),
//                     _loginAccountLabel(),
//                   ],
//                 ),
//               ),
//             ),
//             Positioned(top: 40, left: 0, child: _backButton()),
//           ],
//         ),
//       ),
//     );
//   }
// }
