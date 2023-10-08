
import 'package:note_app/features/note/data/entity/note_entity.dart';

abstract class NotesDatabase {
  Future<NoteListEntity> allNotes();

  Future<NoteEntity> insertNote(final NoteEntity noteEntity);

  Future<void> updateNote(final NoteEntity noteEntity);

  Future<void> deleteNote(final int id);
}
