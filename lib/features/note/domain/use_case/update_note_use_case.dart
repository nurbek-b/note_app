
import 'package:note_app/features/note/domain/model/note_id.dart';

abstract class UpdateNoteUseCase {
  Future<void> execute(
    final NoteId id,
    final String title,
    final String content,
    final DateTime created,
  );
}
