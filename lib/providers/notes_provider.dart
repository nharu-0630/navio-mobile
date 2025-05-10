import 'package:flutter/foundation.dart';

import '../../models/note.dart';
import '../../services/database_helper.dart';

class NotesProvider with ChangeNotifier {
  List<Note> _notes = [];
  bool _isLoading = false;

  List<Note> get notes => _notes;
  bool get isLoading => _isLoading;

  Future<void> loadNotes() async {
    _isLoading = true;
    notifyListeners();

    try {
      _notes = await DatabaseHelper.instance.getNotes();
    } catch (e) {
      debugPrint('Error loading notes: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> addNote(String content) async {
    final note = Note(content: content, createdAt: DateTime.now());

    try {
      final id = await DatabaseHelper.instance.createNote(note);
      _notes.insert(
        0,
        Note(id: id, content: content, createdAt: DateTime.now()),
      );
      notifyListeners();
    } catch (e) {
      debugPrint('Error adding note: $e');
    }
  }

  Future<void> updateNote(Note note) async {
    try {
      await DatabaseHelper.instance.updateNote(note);
      final index = _notes.indexWhere((n) => n.id == note.id);
      if (index >= 0) {
        _notes[index] = note;
        notifyListeners();
      }
    } catch (e) {
      debugPrint('Error updating note: $e');
    }
  }

  Future<void> deleteNote(int id) async {
    try {
      await DatabaseHelper.instance.deleteNote(id);
      _notes.removeWhere((note) => note.id == id);
      notifyListeners();
    } catch (e) {
      debugPrint('Error deleting note: $e');
    }
  }
}
