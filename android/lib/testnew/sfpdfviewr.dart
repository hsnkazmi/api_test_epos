// import 'package:flutter/material.dart';
// import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
// // import '../models/providerdata.dart';

// /// Represents PdfViewPage for Navigation
// class PdfViewPage extends StatefulWidget {
//   int crntpage;
//   PdfViewPage({this.crntpage = 1});
//   @override
//   _PdfViewPage createState() => _PdfViewPage();
// }

// class _PdfViewPage extends State<PdfViewPage> {
//   final GlobalKey<SfPdfViewerState> _pdfViewerKey = GlobalKey();

//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Syncfusion Flutter PDF Viewer'),
//         actions: <Widget>[
//           IconButton(
//             icon: const Icon(
//               Icons.bookmark,
//               color: Colors.white,
//               semanticLabel: 'Bookmark',
//             ),
//             onPressed: () {
//               _pdfViewerKey.currentState?.openBookmarkView();
//             },
//           ),
//         ],
//       ),
//       body: SfPdfViewer.asset(
//         'assets/pdf/safar.pdf',
//         key: _pdfViewerKey,
//       ),
//     );
//   }
// }
