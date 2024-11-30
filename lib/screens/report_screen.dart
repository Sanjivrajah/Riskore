// import 'package:flutter/material.dart';
// import 'package:syncfusion_flutter_pdf/pdf.dart';
// import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:share_plus/share_plus.dart';
// import 'dart:io';

// class ReportScreen extends StatelessWidget {
//   Future<String> generateCreditReport() async {
//     final PdfDocument document = PdfDocument();
//     final PdfPage page1 = document.pages.add();
//     final PdfPage page2 = document.pages.add();

//     // Add header
//     final PdfGraphics graphics = page1.graphics;
//     graphics.drawString('RISKORE Credit Assessment Report',
//         PdfStandardFont(PdfFontFamily.helvetica, 24, style: PdfFontStyle.bold),
//         bounds: const Rect.fromLTWH(50, 20, 500, 40),
//         format: PdfStringFormat(alignment: PdfTextAlignment.center));

//     // Bank Account Information
//     _addSection(
//         page1,
//         'Bank Account Information',
//         [
//           {'Account Balance': 'RM 5,000'},
//           {'Transaction History': '45 transactions'},
//           {'Income Deposits': 'Monthly: RM 3,500'},
//           {'Recurring Payments': '3 active'}
//         ],
//         100);

//     // Digital Platform Activity
//     _addSection(
//         page1,
//         'Digital Platform Activity',
//         [
//           {'Online Shopping': 'Active User'},
//           {'Monthly Transactions': '25'},
//           {'Subscription Services': '4 active'},
//           {'Average Spend': 'RM 500/month'}
//         ],
//         250);

//     // E-Wallet Usage
//     _addSection(
//         page2,
//         'E-Wallet Data',
//         [
//           {'Balance': 'RM 300'},
//           {'Transaction History': '30 transactions'},
//           {'Frequency of Use': 'Daily'},
//           {'Transaction Types': 'QR, Transfer, Bills'}
//         ],
//         100);

//     // Save document
//     final Directory directory = await getApplicationDocumentsDirectory();
//     final String path = '${directory.path}/credit_report.pdf';
//     final File file = File(path);
//     await file.writeAsBytes(await document.save());
//     document.dispose();
//     return path;
//   }

//   void _addSection(PdfPage page, String title, List<Map<String, String>> data,
//       double yPosition) {
//     final PdfGrid grid = PdfGrid();
//     grid.columns.add(count: 2);
//     grid.headers.add(1);

//     PdfGridRow header = grid.headers[0];
//     header.cells[0].value = title;
//     header.cells[1].value = '';

//     for (var item in data) {
//       item.forEach((key, value) {
//         PdfGridRow row = grid.rows.add();
//         row.cells[0].value = key;
//         row.cells[1].value = value;
//       });
//     }

//     grid.draw(page: page, bounds: Rect.fromLTWH(50, yPosition, 500, 0));
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Credit Report'),
//         actions: [
//           IconButton(
//             icon: Icon(Icons.share),
//             onPressed: () async {
//               final path = await generateCreditReport();
//               final xFile = XFile(path);
//               await Share.shareXFiles([xFile], text: 'RISKORE Credit Report');
//             },
//           ),
//         ],
//       ),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           ElevatedButton(
//             onPressed: () async {
//               final path = await generateCreditReport();
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => Scaffold(
//                     appBar: AppBar(title: Text('Credit Report Preview')),
//                     body: SfPdfViewer.file(File(path)),
//                   ),
//                 ),
//               );
//             },
//             child: Text('Generate and View Report'),
//           ),
//         ],
//       ),
//     );
//   }
// }
