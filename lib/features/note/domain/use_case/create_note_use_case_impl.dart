import 'package:note_app/features/note/domain/model/note.dart';
import 'package:note_app/features/note/domain/repository/notes_repository.dart';
import 'package:note_app/features/note/domain/use_case/create_note_use_case.dart';

class CreateNoteUseCaseImpl implements CreateNoteUseCase {
  final NotesRepository _repository;

  const CreateNoteUseCaseImpl(this._repository);

  @override
  Future<Note> execute(
    String title,
    String content,
    DateTime created,
  ) {
    return _repository.createNote(
      title,
      content,
      created,
    );
  }
}
