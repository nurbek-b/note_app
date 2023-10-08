
import 'package:note_app/features/note/domain/model/note_id.dart';
import 'package:note_app/features/note/domain/repository/notes_repository.dart';
import 'package:note_app/features/note/domain/use_case/update_note_use_case.dart';

class UpdateNoteUseCaseImpl implements UpdateNoteUseCase {
  final NotesRepository _repository;

  const UpdateNoteUseCaseImpl(this._repository);

  @override
  Future<void> execute(
    final NoteId id,
    final String title,
    final String content,
    final DateTime created,
  ) {
    return _repository.updateNote(
      id,
      title,
      content,
      created,
    );
  }
}
