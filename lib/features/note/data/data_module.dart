import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:note_app/features/note/data/data_source/database/notes_database.dart';
import 'package:note_app/features/note/data/data_source/database/notes_database_impl.dart';
import 'package:note_app/features/note/data/repository/notes_repository_impl.dart';
import 'package:note_app/features/note/domain/repository/notes_repository.dart';

final notesDatabaseProvider =
    Provider<NotesDatabase>((_) => NotesDatabaseImpl());
final notesRepositoryProvider = Provider<NotesRepository>(
    (ref) => NotesRepositoryImpl(ref.watch(notesDatabaseProvider)));
