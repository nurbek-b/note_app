
import 'package:note_app/features/note/domain/model/note.dart';

abstract class CreateNoteUseCase {
  Future<Note> execute(
    final String title,
    final String content,
    final DateTime created,
  );
}
