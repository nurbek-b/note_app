import 'package:freezed_annotation/freezed_annotation.dart';

part 'note_id.freezed.dart';

@freezed
class NoteId with _$NoteId {
  const factory NoteId({required int value}) = _NoteId;
}
