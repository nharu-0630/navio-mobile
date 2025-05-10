import 'package:flutter/foundation.dart';

import '../../services/pdf_service.dart';

class PDFMapProvider with ChangeNotifier {
  String? _pdfPath;
  bool _isLoading = false;

  String? get pdfPath => _pdfPath;
  bool get isLoading => _isLoading;

  Future<void> loadSavedMap() async {
    _isLoading = true;
    notifyListeners();

    try {
      _pdfPath = await PDFService.instance.loadSavedPdf();
    } catch (e) {
      debugPrint('Error loading saved map: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> pickAndSaveMap() async {
    _isLoading = true;
    notifyListeners();

    try {
      _pdfPath = await PDFService.instance.pickAndSavePdf();
    } catch (e) {
      debugPrint('Error picking and saving map: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> downloadMapFromUrl(String url) async {
    _isLoading = true;
    notifyListeners();

    try {
      _pdfPath = await PDFService.instance.downloadPdfFromUrl(url);
    } catch (e) {
      debugPrint('Error downloading map from URL: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
