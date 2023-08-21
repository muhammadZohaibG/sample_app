import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PDFVU extends StatefulWidget {
  const PDFVU({super.key});

  @override
  State<PDFVU> createState() => _PDFVUState();
}

class _PDFVUState extends State<PDFVU> {
  @override
  void setState(VoidCallback fn) {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text('View'),
      ),
      body: SfPdfViewer.asset(
        'assets/mzr.pdf',
      ),
    ));
  }
}
