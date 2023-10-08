import 'package:note_app/features/note/domain/model/note_list.dart';

abstract class GetNoteListUseCase {
  Future<NoteList> execute();
}
