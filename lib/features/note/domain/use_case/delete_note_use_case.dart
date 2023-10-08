import 'package:note_app/features/note/domain/model/note_id.dart';

abstract class DeleteNoteUseCase {
  Future<void> execute(final NoteId id);
}
