import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:pdf_viewer_plugin/pdf_viewer_plugin.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;

class PdfView extends StatefulWidget {
  final String pdfFileUrl;
  final int id;

  PdfView({this.id, this.pdfFileUrl});
  @override
  _PdfViewerState createState() => _PdfViewerState();
}

class _PdfViewerState extends State<PdfView> {
  Future<String> path;

  @override
  void initState() {
    super.initState();
    loadPdf();
  }

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    var filePath = '$path/${widget.id}.pdf';
    return File(filePath);
  }

Future<Uint8List> fetchPost() async {
    final response = await http.get(widget.pdfFileUrl);
    final responseJson = response.bodyBytes;

    return responseJson;
  }

  loadPdf() async {
    writeCounter(await fetchPost());
    await _localFile.then((onValue) {
      path = Future.value(onValue.path);
    });

    if (!mounted) return;

    setState(() {});
  }

  Future<File> writeCounter(Uint8List stream) async {
    final file = await _localFile;

    /// Write the file
    return file.writeAsBytes(stream);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Certificate"),
        ),
        body: Padding(
            padding: const EdgeInsets.only(top: 18.0, left: 18.0, right: 18.0),
            child: FutureBuilder(
              future: path,
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(child: CircularProgressIndicator());
                }
                var p = snapshot.data;
                return PdfViewer(
                  filePath: p,
                );
              },
            )));
  }
}
