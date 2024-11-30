// pdf_generator.dart
import 'package:syncfusion_flutter_pdf/pdf.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/material.dart';

class RiskoreReportGenerator {
  Future<String> generateCreditReport() async {
    // Create a new PDF document
    final PdfDocument document = PdfDocument();

    // Add pages
    final PdfPage page1 = document.pages.add();
    final PdfPage page2 = document.pages.add();

    // Add header with logo
    _addHeader(page1);

    // Add basic information
    _addBasicInformation(page1);

    // Add financial data
    _addFinancialData(page1);

    // Add risk assessment
    _addRiskAssessment(page2);

    // Save and return file path
    final String path = await _saveDocument(document);
    document.dispose();
    return path;
  }

  void _addHeader(PdfPage page) {
    final PdfGraphics graphics = page.graphics;
    graphics.drawString('RISKORE Credit Assessment Report',
        PdfStandardFont(PdfFontFamily.helvetica, 24, style: PdfFontStyle.bold),
        bounds: const Rect.fromLTWH(50, 20, 500, 40),
        format: PdfStringFormat(alignment: PdfTextAlignment.center));

    graphics.drawString(
        'Generated on: ${DateTime.now().toString().split('.')[0]}',
        PdfStandardFont(PdfFontFamily.helvetica, 12),
        bounds: const Rect.fromLTWH(50, 60, 500, 20),
        format: PdfStringFormat(alignment: PdfTextAlignment.center));
  }

  void _addBasicInformation(PdfPage page) {
    final PdfGrid grid = PdfGrid();
    grid.columns.add(count: 2);
    grid.headers.add(1);

    PdfGridRow header = grid.headers[0];
    header.cells[0].value = 'Basic Information';
    header.cells[1].value = '';

    PdfGridRow row1 = grid.rows.add();
    row1.cells[0].value = 'Name';
    row1.cells[1].value = 'John Doe';

    PdfGridRow row2 = grid.rows.add();
    row2.cells[0].value = 'Age';
    row2.cells[1].value = '25';

    PdfGridRow row3 = grid.rows.add();
    row3.cells[0].value = 'Employment Status';
    row3.cells[1].value = 'Employed';

    PdfGridRow row4 = grid.rows.add();
    row4.cells[0].value = 'Monthly Income';
    row4.cells[1].value = 'RM 5,000';

    grid.draw(page: page, bounds: const Rect.fromLTWH(50, 100, 500, 0));
  }

  void _addFinancialData(PdfPage page) {
    final PdfGrid grid = PdfGrid();
    grid.columns.add(count: 2);
    grid.headers.add(1);

    PdfGridRow header = grid.headers[0];
    header.cells[0].value = 'Financial Information';
    header.cells[1].value = '';

    // Bank Account Information
    PdfGridRow row1 = grid.rows.add();
    row1.cells[0].value = 'Bank Balance';
    row1.cells[1].value = 'RM 10,000';

    // E-Wallet Information
    PdfGridRow row2 = grid.rows.add();
    row2.cells[0].value = 'E-Wallet Balance';
    row2.cells[1].value = 'RM 500';

    // Bill Payment History
    PdfGridRow row3 = grid.rows.add();
    row3.cells[0].value = 'Bill Payment Score';
    row3.cells[1].value = '95/100';

    // Digital Platform Activity
    PdfGridRow row4 = grid.rows.add();
    row4.cells[0].value = 'Monthly Transactions';
    row4.cells[1].value = '45';

    grid.draw(page: page, bounds: const Rect.fromLTWH(50, 300, 500, 0));
  }

  void _addRiskAssessment(PdfPage page) {
    final PdfGrid grid = PdfGrid();
    grid.columns.add(count: 2);
    grid.headers.add(1);

    PdfGridRow header = grid.headers[0];
    header.cells[0].value = 'Risk Assessment';
    header.cells[1].value = '';

    PdfGridRow row1 = grid.rows.add();
    row1.cells[0].value = 'Credit Score';
    row1.cells[1].value = '750/850';

    PdfGridRow row2 = grid.rows.add();
    row2.cells[0].value = 'Risk Category';
    row2.cells[1].value = 'Low Risk';

    PdfGridRow row3 = grid.rows.add();
    row3.cells[0].value = 'Payment Consistency';
    row3.cells[1].value = '98%';

    PdfGridRow row4 = grid.rows.add();
    row4.cells[0].value = 'Recommendation';
    row4.cells[1].value = 'Eligible for Credit Card';

    grid.draw(page: page, bounds: const Rect.fromLTWH(50, 100, 500, 0));
  }

  Future<String> _saveDocument(PdfDocument document) async {
    // Get the current directory path
    // String currentDir = Directory.current.path;
    // // Create path to lib/pdf folder
    // final String path = '$currentDir/lib/pdf';

    // // Create the pdf directory if it doesn't exist
    // await Directory(path).create(recursive: true);

    // Create file path and save
    final File file = File('credit_report.pdf');
    await file.writeAsBytes(await document.save());
    return file.path;
  }
}
