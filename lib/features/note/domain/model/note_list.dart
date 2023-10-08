import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:note_app/features/note/domain/model/note.dart';
import 'package:note_app/features/note/domain/model/note_id.dart';

part 'note_list.freezed.dart';

@freezed
class NoteList with _$NoteList {
  const factory NoteList({required List<Note> values}) = _NoteList;

  const NoteList._();

  operator [](final int index) => values[index];

  int get length => values.length;

  NoteList addNote(final Note note) => copyWith(values: [...values, note]);

  NoteList updateNote(final Note newNote) {
    return copyWith(
        values: values
            .map((note) => newNote.id == note.id ? newNote : note)
            .toList());
  }

  NoteList removeNoteById(final NoteId id) =>
      copyWith(values: values.where((note) => note.id != id).toList());
}
