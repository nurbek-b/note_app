import 'package:note_app/features/note/domain/model/note_id.dart';
import 'package:note_app/features/note/domain/repository/notes_repository.dart';
import 'package:note_app/features/note/domain/use_case/delete_note_use_case.dart';

class DeleteNoteUseCaseImpl implements DeleteNoteUseCase {
  final NotesRepository _repository;

  const DeleteNoteUseCaseImpl(this._repository);

  @override
  Future<void> execute(NoteId id) => _repository.deleteNote(id);
}
