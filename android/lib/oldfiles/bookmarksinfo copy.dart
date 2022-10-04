// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:hive_flutter/hive_flutter.dart';
// import 'package:myreader/pdf_api.dart';
// import 'package:myreader/pdfviewnew.dart';
// // import 'package:provider/provider.dart';
// // import 'package:shajrasadaat/models/providerdata.dart';
// // import 'package:shajrasadaat/screens/pdfview_page.dart';

// // import '../widgets/texfild.dart';

// class Bookmarksinfo extends StatefulWidget {
//   Bookmarksinfo({Key? key}) : super(key: key);

//   @override
//   State<Bookmarksinfo> createState() => _BookmarksinfoState();
// }

// class _BookmarksinfoState extends State<Bookmarksinfo> {
//   List<Map<String, dynamic>> _items = [];

//   String page = "";

//   String date = "";

//   String sqfoot = "";
//   int? existingkey;
//   bool formvisibility = false;
//   final _raqbaBox = Hive.box('raqba_box');
//   @override
//   void initState() {
//     // TODO: implement initState
//     refreshItems();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final bgcolor = Color(0xFFE7ECEF);
//     return Scaffold(
//       backgroundColor: bgcolor,
//       appBar: AppBar(
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//         title: const Text(
//           'Saved BookMarks',
//           style: TextStyle(
//               fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black87),
//         ),
//         leading: BackButton(
//           color: Colors.black,
//         ),
//       ),
//       body: SafeArea(
//         child: Column(
//           children: [
//             // Row(
//             //   children: [
//             //     Expanded(
//             //         child: Center(
//             //             child: Text(
//             //       "Bookmarks",
//             //       style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
//             //     ))),
//             //     IconButton(
//             //       icon: Icon(Icons.refresh),
//             //       onPressed: () {
//             //         refreshItems();
//             //       },
//             //     ),
//             //     IconButton(
//             //       icon: Icon(Icons.clear),
//             //       onPressed: () {
//             //         _clearall();
//             //       },
//             //     ),
//             //   ],
//             // ),
//             Flexible(
//               flex: 3,
//               child: Row(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Flexible(
//                     flex: 1,
//                     child: Container(
//                       decoration: BoxDecoration(
//                           border: Border.all(color: Colors.white)),
//                       child: _items.isEmpty
//                           ? Flexible(
//                               child: const Center(
//                                 child: Text(
//                                   "Bookmarks Empty",
//                                   style: TextStyle(fontSize: 30),
//                                 ),
//                               ),
//                             )
//                           : ListView.builder(
//                               shrinkWrap: true,
//                               itemCount: _items.length,
//                               itemBuilder: (_, index) {
//                                 final currentItem = _items[index];
//                                 if (currentItem['page'] != null) {
//                                   return Card(
//                                     child: ListTile(
//                                       onTap: (() async {
//                                         int pagee = currentItem['page'];
//                                         final path = 'assets/pdf/safar.pdf';
//                                         final file =
//                                             await PDFApi.loadAsset(path);
//                                         openPDF(context, file, pagee);
//                                       }),
//                                       title: Row(
//                                         children: [
//                                           Text(
//                                               "${_items.length - index - 1} : "),
//                                           Expanded(
//                                             child: Text(
//                                                 "Page# ${currentItem['page']} "),
//                                           ),
//                                         ],
//                                       ),
//                                       subtitle: Text(
//                                           "${currentItem['date'].day}-${currentItem['date'].month}-${currentItem['date'].year}"),
//                                       trailing: Row(
//                                         mainAxisSize: MainAxisSize.min,
//                                         children: [
//                                           // Delete button
//                                           IconButton(
//                                             icon: const Icon(
//                                               Icons.delete,
//                                               color: Colors.red,
//                                             ),
//                                             onPressed: () =>
//                                                 _deleteItem(currentItem['key']),
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                   );
//                                 } else
//                                   //currentItem.keys.toString()
//                                   return Text("");
//                               }),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   // Delete a single item
//   Future<void> _deleteItem(int itemKey) async {
//     await _raqbaBox.delete(itemKey);
//     refreshItems(); // update the UI

//     // Display a snackbar
//     ScaffoldMessenger.of(context)
//         .showSnackBar(const SnackBar(content: Text("Book Mark Deleted")));
//   }

// // Get all items from the database
//   void refreshItems() {
//     final data = _raqbaBox.keys.map((key) {
//       final value = _raqbaBox.get(key);
//       return {
//         "key": key,
//         "page": value["page"],
//         "date": value['date'],
//         "sqfoot": value['sqfoot']
//       };
//     }).toList();

//     setState(() {
//       _items = data.reversed.toList();
//       // we use "reversed" to sort items in order from the latest to the oldest
//     });
//   }

// // delete all data
//   Future<void> _clearall() async {
//     await _raqbaBox.clear();
//     refreshItems(); // update the UI

//     // Display a snackbar
//     ScaffoldMessenger.of(context)
//         .showSnackBar(const SnackBar(content: Text("cleared")));
//   }

// // gotopaage
//   void openPDF(BuildContext context, File file, int pagee) =>
//       Navigator.of(context).push(
//         MaterialPageRoute(
//             builder: (context) => PDFViewerPage(
//                   file: file,
//                   crntpage: pagee,
//                 )),
//       );
// }
