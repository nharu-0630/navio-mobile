import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

class PDFService {
  static final PDFService instance = PDFService._init();
  String? _currentPdfPath;

  PDFService._init();

  String? get currentPdfPath => _currentPdfPath;

  Future<String?> pickAndSavePdf() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['pdf'],
      );

      if (result != null) {
        final file = File(result.files.single.path!);
        final directory = await getApplicationDocumentsDirectory();
        final savedFile = await file.copy('${directory.path}/map.pdf');
        _currentPdfPath = savedFile.path;
        return _currentPdfPath;
      }
    } catch (e) {
      debugPrint('Error picking PDF: $e');
    }
    return null;
  }

  Future<String?> downloadPdfFromUrl(String url) async {
    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final directory = await getApplicationDocumentsDirectory();
        final fileName = 'downloaded_map.pdf';
        final filePath = '${directory.path}/$fileName';

        final file = File(filePath);
        await file.writeAsBytes(response.bodyBytes);

        _currentPdfPath = filePath;
        return _currentPdfPath;
      } else {
        debugPrint('Failed to download PDF: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      debugPrint('Error downloading PDF: $e');
      return null;
    }
  }

  Future<String?> loadSavedPdf() async {
    try {
      final directory = await getApplicationDocumentsDirectory();
      final file = File('${directory.path}/map.pdf');
      if (await file.exists()) {
        _currentPdfPath = file.path;
        return _currentPdfPath;
      }
    } catch (e) {
      debugPrint('Error loading saved PDF: $e');
    }
    return null;
  }
}
