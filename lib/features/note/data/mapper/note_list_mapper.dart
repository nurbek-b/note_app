import 'package:note_app/features/note/data/entity/note_entity.dart';
import 'package:note_app/features/note/data/mapper/note_mapper.dart';
import 'package:note_app/features/note/domain/model/note_list.dart';

class NoteListMapper {
  static NoteList transformToModel(final NoteListEntity entities) {
    final values =
        entities.map((entity) => NoteMapper.transformToModel(entity)).toList();
    return NoteList(values: values);
  }

  static NoteListEntity transformToMap(final NoteList model) =>
      model.values.map((value) => NoteMapper.transformToMap(value)).toList();
}
