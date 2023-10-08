import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:note_app/features/note/domain/model/note_id.dart';

part 'note.freezed.dart';

@freezed
class Note with _$Note {
  const factory Note({
    required NoteId id,
    required String title,
    required String content,
    required DateTime created,
  }) = _Note;

  const Note._();
}
