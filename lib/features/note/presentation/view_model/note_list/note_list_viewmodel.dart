import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:note_app/features/note/domain/domain_module.dart';
import 'package:note_app/features/note/domain/model/note.dart';
import 'package:note_app/features/note/domain/model/note_id.dart';
import 'package:note_app/features/note/domain/model/note_list.dart';
import 'package:note_app/features/note/domain/use_case/create_note_use_case.dart';
import 'package:note_app/features/note/domain/use_case/delete_note_use_case.dart';
import 'package:note_app/features/note/domain/use_case/get_note_list_use_case.dart';
import 'package:note_app/features/note/domain/use_case/update_note_use_case.dart';
import 'package:note_app/features/note/presentation/state/state.dart';

final filteredNoteListProvider = Provider.autoDispose<State<NoteList>>((ref) {
  final noteListState = ref.watch(noteListViewModelStateNotifierProvider);

  return noteListState.when(
    init: () => const State.init(),
    success: (noteList) => State.success(noteList),
    loading: () => const State.loading(),
    error: (exception) => State.error(exception),
  );
});

final noteListViewModelStateNotifierProvider =
    StateNotifierProvider.autoDispose<NoteListViewModel, State<NoteList>>(
        (ref) {
  return NoteListViewModel(
    ref.watch(getNoteListUseCaseProvider),
    ref.watch(createNoteUseCaseProvider),
    ref.watch(updateNoteUseCaseProvider),
    ref.watch(deleteNoteUseCaseProvider),
  );
});

class NoteListViewModel extends StateNotifier<State<NoteList>> {
  final GetNoteListUseCase _getNoteListUseCase;
  final CreateNoteUseCase _createNoteUseCase;
  final UpdateNoteUseCase _updateNoteUseCase;
  final DeleteNoteUseCase _deleteNoteUseCase;

  NoteListViewModel(
    this._getNoteListUseCase,
    this._createNoteUseCase,
    this._updateNoteUseCase,
    this._deleteNoteUseCase,
  ) : super(const State.init()) {
    _getTodoList();
  }

  _getTodoList() async {
    try {
      state = const State.loading();
      final todoList = await _getNoteListUseCase.execute();
      state = State.success(todoList);
    } on Exception catch (e) {
      state = State.error(e);
    }
  }

  addNote(
    final String title,
    final String content,
    final DateTime created,
  ) async {
    try {
      final newNote = await _createNoteUseCase.execute(
        title,
        content,
        created,
      );
      state = State.success(state.data!.addNote(newNote));
    } on Exception catch (e) {
      state = State.error(e);
    }
  }

  updateNote(final Note newNote) async {
    try {
      await _updateNoteUseCase.execute(
        newNote.id,
        newNote.title,
        newNote.content,
        newNote.created,
      );
      state = State.success(state.data!.updateNote(newNote));
    } on Exception catch (e) {
      state = State.error(e);
    }
  }

  deleteNote(final NoteId id) async {
    try {
      await _deleteNoteUseCase.execute(id);
      state = State.success(state.data!.removeNoteById(id));
    } on Exception catch (e) {
      state = State.error(e);
    }
  }
}
