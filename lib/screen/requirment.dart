// import 'package:flutter/material.dart';
// import 'package:dio/dio.dart';

// class RequirementPage extends StatefulWidget {
//   const RequirementPage({super.key});

//   @override
//   _RequirementPageState createstate() => _RequirementPageState();

//   @override
//   State<StatefulWidget> createState() {
//     // TODO: implement createState
//     throw UnimplementedError();
//   }
// }

// class _RequirementPageState extends State<RequirementPage> {
//   late Future<List> requirments;

//   Future<List> getRequirments() async {
//     var responce = await Dio().get('https://restcountries.eu/rest/v2/all');
//     return responce.data;
//   }

//   @override
//   void iniState() {
//     requirments = getRequirments();

//     super.initState();
//   }

//   @override
//   Widget build(BuildContext) {
//     getRequirments();
//     return Scaffold(
//         appBar: AppBar(
//           //  backgroundColor: Colors.pink,
//           title: const Text('Requirments'),
//         ),
//         body: Container(
//             margin: EdgeInsets.all(10),
//             child: FutureBuilder<List>(
//                 future: requirments,
//                 builder: ( Context, AsyncSnapshot<List> snapshot){
//                   if (snapshot.hasData) {
//                    return Text('hello');
//                   }
//                   else{
//                   return null;
//                   }
//               },)));
//   }
// }
