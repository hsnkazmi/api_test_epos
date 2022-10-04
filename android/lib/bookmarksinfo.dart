import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:myreader/pdf_api.dart';
import 'package:myreader/pdfviewnew.dart';

class Bookmarksinfo extends StatefulWidget {
  const Bookmarksinfo({Key? key}) : super(key: key);

  @override
  State<Bookmarksinfo> createState() => _BookmarksinfoState();
}

class _BookmarksinfoState extends State<Bookmarksinfo> {
  List<Map<String, dynamic>> _items = [];

  String page = "";

  String date = "";

  String sqfoot = "";
  int? existingkey;
  bool formvisibility = false;
  final _raqbaBox = Hive.box('raqba_box');
  @override
  void initState() {
    // TODO: implement initState
    refreshItems();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Column(
      children: [
        const Text("saved bookmarks"),
        Flexible(
          flex: 3,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                flex: 1,
                child: Container(
                  child: _items.isEmpty
                      ? const Flexible(
                          child: Center(
                            child: Text(
                              "Bookmarks Empty",
                              style: TextStyle(fontSize: 30),
                            ),
                          ),
                        )
                      : ListView.builder(
                          shrinkWrap: true,
                          itemCount: _items.length,
                          itemBuilder: (_, index) {
                            final currentItem = _items[index];
                            if (currentItem['page'] != null) {
                              // return Card(
                              //   child: ListTile(
                              //     onTap: (() async {
                              //       int pagee = currentItem['page'];
                              //       final path = 'assets/pdf/safar.pdf';
                              //       final file = await PDFApi.loadAsset(path);
                              //       openPDF(context, file, pagee);
                              //     }),
                              //     title: Row(
                              //       children: [
                              //         Text("${_items.length - index - 1} : "),
                              //         Expanded(
                              //           child: Text(
                              //               "Page# ${currentItem['page']} "),
                              //         ),
                              //       ],
                              //     ),
                              //     subtitle: Text(
                              //         "${currentItem['date'].day}-${currentItem['date'].month}-${currentItem['date'].year}"),
                              //     trailing: Row(
                              //       mainAxisSize: MainAxisSize.min,
                              //       children: [
                              //         // Delete button
                              //         IconButton(
                              //           icon: const Icon(
                              //             Icons.delete,
                              //             color: Colors.red,
                              //           ),
                              //           onPressed: () =>
                              //               _deleteItem(currentItem['key']),
                              //         ),
                              //       ],
                              //     ),
                              //   ),
                              // );

                              return Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 30),
                                margin: const EdgeInsets.only(bottom: 16),
                                width: size.width - 48,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(38.5),
                                  boxShadow: [
                                    BoxShadow(
                                      offset: const Offset(0, 10),
                                      blurRadius: 33,
                                      color: const Color(0xFFD3D3D3)
                                          .withOpacity(.84),
                                    ),
                                  ],
                                ),
                                child: InkWell(
                                  onTap: (() async {
                                    int pagee = currentItem['page'];
                                    const path = 'assets/pdf/safar.pdf';
                                    final file = await PDFApi.loadAsset(path);
                                    openPDF(context, file, pagee);
                                  }),
                                  child: Row(
                                    children: <Widget>[
                                      RichText(
                                        text: TextSpan(
                                          children: [
                                            TextSpan(
                                              text:
                                                  "${_items.length - index - 1}: Page ${currentItem['page']} \n",
                                              style: const TextStyle(
                                                fontSize: 16,
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            TextSpan(
                                              text:
                                                  "${currentItem['date'].day}-${currentItem['date'].month}-${currentItem['date'].year} ${currentItem['date'].hour}:${currentItem['date'].minute}:${currentItem['date'].second}",
                                              style: TextStyle(
                                                  color: Theme.of(context)
                                                      .hintColor),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const Spacer(),
                                      IconButton(
                                          icon: const Icon(
                                            Icons.delete_forever,
                                            size: 18,
                                            color: Colors.red,
                                          ),
                                          onPressed: () {
                                            _deleteItem(currentItem['key']);
                                          })
                                    ],
                                  ),
                                ),
                              );
                            } else
                              //currentItem.keys.toString()
                              return const Text("");
                          }),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // Delete a single item
  Future<void> _deleteItem(int itemKey) async {
    await _raqbaBox.delete(itemKey);
    refreshItems(); // update the UI

    // Display a snackbar
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text("Book Mark Deleted")));
  }

// Get all items from the database
  void refreshItems() {
    final data = _raqbaBox.keys.map((key) {
      final value = _raqbaBox.get(key);
      return {
        "key": key,
        "page": value["page"],
        "date": value['date'],
        "sqfoot": value['sqfoot']
      };
    }).toList();

    setState(() {
      _items = data.reversed.toList();
      // we use "reversed" to sort items in order from the latest to the oldest
    });
  }

// delete all data
  Future<void> _clearall() async {
    await _raqbaBox.clear();
    refreshItems();
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text("cleared")));
  }

// gotopaage
  void openPDF(BuildContext context, File file, int pagee) =>
      Navigator.of(context).push(
        MaterialPageRoute(
            builder: (context) => PDFViewerPage(
                  file: file,
                  crntpage: pagee,
                )),
      );
}
