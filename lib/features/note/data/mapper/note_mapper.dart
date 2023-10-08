import 'package:note_app/features/note/data/entity/note_entity.dart';
import 'package:note_app/features/note/domain/model/note.dart';
import 'package:note_app/features/note/domain/model/note_id.dart';

class NoteMapper {
  static Note transformToModel(final NoteEntity entity) {
    return Note(
      id: NoteId(value: entity['id']),
      title: entity['title'],
      content: entity['content'],
      created: DateTime.parse(entity['created']),
    );
  }

  static NoteEntity transformToMap(final Note model) {
    return {
      'id': model.id.value,
      'title': model.title,
      'content': model.content,
      'created': model.created.toIso8601String(),
    };
  }

  static NoteEntity transformToNewEntityMap(
    final String title,
    final String content,
    final DateTime created,
  ) {
    return {
      'id': null,
      'title': title,
      'content': content,
      'created': created.toIso8601String(),
    };
  }
}
