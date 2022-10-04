// import 'dart:io';
// import 'package:flutter_neumorphic_null_safety/flutter_neumorphic.dart';
// import 'package:flutter/material.dart';
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
//           return MaterialApp(
//             debugShowCheckedModeBanner: false,
//             title: 'Flutter Demo',
//             themeMode: darkMode ? ThemeMode.dark : ThemeMode.light,
//             theme: ThemeData(
//               scaffoldBackgroundColor: Colors.white,
//               textTheme: Theme.of(context).textTheme.apply(
//                     displayColor: Colors.black,
//                   ),
//             ),
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
//     var size = MediaQuery.of(context).size;

//     return Scaffold(
//       bottomNavigationBar: _buildControlsBar(context),
//       body: SafeArea(
//         child: Column(
//           children: [
//             Stack(children: [
//               Container(
//                 alignment: Alignment.topCenter,
//                 padding: EdgeInsets.only(
//                     top: size.height * .12 - 20,
//                     left: size.width * .1,
//                     right: size.width * .02),
//                 height: size.height * .48 - 90,
//                 decoration: BoxDecoration(
//                     image: DecorationImage(
//                       image: AssetImage("assets/images/bg.png"),
//                       fit: BoxFit.fitWidth,
//                     ),
//                     borderRadius: BorderRadius.only(
//                       bottomLeft: Radius.circular(50),
//                       bottomRight: Radius.circular(50),
//                     ),
//                     color: Colors.black),
//                 child: BookInfo(context, size),
//               ),

//               // todo theme changer
//               Align(
//                 alignment: Alignment.topRight,
//                 child: NeumorphicButton(
//                   // padding: const EdgeInsets.all(18.0),
//                   onPressed: () {
//                     darkMode = !darkMode;
//                     thmclass.updateItem(item: {
//                       "darkmode": darkMode,
//                     });
//                   },
//                   style: NeumorphicStyle(
//                     intensity: 100,
//                     shape: NeumorphicShape.flat,
//                     boxShape: NeumorphicBoxShape.circle(),
//                   ),
//                   child: ImageIcon(
//                     AssetImage("assets/images/night.png"),
//                     color: darkMode ? Colors.white : _iconsColor(),
//                   ),
//                 ),
//               ),
//             ]),
//             Expanded(child: Bookmarksinfo()),
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
//       child: Align(
//         alignment: Alignment.centerRight,
//         child: NeumorphicButton(
//           padding: const EdgeInsets.all(18.0),
//           onPressed: () {
//             darkMode = !darkMode;
//             thmclass.updateItem(item: {
//               "darkmode": darkMode,
//             });
//           },
//           style: NeumorphicStyle(
//             intensity: 100,
//             shape: NeumorphicShape.flat,
//             boxShape: NeumorphicBoxShape.circle(),
//           ),
//           child: ImageIcon(
//             AssetImage("assets/images/night.png"),
//             color: darkMode ? Colors.white : _iconsColor(),
//           ),
//         ),
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
//           padding: const EdgeInsets.all(8.0),
//           onPressed: () {},
//           style: NeumorphicStyle(
//             intensity: 10,
//             shape: NeumorphicShape.flat,
//             boxShape: NeumorphicBoxShape.circle(),
//           ),
//           child: Image.asset(
//             "assets/images/gplay.png",
//             height: 13,
//             width: 33,
//           ),
//         ),
//         const SizedBox(width: 55),
//         NeumorphicButton(
//           padding: const EdgeInsets.all(8.0),
//           onPressed: () {},
//           style: NeumorphicStyle(
//             intensity: 10,
//             shape: NeumorphicShape.flat,
//             boxShape: NeumorphicBoxShape.circle(),
//           ),
//           child: Image.asset(
//             "assets/images/rate.png",
//             height: 13,
//             width: 33,
//           ),
//         ),
//         const SizedBox(width: 55),
//         NeumorphicButton(
//           padding: const EdgeInsets.all(8.0),
//           onPressed: () {},
//           style: NeumorphicStyle(
//             intensity: 10,
//             shape: NeumorphicShape.flat,
//             boxShape: NeumorphicBoxShape.circle(),
//           ),
//           child: Image.asset(
//             "assets/images/privacy.png",
//             height: 13,
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

//   Widget BookInfo(BuildContext context, Size size) {
//     return Container(
//       child: Flex(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         direction: Axis.horizontal,
//         children: <Widget>[
//           Expanded(
//               flex: 1,
//               child: Column(
//                 children: <Widget>[
//                   Container(
//                     alignment: Alignment.centerLeft,
//                     child: Text(
//                       "امر بیل",
//                       style: Theme.of(context)
//                           .textTheme
//                           .headline4
//                           ?.copyWith(fontSize: 38, fontFamily: 'urdu'),
//                     ),
//                   ),
//                   Container(
//                     margin: EdgeInsets.only(top: size.height * .005),
//                     alignment: Alignment.centerLeft,
//                     padding: EdgeInsets.only(top: 0),
//                     child: Text(
//                       "Influence",
//                       style: Theme.of(context).textTheme.subtitle1?.copyWith(
//                             fontSize: 25,
//                             fontWeight: FontWeight.bold,
//                           ),
//                     ),
//                   ),
//                   Row(
//                     children: <Widget>[
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         children: <Widget>[
//                           Container(
//                             width: size.width * .3,
//                             padding: EdgeInsets.only(top: size.height * .02),
//                             child: Text(
//                               "",
//                               maxLines: 5,
//                               style: TextStyle(
//                                 fontSize: 10,
//                                 color: Colors.black45,
//                               ),
//                             ),
//                           ),
//                           Container(
//                             margin: EdgeInsets.only(top: size.height * .015),
//                             padding: EdgeInsets.only(left: 10, right: 10),
//                             decoration: BoxDecoration(
//                               color: Colors.white,
//                               borderRadius: BorderRadius.circular(30),
//                             ),
//                             child: FlatButton(
//                               onPressed: (() async {
//                                 final path = 'assets/pdf/safar.pdf';
//                                 final file = await PDFApi.loadAsset(path);
//                                 openPDF(context, file);
//                               }),
//                               child: Text(
//                                 "Read",
//                                 style: TextStyle(fontWeight: FontWeight.bold),
//                               ),
//                             ),
//                           )
//                         ],
//                       ),
//                       Column(
//                         children: <Widget>[
//                           IconButton(
//                             icon: Icon(
//                               Icons.favorite_border,
//                               size: 20,
//                               color: Colors.grey,
//                             ),
//                             onPressed: () {},
//                           ),
//                           // BookRating(score: 4.9),
//                         ],
//                       )
//                     ],
//                   )
//                 ],
//               )),
//           Expanded(
//               flex: 1,
//               child: Container(
//                 color: Colors.transparent,
//                 child: Image.asset(
//                   "assets/images/amar.png",
//                   height: double.infinity,
//                   alignment: Alignment.topRight,
//                   fit: BoxFit.fitWidth,
//                 ),
//               )),
//         ],
//       ),
//     );
//   }
// }
