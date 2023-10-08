
import 'package:note_app/features/note/data/data_source/database/notes_database.dart';
import 'package:note_app/features/note/data/entity/note_entity.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class NotesDatabaseImpl implements NotesDatabase {
  static const _databaseName = 'notes_database';
  static const _tableName = 'notes_table';
  static const _databaseVersion = 1;
  static const _columnId = 'id';
  static const _columnTitle = 'title';
  static const _columnContent = 'content';
  static const _columnCreatedDate = 'created';
  static Database? _database;

  Future<Database> get database async {
    _database ??= await _initDatabase();
    return _database!;
  }

  @override
  Future<NoteListEntity> allNotes() async {
    final db = await database;
    return db.query(_tableName);
  }

  @override
  Future<NoteEntity> insertNote(final NoteEntity note) async {
    final db = await database;
    late final NoteEntity noteEntity;
    await db.transaction((txn) async {
      final id = await txn.insert(
        _tableName,
        note,
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
      final results =
          await txn.query(_tableName, where: '$_columnId = ?', whereArgs: [id]);
      noteEntity = results.first;
    });
    return noteEntity;
  }

  @override
  Future<void> updateNote(final NoteEntity note) async {
    final db = await database;
    final int id = note['id'];
    await db.update(
      _tableName,
      note,
      where: '$_columnId = ?',
      whereArgs: [id],
    );
  }

  @override
  Future<void> deleteNote(final int id) async {
    final db = await database;
    await db.delete(
      _tableName,
      where: '$_columnId = ?',
      whereArgs: [id],
    );
  }

  Future<Database> _initDatabase() async {
    return openDatabase(
      join(await getDatabasesPath(), _databaseName),
      onCreate: (db, _) {
        db.execute('''
          CREATE TABLE $_tableName(
            $_columnId INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
            $_columnTitle TEXT NOT NULL,
            $_columnContent TEXT,
            $_columnCreatedDate TEXT NOT NULL
          )
        ''');
      },
      version: _databaseVersion,
    );
  }
}
