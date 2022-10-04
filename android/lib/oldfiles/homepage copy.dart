// import 'dart:io';
// import 'package:flutter_neumorphic_null_safety/flutter_neumorphic.dart';
// import 'package:hive_flutter/hive_flutter.dart';
// import 'package:myreader/pdf_api.dart';
// import 'package:myreader/pdfviewnew.dart';
// import 'package:myreader/theme.dart';
// import 'bookmarksinfo.dart';

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
//           return NeumorphicApp(
//             debugShowCheckedModeBanner: false,
//             title: 'Flutter Demo',
//             themeMode: darkMode ? ThemeMode.dark : ThemeMode.light,
//             theme: NeumorphicThemeData(
//               defaultTextColor: Color.fromARGB(255, 131, 128, 128),
//               baseColor: Color.fromARGB(255, 238, 246, 247),
//               lightSource: LightSource.topLeft,
//               intensity: 0.5,
//               depth: 10,
//             ),
//             darkTheme: neumorphicDefaultDarkTheme.copyWith(
//                 defaultTextColor: Colors.white),
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
//             // SizedBox(height: 10),
//             Expanded(child: _buildSeekBar(context)),
//             SizedBox(height: 10),
//             SizedBox(height: 10),
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
//             alignment: Alignment.centerRight,
//             child: NeumorphicButton(
//               padding: const EdgeInsets.all(18.0),
//               onPressed: () {
//                 darkMode = !darkMode;
//                 thmclass.updateItem(item: {
//                   "darkmode": darkMode,
//                 });
//               },
//               style: NeumorphicStyle(
//                 intensity: 100,
//                 shape: NeumorphicShape.flat,
//                 boxShape: NeumorphicBoxShape.circle(),
//               ),
//               child: ImageIcon(
//                 AssetImage("assets/images/night.png"),
//                 color: darkMode ? Colors.white : _iconsColor(),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildImage(BuildContext context) {
//     return NeumorphicButton(
//       onPressed: (() async {
//         final path = 'assets/pdf/safar.pdf';
//         final file = await PDFApi.loadAsset(path);
//         openPDF(context, file);
//       }),
//       style: NeumorphicStyle(
//         intensity: 10,
//         boxShape: NeumorphicBoxShape.circle(),
//       ),
//       child: Container(
//           padding: EdgeInsets.zero,
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
//                 fontWeight: FontWeight.w800,
//                 fontSize: 34,
//                 color: NeumorphicTheme.defaultTextColor(context))),
//         // Text("The Weeknd",
//         //     style: TextStyle(
//         //         fontWeight: FontWeight.w400,
//         //         fontSize: 14,
//         //         color: NeumorphicTheme.defaultTextColor(context))),
//       ],
//     );
//   }

//   Widget _buildButton(BuildContext context) {
//     return Stack(
//         clipBehavior: Clip.none,
//         fit: StackFit.loose,
//         alignment: AlignmentDirectional.topCenter,
//         children: [
//           Container(
//             child: NeumorphicButton(
//                 margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
//                 onPressed: (() async {
//                   final path = 'assets/pdf/safar.pdf';
//                   final file = await PDFApi.loadAsset(path);
//                   openPDF(context, file);
//                 }),
//                 style: NeumorphicStyle(
//                   intensity: 10,
//                   boxShape: NeumorphicBoxShape.roundRect(
//                     BorderRadius.circular(22),
//                   ),
//                 ),
//                 child: Align(
//                   alignment: Alignment.bottomCenter,
//                   child: Text("Read",
//                       style: TextStyle(
//                           fontWeight: FontWeight.w800,
//                           fontSize: 14,
//                           color: NeumorphicTheme.defaultTextColor(context))),
//                 )),
//           ),
//           Positioned(
//               top: -30,
//               child: Align(
//                 alignment: Alignment.topCenter,
//                 child: ImageIcon(
//                   size: 80,
//                   color: Colors.blue,
//                   AssetImage(
//                     "assets/images/readhere.png",
//                   ),
//                 ),
//               )),
//         ]);
//   }

//   Widget _buildbookmarkButton(BuildContext context) {
//     return NeumorphicButton(
//       margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
//       onPressed: (() {
//         Navigator.push(
//           context,
//           MaterialPageRoute(builder: (context) => Bookmarksinfo()),
//         );
//       }),
//       style: NeumorphicStyle(
//         intensity: 10,
//         boxShape: NeumorphicBoxShape.roundRect(
//           BorderRadius.circular(22),
//         ),
//       ),
//       child: Container(
//         padding: EdgeInsets.zero,
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Flexible(
//                 flex: 5,
//                 child: Icon(
//                   size: 60,
//                   color: Colors.blue,
//                   Icons.book,
//                 )),
//             Flexible(
//               flex: 1,
//               child: Text("Bookmarks",
//                   style: TextStyle(
//                       fontWeight: FontWeight.w800,
//                       fontSize: 14,
//                       color: NeumorphicTheme.defaultTextColor(context))),
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
//           child: _buildButton(context),
//         ),
//         SizedBox(
//           width: 10,
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
//         NeumorphicButton(
//           padding: const EdgeInsets.all(18.0),
//           onPressed: () {},
//           style: NeumorphicStyle(
//             intensity: 10,
//             shape: NeumorphicShape.flat,
//             boxShape: NeumorphicBoxShape.circle(),
//           ),
//           child: Image.asset(
//             "assets/images/gplay.png",
//             height: 33,
//             width: 33,
//           ),
//         ),
//         const SizedBox(width: 55),
//         NeumorphicButton(
//           padding: const EdgeInsets.all(18.0),
//           onPressed: () {},
//           style: NeumorphicStyle(
//             intensity: 10,
//             shape: NeumorphicShape.flat,
//             boxShape: NeumorphicBoxShape.circle(),
//           ),
//           child: Image.asset(
//             "assets/images/rate.png",
//             height: 33,
//             width: 33,
//           ),
//         ),
//         const SizedBox(width: 55),
//         NeumorphicButton(
//           padding: const EdgeInsets.all(18.0),
//           onPressed: () {},
//           style: NeumorphicStyle(
//             intensity: 10,
//             shape: NeumorphicShape.flat,
//             boxShape: NeumorphicBoxShape.circle(),
//           ),
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
// }

//todod 8.9.22
// import 'dart:io';
// import 'package:flutter_neumorphic_null_safety/flutter_neumorphic.dart';
// import 'package:hive_flutter/hive_flutter.dart';
// import 'package:myreader/pdf_api.dart';
// import 'package:myreader/pdfviewnew.dart';
// import 'package:myreader/theme.dart';
// import 'bookmarksinfo.dart';

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
//           return NeumorphicApp(
//             debugShowCheckedModeBanner: false,
//             title: 'Flutter Demo',
//             themeMode: darkMode ? ThemeMode.dark : ThemeMode.light,
//             theme: NeumorphicThemeData(
//               defaultTextColor: Color(0xFF3E3E3E),
//               baseColor: Color(0xFFDDE6E8),
//               lightSource: LightSource.topLeft,
//               intensity: 0.5,
//               depth: 10,
//             ),
//             darkTheme: neumorphicDefaultDarkTheme.copyWith(
//                 defaultTextColor: Colors.white),
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
//             // SizedBox(height: 10),
//             Expanded(child: _buildSeekBar(context)),
//             SizedBox(height: 10),
//             SizedBox(height: 10),
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
//             alignment: Alignment.centerRight,
//             child: NeumorphicButton(
//               padding: const EdgeInsets.all(18.0),
//               onPressed: () {
//                 darkMode = !darkMode;
//                 thmclass.updateItem(item: {
//                   "darkmode": darkMode,
//                 });
//               },
//               style: NeumorphicStyle(
//                 intensity: 100,
//                 shape: NeumorphicShape.flat,
//                 boxShape: NeumorphicBoxShape.circle(),
//               ),
//               child: ImageIcon(
//                 AssetImage("assets/images/night.png"),
//                 color: darkMode ? Colors.white : _iconsColor(),
//               ),
//             ),
//           ),
//           // Align(
//           //     alignment: Alignment.bottomRight,
//           //     child: Container(
//           //       padding: EdgeInsets.only(right: 15),
//           //       child: Text(darkMode ? "Day" : "Night"),
//           //     ))
//         ],
//       ),
//     );
//   }

//   Widget _buildImage(BuildContext context) {
//     return NeumorphicButton(
//       onPressed: (() async {
//         final path = 'assets/pdf/safar.pdf';
//         final file = await PDFApi.loadAsset(path);
//         openPDF(context, file);
//       }),
//       style: NeumorphicStyle(
//         intensity: 10,
//         boxShape: NeumorphicBoxShape.circle(),
//       ),
//       child: Container(
//           padding: EdgeInsets.zero,
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
//                 fontWeight: FontWeight.w800,
//                 fontSize: 34,
//                 color: NeumorphicTheme.defaultTextColor(context))),
//         // Text("The Weeknd",
//         //     style: TextStyle(
//         //         fontWeight: FontWeight.w400,
//         //         fontSize: 14,
//         //         color: NeumorphicTheme.defaultTextColor(context))),
//       ],
//     );
//   }

//   Widget _buildButton(BuildContext context) {
//     return NeumorphicButton(
//       margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
//       onPressed: (() async {
//         final path = 'assets/pdf/safar.pdf';
//         final file = await PDFApi.loadAsset(path);
//         openPDF(context, file);
//       }),
//       style: NeumorphicStyle(
//         intensity: 10,
//         boxShape: NeumorphicBoxShape.roundRect(
//           BorderRadius.circular(22),
//         ),
//       ),
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
//                       fontWeight: FontWeight.w800,
//                       fontSize: 14,
//                       color: NeumorphicTheme.defaultTextColor(context))),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildbookmarkButton(BuildContext context) {
//     return NeumorphicButton(
//       margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
//       onPressed: (() {
//         Navigator.push(
//           context,
//           MaterialPageRoute(builder: (context) => Bookmarksinfo()),
//         );
//       }),
//       style: NeumorphicStyle(
//         intensity: 10,
//         boxShape: NeumorphicBoxShape.roundRect(
//           BorderRadius.circular(22),
//         ),
//       ),
//       child: Container(
//         padding: EdgeInsets.zero,
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Flexible(
//                 flex: 5,
//                 child: Icon(
//                   size: 60,
//                   color: Colors.blue,
//                   Icons.book,
//                 )),
//             Flexible(
//               flex: 1,
//               child: Text("Bookmarks",
//                   style: TextStyle(
//                       fontWeight: FontWeight.w800,
//                       fontSize: 14,
//                       color: NeumorphicTheme.defaultTextColor(context))),
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
//           child: _buildButton(context),
//         ),
//         SizedBox(
//           width: 10,
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
//         NeumorphicButton(
//           padding: const EdgeInsets.all(18.0),
//           onPressed: () {},
//           style: NeumorphicStyle(
//             intensity: 10,
//             shape: NeumorphicShape.flat,
//             boxShape: NeumorphicBoxShape.circle(),
//           ),
//           child: Image.asset(
//             "assets/images/gplay.png",
//             height: 33,
//             width: 33,
//           ),
//         ),
//         const SizedBox(width: 55),
//         NeumorphicButton(
//           padding: const EdgeInsets.all(18.0),
//           onPressed: () {},
//           style: NeumorphicStyle(
//             intensity: 10,
//             shape: NeumorphicShape.flat,
//             boxShape: NeumorphicBoxShape.circle(),
//           ),
//           child: Image.asset(
//             "assets/images/rate.png",
//             height: 33,
//             width: 33,
//           ),
//         ),
//         const SizedBox(width: 55),
//         NeumorphicButton(
//           padding: const EdgeInsets.all(18.0),
//           onPressed: () {},
//           style: NeumorphicStyle(
//             intensity: 10,
//             shape: NeumorphicShape.flat,
//             boxShape: NeumorphicBoxShape.circle(),
//           ),
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
// }
