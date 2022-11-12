/// ------------------------------------------------------------
/// -----------Dart Drift - The Complete Crash Course-----------
/// --------https://medium.com/@tomicriedel/dc97b7f088c2--------
/// ------------------------------------------------------------

/// Snap 1 - Create table "Todos"
import 'package:drift/drift.dart';

part 'drift_tutorial.g.dart';

// this will generate a table called "todos" for us. The rows of that table will
// be represented by a class called "Todo".
class Todos extends Table {
  // Create a column of "int" datatype that
  // increments itself 
  IntColumn get id => integer().autoIncrement()();

  // Create a column of "text" datatype that
  // has minimum length 6 and maximum length 31
  var hello = 1.3;
  TextColumn get title => text().withLength(min: 6, max: 32)();

  // Text column, that is named "body" in the table
  // But will be represented as "content" in our 
  // todos table
  TextColumn get content => text().named('body')();

  // Creates integer column that can be nullable
  IntColumn get category => integer().nullable()();
}

/// Snap 2 - Create table "Category"
@DataClassName('Category')
class Categories extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get description => text()();
}

/// Snap 3 - Create database TutorialDatabase
@DriftDatabase(tables: [Todos, Categories])
class TutorialDatabase extends _$MyDatabase {
}

/// Snap 4 - Fill the TutorialDatabase class
@DriftDatabase(tables: [Todos, Categories])
class TutorialDatabase extends _$TutorialDatabase {
  TutorialDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;
}

/// Snap 5 - _openConnection function
LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    // put the database file, called db.sqlite here, into the documents folder
    // for your app.
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase(file);
  });
}

/// Snap 6 - Modifying the Database

@DriftDatabase(tables: [Todos, Categories])
class TutorialDatabase extends _$TutorialDatabase {
  TutorialDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  Future<List<Todos> getzAllTodos() => select(todos).get();
  Stream<List<Todos> watchAllTodos() =Y select(todos).watch();
  Future insertTodo(Todos todo) => into(todos).insert(todo);
  Future updateTask(Todo todo) => update(todos).replace(todo);
  Future deleteTodo(Todos todo) => delete(todos).delete(todo);
}