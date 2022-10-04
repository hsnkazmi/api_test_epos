import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';
import 'package:material_speed_dial/material_speed_dial.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:theme_provider/theme_provider.dart';

import '../bookmarksinfo.dart';
import '../homepage.dart';

class MyCashedPdf extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
        home: MyHomePage(),
        debugShowCheckedModeBanner: false,
      );
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('flutter_cached_pdfview Demo'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          TextButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute<dynamic>(
                builder: (_) => PDFViewerFromAsset(
                  pdfAssetPath: 'assets/pdf/safar.pdf',
                ),
              ),
            ),
            child: const Text('PDF From Asset'),
          ),
        ],
      ),
    );
  }
}

class PDFViewerFromAsset extends StatelessWidget {
  PDFViewerFromAsset({Key? key, required this.pdfAssetPath}) : super(key: key);
  final String pdfAssetPath;
  final Completer<PDFViewController> _pdfViewController =
      Completer<PDFViewController>();
  final StreamController<String> _pageCountController =
      StreamController<String>();

  @override
  Widget build(BuildContext context) {
    bool mood = ThemeProvider.controllerOf(context).currentThemeId == "light"
        ? false
        : true;

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            PDF(
              enableSwipe: true,
              swipeHorizontal: false,
              autoSpacing: false,
              pageFling: false,
              nightMode: mood,
              onPageChanged: (int? current, int? total) =>
                  _pageCountController.add('${current! + 1}/$total'),
              // _pageCountController.add('${current! + 1} - $total'),
              onViewCreated: (PDFViewController pdfViewController) async {
                _pdfViewController.complete(pdfViewController);
                final int currentPage =
                    await pdfViewController.getCurrentPage() ?? 0;
                final int? pageCount = await pdfViewController.getPageCount();
                _pageCountController.add('${currentPage + 1} - $pageCount');
              },
            ).fromAsset(
              pdfAssetPath,
              errorWidget: (dynamic error) =>
                  Center(child: Text(error.toString())),
            ),
            Positioned(
              top: 0,
              left: 2,
              child: StreamBuilder<String>(
                  stream: _pageCountController.stream,
                  builder: (_, AsyncSnapshot<String> snapshot) {
                    if (snapshot.hasData) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Card(
                          color: Theme.of(context).highlightColor,
                          child: Text(
                            snapshot.data.toString(),
                            style: TextStyle(
                                color: Theme.of(context).bottomAppBarColor),
                          ),
                        ),
                      );
                    }
                    return const SizedBox();
                  }),
            )
          ],
        ),
      ),
      // floatingActionButton: FutureBuilder<PDFViewController>(
      //   future: _pdfViewController.future,
      //   builder: (_, AsyncSnapshot<PDFViewController> snapshot) {
      //     if (snapshot.hasData && snapshot.data != null) {
      //       return Row(
      //         mainAxisSize: MainAxisSize.max,
      //         mainAxisAlignment: MainAxisAlignment.spaceAround,
      //         children: <Widget>[
      //           FloatingActionButton(
      //             heroTag: '-',
      //             child: const Text('-'),
      //             onPressed: () async {
      //               final PDFViewController pdfController = snapshot.data!;
      //               final int currentPage =
      //                   (await pdfController.getCurrentPage())! - 1;
      //               if (currentPage >= 0) {
      //                 await pdfController.setPage(currentPage);
      //               }
      //             },
      //           ),
      //           FloatingActionButton(
      //             heroTag: '+',
      //             child: const Text('+'),
      //             onPressed: () async {
      //               final PDFViewController pdfController = snapshot.data!;
      //               final int currentPage =
      //                   (await pdfController.getCurrentPage())! + 1;
      //               final int numberOfPages =
      //                   await pdfController.getPageCount() ?? 0;
      //               if (numberOfPages > currentPage) {
      //                 await pdfController.setPage(currentPage);
      //               }
      //             },
      //           ),
      //         ],
      //       );
      //     }
      //     return const SizedBox();
      //   },
      // ),
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
            label: LabelWidget(lbl: "Go to Main Menue"),
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
              // createItem({
              //   "page": indexPage + 1,
              //   "date": DateTime.now(),
              //   "sqfoot": "description"
              // });
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
              // if (dialogreslt == null || dialogreslt.isEmpty) return;
              // dialogreslt = await opendialog();
              // if (dialogreslt == null || dialogreslt == dialogreslt.isEmpty)
              //   return;
              // gotopge(int.parse(dialogreslt));
              // setState(() {
              //   this.dialogreslt = dialogreslt;
              // });
              // print(dialogreslt);
            },
          ),
          SpeedDialChild(
            child: ThemeProvider.controllerOf(context).currentThemeId == "light"
                ? Icon(
                    Icons.light_mode_rounded,
                    color: Colors.yellow,
                  )
                : Icon(
                    Icons.dark_mode_rounded,
                    color: Colors.white,
                  ),

            onPressed: ThemeProvider.controllerOf(context).nextTheme,

            // child: Icon(Icons.nightlight),
            backgroundColor: Colors.blueAccent,
            foregroundColor: Colors.white,
            label: LabelWidget(
                lbl: ThemeProvider.controllerOf(context).currentThemeId),
          )
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,

      bottomNavigationBar: _buildBottomBar(context),
    );
  }

  Widget _buildBottomBar(BuildContext context) {
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
            FutureBuilder<PDFViewController>(
              future: _pdfViewController.future,
              builder: (_, AsyncSnapshot<PDFViewController> snapshot) {
                if (snapshot.hasData && snapshot.data != null) {
                  return Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      IconButton(
                        icon: Icon(
                          Icons.arrow_circle_up,
                          size: 40,
                          color: Colors.blueAccent,
                        ),
                        onPressed: () async {
                          final PDFViewController pdfController =
                              snapshot.data!;
                          final int currentPage =
                              (await pdfController.getCurrentPage())! - 1;
                          if (currentPage >= 0) {
                            await pdfController.setPage(currentPage);
                          }
                        },
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.arrow_circle_down,
                          size: 40,
                          color: Colors.blueAccent,
                        ),
                        onPressed: () async {
                          final PDFViewController pdfController =
                              snapshot.data!;
                          final int currentPage =
                              (await pdfController.getCurrentPage())! + 1;
                          final int numberOfPages =
                              await pdfController.getPageCount() ?? 0;
                          if (numberOfPages > currentPage) {
                            await pdfController.setPage(currentPage);
                          }
                        },
                      ),
                    ],
                  );
                }
                return const SizedBox();
              },
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(child: Text(""))
          ],
        ),
      ),
    );
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
