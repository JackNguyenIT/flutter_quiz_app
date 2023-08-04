// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question_database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorQuestionDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$QuestionDatabaseBuilder databaseBuilder(String name) =>
      _$QuestionDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$QuestionDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$QuestionDatabaseBuilder(null);
}

class _$QuestionDatabaseBuilder {
  _$QuestionDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$QuestionDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$QuestionDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<QuestionDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$QuestionDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$QuestionDatabase extends QuestionDatabase {
  _$QuestionDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  QuestionDao? _questionDaoInstance;

  Future<sqflite.Database> open(
    String path,
    List<Migration> migrations, [
    Callback? callback,
  ]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `Question` (`question_id` TEXT NOT NULL, `question_category` TEXT, `question_incorrect_answers` TEXT, `question_correct_answer` TEXT, `question_type` TEXT, `question_difficulty` TEXT, `question_question_text` TEXT, PRIMARY KEY (`question_id`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  QuestionDao get questionDao {
    return _questionDaoInstance ??= _$QuestionDao(database, changeListener);
  }
}

class _$QuestionDao extends QuestionDao {
  _$QuestionDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database, changeListener),
        _questionInsertionAdapter = InsertionAdapter(
            database,
            'Question',
            (Question item) => <String, Object?>{
                  'question_id': item.id,
                  'question_category': item.category,
                  'question_incorrect_answers':
                      _stringListConverter.encode(item.incorrectAnswers),
                  'question_correct_answer': item.correctAnswer,
                  'question_type': item.type,
                  'question_difficulty': item.difficulty,
                  'question_question_text':
                      _questionTextConverter.encode(item.question)
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Question> _questionInsertionAdapter;

  @override
  Future<List<Question>> getQuestions() async {
    return _queryAdapter.queryList('SELECT * FROM Question',
        mapper: (Map<String, Object?> row) => Question(
            id: row['question_id'] as String,
            question: _questionTextConverter
                .decode(row['question_question_text'] as String?),
            category: row['question_category'] as String?,
            incorrectAnswers: _stringListConverter
                .decode(row['question_incorrect_answers'] as String?),
            correctAnswer: row['question_correct_answer'] as String?,
            type: row['question_type'] as String?,
            difficulty: row['question_difficulty'] as String?));
  }

  @override
  Stream<List<Question>> getStreamQuestionsAsStream() {
    return _queryAdapter.queryListStream('SELECT * FROM Question',
        mapper: (Map<String, Object?> row) => Question(
            id: row['question_id'] as String,
            question: _questionTextConverter
                .decode(row['question_question_text'] as String?),
            category: row['question_category'] as String?,
            incorrectAnswers: _stringListConverter
                .decode(row['question_incorrect_answers'] as String?),
            correctAnswer: row['question_correct_answer'] as String?,
            type: row['question_type'] as String?,
            difficulty: row['question_difficulty'] as String?),
        queryableName: 'Question',
        isView: false);
  }

  @override
  Stream<Question?> findQuestionById(int id) {
    return _queryAdapter.queryStream('SELECT * FROM Question WHERE id = ?1',
        mapper: (Map<String, Object?> row) => Question(
            id: row['question_id'] as String,
            question: _questionTextConverter
                .decode(row['question_question_text'] as String?),
            category: row['question_category'] as String?,
            incorrectAnswers: _stringListConverter
                .decode(row['question_incorrect_answers'] as String?),
            correctAnswer: row['question_correct_answer'] as String?,
            type: row['question_type'] as String?,
            difficulty: row['question_difficulty'] as String?),
        arguments: [id],
        queryableName: 'Question',
        isView: false);
  }

  @override
  Future<void> insertQuestion(Question question) async {
    await _questionInsertionAdapter.insert(
        question, OnConflictStrategy.replace);
  }

  @override
  Future<void> insertQuestions(List<Question> questions) async {
    await _questionInsertionAdapter.insertList(
        questions, OnConflictStrategy.replace);
  }
}

// ignore_for_file: unused_element
final _stringListConverter = StringListConverter();
final _questionTextConverter = QuestionTextConverter();
