import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:note_app/features/note/domain/model/note.dart';
import 'package:note_app/features/note/domain/model/note_id.dart';
import 'package:note_app/features/note/presentation/view_model/note_list/note_list_viewmodel.dart';

final noteFormViewModelProvider =
    Provider.autoDispose.family<NoteFormViewModel, Note?>((ref, note) {
  final noteListViewModel =
      ref.watch(noteListViewModelStateNotifierProvider.notifier);
  return NoteFormViewModel(note, noteListViewModel);
});

class NoteFormViewModel {
  late NoteId _id;
  final NoteListViewModel _noteListViewModel;
  var _title = '';
  var _content = '';
  var _createdDate = DateTime.now();
  var _isNewNote = false;

  NoteFormViewModel(final Note? note, this._noteListViewModel) {
    _initNote(note);
  }

  _initNote(final Note? note) {
    if (note == null) {
      _isNewNote = true;
    } else {
      _id = note.id;
      _title = note.title;
      _content = note.content;
      _createdDate = note.created;
    }
  }

  createOrUpdateNote() {
    if (_isNewNote) {
      _noteListViewModel.addNote(_title, _content, _createdDate);
    } else {
      final note = Note(
        id: _id,
        title: _title,
        content: _content,
        created: _createdDate,
      );
      _noteListViewModel.updateNote(note);
    }
  }

  deleteNote() {
    if (!_isNewNote) _noteListViewModel.deleteNote(_id);
  }

  String appBarTitle() => _isNewNote ? 'Add Note' : 'Edit Note';

  String initialTitleValue() => _title;

  String initialContentValue() => _content;

  DateTime initialCreatedDateValue() => _createdDate;

  DateTime datePickerFirstDate() => DateTime(DateTime.now().year - 5, 1, 1);

  DateTime datePickerLastDate() => DateTime(DateTime.now().year + 5, 12, 31);

  bool shouldShowDeleteNoteIcon() => !_isNewNote;

  setTitle(final String value) => _title = value;

  setContent(final String value) => _content = value;

  setCreatedDate(final DateTime value) => _createdDate = value;

  String? validateTitle() {
    if (_title.isEmpty) {
      return 'Enter a title.';
    } else if (_title.length > 20) {
      return 'Limit the title to 20 characters.';
    } else {
      return null;
    }
  }

  String? validateContent() {
    if (_content.length > 150) {
      return 'Limit the description to 150 characters.';
    } else {
      return null;
    }
  }

  String? validateCreatedDate() {
    if (_isNewNote && _createdDate.isBefore(DateTime.now())) {
      return "Created date be after today's date.";
    } else {
      return null;
    }
  }
}
