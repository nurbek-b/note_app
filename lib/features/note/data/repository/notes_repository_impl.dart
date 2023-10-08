import 'package:note_app/features/note/data/data_source/database/notes_database.dart';
import 'package:note_app/features/note/data/mapper/note_list_mapper.dart';
import 'package:note_app/features/note/data/mapper/note_mapper.dart';
import 'package:note_app/features/note/domain/model/note.dart';
import 'package:note_app/features/note/domain/model/note_id.dart';
import 'package:note_app/features/note/domain/model/note_list.dart';
import 'package:note_app/features/note/domain/repository/notes_repository.dart';

class NotesRepositoryImpl implements NotesRepository {
  final NotesDatabase database;

  const NotesRepositoryImpl(this.database);

  @override
  Future<NoteList> getNoteList() async {
    final noteListEntity = await database.allNotes();
    return NoteListMapper.transformToModel(noteListEntity);
  }

  @override
  Future<Note> createNote(
    final String title,
    final String content,
    final DateTime created,
  ) async {
    final noteEntity =
        await database.insertNote(NoteMapper.transformToNewEntityMap(
      title,
      content,
      created,
    ));
    return NoteMapper.transformToModel(noteEntity);
  }

  @override
  Future<void> updateNote(
    final NoteId id,
    final String title,
    final String content,
    final DateTime created,
  ) async {
    final note = Note(
      id: id,
      title: title,
      content: content,
      created: created,
    );
    await database.updateNote(NoteMapper.transformToMap(note));
  }

  @override
  Future<void> deleteNote(final NoteId id) async =>
      await database.deleteNote(id.value);
}
