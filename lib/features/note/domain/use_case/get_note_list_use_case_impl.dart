import 'package:note_app/features/note/domain/model/note_list.dart';
import 'package:note_app/features/note/domain/repository/notes_repository.dart';
import 'package:note_app/features/note/domain/use_case/get_note_list_use_case.dart';

class GetNoteListUseCaseImpl implements GetNoteListUseCase {
  final NotesRepository _repository;

  const GetNoteListUseCaseImpl(this._repository);

  @override
  Future<NoteList> execute() => _repository.getNoteList();
}
