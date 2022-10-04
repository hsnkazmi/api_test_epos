import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:path/path.dart' show basename;
import 'package:material_speed_dial/material_speed_dial.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'bookmarksinfo.dart';
import 'homepage.dart';

class PDFViewerPage extends StatefulWidget {
  final File file;
  final int? crntpage;
  const PDFViewerPage({Key? key, required this.file, this.crntpage})
      : super(key: key);

  @override
  _PDFViewerPageState createState() => _PDFViewerPageState();
}

class _PDFViewerPageState extends State<PDFViewerPage> {
  late final PDFViewController controller;
  int pages = 0;
  int indexPage = 0;
  String text = "";
  bool nightmode = false;
  int defalutpg = 0;
  final _raqbaBox = Hive.box('raqba_box');
  final _themeBox = Hive.box('theme_box');
  TextEditingController textcontroller = TextEditingController();
  String dialogreslt = "1";
  @override
  void initState() {
    if (_darkmode() != null) {
      nightmode = _darkmode();
    }
    super.initState();
    if (_readItem() == null) {
      _updateItem(item: {
        "pagenow": 1,
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.crntpage == null) {
      defalutpg = _readItem();
    } else {
      defalutpg = widget.crntpage!;
    }
    // defalutpage = defalutpg;
    final name = basename(widget.file.path);
    text = '${indexPage + 1} of $pages';
    TextEditingController textcontroller = TextEditingController();
    String dialogreslt = "1";
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(name),
      //   actions: pages >= 2
      //       ? [
      //           Center(child: Text(text)),
      //           IconButton(
      //             icon: Icon(Icons.chevron_left, size: 32),
      //             onPressed: () {
      //               final page = indexPage == 0 ? pages : indexPage - 1;
      //               controller.setPage(page);
      //             },
      //           ),
      //           IconButton(
      //             icon: Icon(Icons.chevron_right, size: 32),
      //             onPressed: () {
      //               final page = indexPage == pages - 1 ? 0 : indexPage + 1;
      //               controller.setPage(page);
      //             },
      //           ),
      //           IconButton(
      //             onPressed: () {},
      //             icon: Icon(Icons.chevron_right, size: 32),
      //           )
      //         ]
      //       : null,
      // ),
      body: SafeArea(
        child: PDFView(
          defaultPage: defalutpg,
          nightMode: nightmode,
          filePath: widget.file.path,
          // autoSpacing: false,
          // swipeHorizontal: true,
          pageSnap: false,
          pageFling: true,
          onRender: (pages) => setState(() => this.pages = pages!),
          onViewCreated: (controller) =>
              setState(() => this.controller = controller),
          onPageChanged: (indexPage, _) {
            setState(() {
              this.indexPage = indexPage!;
              _updateItem(item: {
                "pagenow": indexPage,
              });
            });
          },
        ),
      ),
      floatingActionButton: SpeedDial(
        invokeAfterClosing: true,
        child: Icon(Icons.settings),
        expandedChild: Icon(Icons.close),
        backgroundColor: Colors.blue,
        // expandedBackgroundColor: Colors.black,
        children: [
          SpeedDialChild(
            child: Icon(Icons.home),
            // backgroundColor: Colors.blue,
            // foregroundColor: Colors.white,
            label:
                // Text('Go to Main Menue',
                //     textAlign: TextAlign.right,
                //     style: TextStyle(
                //       height: 2,
                //       fontSize: 15.0,
                //       letterSpacing: 1,
                //       fontWeight: FontWeight.bold,
                //       backgroundColor: Theme.of(context).bottomAppBarColor,
                //     )),
                LabelWidget(lbl: "Go to Main Menue"),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AudioPlayerSample()),
            ),
          ),
          SpeedDialChild(
            child: Icon(Icons.bookmark_add),
            backgroundColor: Colors.red,
            foregroundColor: Colors.white,
            label: LabelWidget(lbl: 'Add to Bookmarks'),
            onPressed: () {
              createItem({
                "page": indexPage + 1,
                "date": DateTime.now(),
                "sqfoot": "description"
              });
            },
          ),

          SpeedDialChild(
            child: Icon(Icons.bookmark_added),
            backgroundColor: Colors.green,
            foregroundColor: Colors.white,
            label: LabelWidget(
              lbl: 'Go to Bookmarks',
            ),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Bookmarksinfo()),
            ),
          ),
          SpeedDialChild(
            child: Icon(Icons.content_paste_go_rounded),
            backgroundColor: Colors.amber,
            foregroundColor: Colors.white,
            label: LabelWidget(lbl: 'Go to Page'),
            onPressed: () async {
              if (dialogreslt == null || dialogreslt.isEmpty) return;
              dialogreslt = await opendialog();
              if (dialogreslt == null || dialogreslt == dialogreslt.isEmpty)
                return;
              gotopge(int.parse(dialogreslt));
              setState(() {
                this.dialogreslt = dialogreslt;
              });
              print(dialogreslt);
            },
          ),
          // SpeedDialChild(
          //   child: Icon(Icons.nightlight),
          //   backgroundColor: Colors.blueAccent,
          //   foregroundColor: Colors.white,
          //   label: Text('Night Mode', style: TextStyle(fontSize: 18.0)),
          //   onPressed: () => setState(() {
          //     nightmode = true;
          //     print(nightmode);
          //   }),
          // ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      bottomNavigationBar: _buildBottomBar(),
    );
  }

  Widget _buildBottomBar() {
    return BottomAppBar(
      shape: CircularNotchedRectangle(),
      notchMargin: 4.0,
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            IconButton(
                onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AudioPlayerSample()),
                    ),
                icon: Icon(
                  Icons.home_outlined,
                  size: 40,
                  color: Colors.blueAccent,
                )),
            IconButton(
              icon: Icon(
                Icons.arrow_circle_down,
                size: 40,
                color: Colors.blueAccent,
              ),
              onPressed: () {
                final page = indexPage == 0 ? pages : indexPage - 1;
                controller.setPage(page);
              },
            ),
            IconButton(
              icon: Icon(
                Icons.arrow_circle_up,
                size: 40,
                color: Colors.blueAccent,
              ),
              onPressed: () {
                final page = indexPage == pages - 1 ? 0 : indexPage + 1;
                controller.setPage(page);
              },
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            Expanded(child: Text(""))
          ],
        ),
      ),
    );
  }

  String gotopagetitle = "Go to Page";
  String BookMarksdeskription = "Desc";
//todo:  Functions
  Future opendialog() {
    return showDialog(
      context: context,
      builder: ((context) => AlertDialog(
            // contentPadding: EdgeInsets.zero,
            // title: Text(dialogtype ? gotopagetitle : BookMarksdeskription),
            title: Text(gotopagetitle),
            content: TextField(
              controller: textcontroller,
              decoration: InputDecoration(
                  alignLabelWithHint: true, label: Text(gotopagetitle)),
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Onpressed:
                    dialogsubmit();
                  },
                  child: Text("submit"))
            ],
          )),
    );
  }

  void dialogsubmit() {
    Navigator.of(context).pop(textcontroller.text);
    textcontroller.clear();
  }

//todo: go to page by model
  void gotopge(int pagenumber) {
    controller.setPage(pagenumber);
  }

//todo add into database
  Future<void> createItem(Map<String, dynamic> newItem) async {
    await _raqbaBox.add(newItem);
  }

  //todo read single item from the database by using its key
  int _readItem() {
    final item = _raqbaBox.get(0);
    if (item == null) {
      return 0;
    } else
      return item['pagenow'];
  }

  // Update a single item
  Future<void> _updateItem({required Map<String, dynamic> item}) async {
    final firstvalue = _raqbaBox.get(0);
    if (firstvalue != null) {
      await _raqbaBox.put(0, item);
      _readItem();
    } else {
      print("not updated");
      createItem(item);
    }
  }

  _darkmode() {
    final item = _themeBox.get(0);
    return item['darkmode'];
  }
}

class LabelWidget extends StatelessWidget {
  final lbl;
  const LabelWidget({
    Key? key,
    this.lbl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(lbl),
      ),
    );
  }
}
