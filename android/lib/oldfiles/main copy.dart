// //    getFileFromAsset("assets/pdf/amar.pdf").then((f) {

// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:hive_flutter/hive_flutter.dart';
// import 'package:myreader/pdf_api.dart';
// import 'package:myreader/pdfviewnew.dart';

// import 'homepage.dart';

// Future<void> main() async {
//   await Hive.initFlutter();
//   await Hive.openBox('raqba_box');
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Flutter Demo',
//       home: AudioPlayerSample(),
//       //),
//     );
//   }
// }
// // class PDFScree extends StatelessWidget {
// //   const PDFScree({super.key});

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       body: Center(
// //           child: TextButton(
// //               onPressed: () async {
// //                 final path = 'assets/pdf/Book8.pdf';
// //                 final file = await PDFApi.loadAsset(path);
// //                 openPDF(context, file);
// //               },
// //               child: Text("open"))),
// //     );
// //   }

// //   void openPDF(BuildContext context, File file) => Navigator.of(context).push(
// //         MaterialPageRoute(builder: (context) => PDFViewerPage(file: file)),
// //       );
// // }
