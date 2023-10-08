import 'package:note_app/features/note/domain/model/note.dart';
import 'package:note_app/features/note/domain/model/note_id.dart';
import 'package:note_app/features/note/domain/model/note_list.dart';

abstract class NotesRepository {
  Future<NoteList> getNoteList();

  Future<Note> createNote(
    final String title,
    final String content,
    final DateTime created,
  );

  Future<void> updateNote(
    final NoteId id,
    final String title,
    final String content,
    final DateTime created,
  );

  Future<void> deleteNote(final NoteId id);
}
