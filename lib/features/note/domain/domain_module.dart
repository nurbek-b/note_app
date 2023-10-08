import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:note_app/features/note/data/data_module.dart';
import 'package:note_app/features/note/domain/use_case/create_note_use_case.dart';
import 'package:note_app/features/note/domain/use_case/create_note_use_case_impl.dart';
import 'package:note_app/features/note/domain/use_case/delete_note_use_case.dart';
import 'package:note_app/features/note/domain/use_case/delete_note_use_case_impl.dart';
import 'package:note_app/features/note/domain/use_case/get_note_list_use_case.dart';
import 'package:note_app/features/note/domain/use_case/get_note_list_use_case_impl.dart';
import 'package:note_app/features/note/domain/use_case/update_note_use_case.dart';
import 'package:note_app/features/note/domain/use_case/update_note_use_case_impl.dart';

final getNoteListUseCaseProvider = Provider<GetNoteListUseCase>(
    (ref) => GetNoteListUseCaseImpl(ref.watch(notesRepositoryProvider)));
final createNoteUseCaseProvider = Provider<CreateNoteUseCase>(
    (ref) => CreateNoteUseCaseImpl(ref.watch(notesRepositoryProvider)));
final updateNoteUseCaseProvider = Provider<UpdateNoteUseCase>(
    (ref) => UpdateNoteUseCaseImpl(ref.watch(notesRepositoryProvider)));
final deleteNoteUseCaseProvider = Provider<DeleteNoteUseCase>(
    (ref) => DeleteNoteUseCaseImpl(ref.watch(notesRepositoryProvider)));
