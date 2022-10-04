import 'package:flutter/material.dart';

var data = DateTime.now();
// Print(data.toIso8601String()),
// class Lamp extends StatelessWidget {
//   static final String path = "lib/src/pages/login/login7.dart";
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       width: 300,
//       height: 300,
//       child: Center(
//         child: Stack(
//           fit: StackFit.expand,
//           clipBehavior: Clip.none,
//           // overflow: Overflow.visible,
//           children: <Widget>[
//             Container(
//               width: 300,
//               height: 300,
//               color: Colors.red,
//             ), //Container
//             Positioned(
//               top: 80,
//               left: 80,
//               child: Container(
//                 width: 250,
//                 height: 250,
//                 color: Colors.black,
//               ),
//             ), //Container
//             Positioned(
//               left: 20,
//               top: 20,
//               child: Container(
//                 height: 200,
//                 width: 200,
//                 color: Colors.purple,
//               ),
//             ), //Container
//           ], //<Widget>[]
//         ), //Stack
//       ), //Center
//     );
//   }
// }


// // end of 



// import 'dart:io';
// // import 'package:flutter_neumorphic_null_safety/flutter_neumorphic.dart';
// import 'package:flutter/material.dart';
// import 'package:hive_flutter/hive_flutter.dart';
// import 'package:myreader/pdf_api.dart';
// import 'package:myreader/pdfviewnew.dart';
// import 'package:myreader/theme.dart';
// import 'bookmarksinfo.dart';
// import 'hmuis.dart';

// var darkMode;
// ThememodeClass thmclass = ThememodeClass();

// class AudioPlayerSample extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final _raqbaBox = thmclass.readMode();

//     return ValueListenableBuilder(
//         valueListenable: Hive.box('theme_box').listenable(),
//         builder: (context, box, widget) {
//           print("listenrer runned");
//           darkMode = thmclass.readMode();
//           return MaterialApp(
//             debugShowCheckedModeBanner: false,
//             title: 'Flutter Demo',
//             themeMode: darkMode ? ThemeMode.dark : ThemeMode.light,
//             theme: ThemeData.light(),
//             darkTheme: ThemeData.dark(),
//             home: MyContainer(),
//           );
//         });
//   }
// }

// class MyContainer extends StatelessWidget {
//   MyContainer({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Column(
//           //mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Expanded(child: _buildTopBar(context)),
//             Expanded(flex: 2, child: _buildImage(context)),
//             SizedBox(height: 10),
//             Expanded(child: _buildTitle(context)),
//             Expanded(child: Lamp()),
//             Expanded(child: _buildSeekBar(context)),
//             // SizedBox(height: 10),
//             // SizedBox(height: 10),
//             Divider(
//               color: Colors.black54,
//             ),
//             Expanded(child: _buildControlsBar(context)),
//           ],
//         ),
//       ),
//       // floatingActionButton: FloatingActionButton.extended(
//       //     onPressed: () {}, label: Text('Change Theme')),
//     );
//   }

//   Widget _buildTopBar(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.fromLTRB(0, 0, 15, 0),
//       child: Stack(
//         alignment: Alignment.center,
//         children: <Widget>[
//           Align(
//               alignment: Alignment.centerRight,
//               child: GestureDetector(
//                 onTap: () {
//                   darkMode = !darkMode;
//                   thmclass.updateItem(item: {
//                     "darkmode": darkMode,
//                   });
//                 },
//                 child: Container(
//                   height: 50,
//                   width: 50,
//                   decoration: BoxDecoration(
//                     // color: darkMode ? Colors.white : _iconsColor(),
//                     borderRadius: BorderRadius.circular(10.0),
//                     boxShadow: [
//                       BoxShadow(
//                           color: darkMode ? Colors.white54 : _iconsColor(),
//                           offset: Offset(0.0, 4),
//                           blurRadius: 10.0)
//                     ],
//                   ),
//                   child: ImageIcon(
//                     AssetImage("assets/images/night.png"),
//                     // color: darkMode ? Colors.white : _iconsColor(),
//                   ),
//                 ),
//               )),
//         ],
//       ),
//     );
//   }

//   Widget _buildImage(BuildContext context) {
//     return MaterialButton(
//       onPressed: (() async {
//         final path = 'assets/pdf/safar.pdf';
//         final file = await PDFApi.loadAsset(path);
//         openPDF(context, file);
//       }),
//       child: Container(
//           padding: EdgeInsets.zero,
//           decoration: BoxDecoration(
//               shape: BoxShape.circle,
//               border: Border.all(
//                 color: darkMode ? Colors.white : _iconsColor(),
//                 width: 5,
//               )),
//           child: ClipRRect(
//             borderRadius: BorderRadius.circular(100),
//             child: Image.asset(
//               "assets/images/amar.png",
//               fit: BoxFit.cover,
//             ),
//           )),
//     );
//   }

//   Widget _buildTitle(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.center,
//       children: <Widget>[
//         Text("Blinding Lights",
//             style: TextStyle(
//               fontWeight: FontWeight.w800,
//               fontSize: 34,
//             )),
//         // Text("The Weeknd",
//         //     style: TextStyle(
//         //         fontWeight: FontWeight.w400,
//         //         fontSize: 14,
//         //         color: NeumorphicTheme.defaultTextColor(context))),
//       ],
//     );
//   }

//   Widget _buildButton(BuildContext context) {
//     return MaterialButton(
//       onPressed: (() async {
//         final path = 'assets/pdf/safar.pdf';
//         final file = await PDFApi.loadAsset(path);
//         openPDF(context, file);
//       }),
//       child: Container(
//         padding: EdgeInsets.zero,
//         // height: 250,
//         // width: 200,
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Flexible(
//                 flex: 5,
//                 child: ImageIcon(
//                   size: 60,
//                   color: Colors.blue,
//                   AssetImage(
//                     "assets/images/readhere.png",
//                   ),
//                 )),
//             Flexible(
//               flex: 1,
//               child: Text("Read",
//                   style: TextStyle(
//                     fontWeight: FontWeight.w800,
//                     fontSize: 14,
//                   )),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildbookmarkButton(BuildContext context) {
//     return MaterialButton(
//       onPressed: (() {
//         Navigator.push(
//           context,
//           MaterialPageRoute(builder: (context) => Bookmarksinfo()),
//         );
//       }),
//       child: Container(
//         padding: EdgeInsets.zero,
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Flexible(
//                 flex: 5,
//                 child: Icon(
//                   size: 60,
//                   Icons.book,
//                 )),
//             Flexible(
//               flex: 1,
//               child: Text("Bookmarks",
//                   style: TextStyle(
//                     fontWeight: FontWeight.w800,
//                     fontSize: 14,
//                   )),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildSeekBar(BuildContext context) {
//     return Row(
//       crossAxisAlignment: CrossAxisAlignment.center,
//       mainAxisAlignment: MainAxisAlignment.spaceAround,
//       children: <Widget>[
//         Expanded(
//           child: _buildWikiCategory(
//             Icons.bookmark,
//             "Book",
//             Colors.indigo.withOpacity(0.7),
//           ),
//         ),
//         Expanded(
//           child: _buildbookmarkButton(context),
//         ),
//       ],
//     );
//   }

//   Widget _buildControlsBar(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: <Widget>[
//         ElevatedButton(
//           onPressed: () {},
//           child: Image.asset(
//             "assets/images/gplay.png",
//             height: 33,
//             width: 33,
//           ),
//         ),
//         const SizedBox(width: 55),
//         ElevatedButton(
//           onPressed: () {},
//           child: Image.asset(
//             "assets/images/rate.png",
//             height: 33,
//             width: 33,
//           ),
//         ),
//         const SizedBox(width: 55),
//         ElevatedButton(
//           onPressed: () {},
//           child: Image.asset(
//             "assets/images/privacy.png",
//             height: 33,
//             width: 33,
//           ),
//         ),
//       ],
//     );
//   }

//   Color _iconsColor() {
//     return Colors.blueAccent;
//   }

//   void openPDF(BuildContext context, File file) => Navigator.of(context).push(
//         MaterialPageRoute(
//             builder: (context) => PDFViewerPage(
//                   file: file,
//                 )),
//       );

//   Stack _buildWikiCategory(IconData icon, String label, Color color) {
//     return Stack(
//       children: <Widget>[
//         Container(
//           padding: const EdgeInsets.all(26.0),
//           alignment: Alignment.centerRight,
//           child: Opacity(
//               opacity: 0.3,
//               child: Icon(
//                 icon,
//                 size: 40,
//                 color: Colors.white,
//               )),
//           decoration: BoxDecoration(
//             color: color,
//             borderRadius: BorderRadius.circular(20.0),
//           ),
//         ),
//         Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               Icon(
//                 icon,
//                 color: Colors.white,
//               ),
//               const SizedBox(height: 16.0),
//               Text(
//                 label,
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontWeight: FontWeight.bold,
//                 ),
//               )
//             ],
//           ),
//         )
//       ],
//     );
//   }
// }
