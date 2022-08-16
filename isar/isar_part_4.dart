/// ------------------------------------------------------------
/// ---------------Flutter Isar Database - part 4---------------
/// --------https://medium.com/@tomicriedel/d4bda93480d2--------
/// ------------------------------------------------------------

/// Snap 1 - Recap of part 3 - filtering
await isar.contacts.filter().startsWith('A').findAll();

/// Snap 2 - Example of all filter options

// Get values that are equal to 10
await isar.myDB.filter().equalTo(10).findAll();

// Get values that are between 10 and 20
await isar.myDB.filter().between(10, 20).findAll();

// Get values that are greater than 10
await isar.myDB.filter().greaterThan(10).findAll();

// Get values that are less than 10
await isar.myDB.filter().lessThan(10).findAll();

// Get values that are null
await isar.myDB.filter().isNull().findAll();

// Get values that startWith "A"
await isar.myStringDB.filter().startsWith('A').findAll();

// Get values that endWith "A"
await isar.myStringDB.filter().endsWith('A').findAll();

// Get values that contain "A"
await isar.myStringDB.filter().contains('A').findAll();

// Get values that are equal to "A"
await isar.myStringDB.filter().matches('A').findAll();

/// Snap 3 - Combine filters
await isar.myDB.filter().equalTo(10).and().greaterThan(10).findAll();

/// Snap 4 - Query modifiers - optional()
Future<List<int> findMyInt(int? myInt) {
    return isar.myDB.filter().optional(myInt != null, (query) => query.equalTo(myInt)).findAll();
}

/// Snap 5 - Query modifiers - repeat(), combined with optional()+

// We combine optional() and repeat()
Future<List<int> findMyInts(List<int>? myInts) {
    return isar.myDB.filter().optional(
        myInt != null, 
        (query) => query.repeat(
            myInts, 
            (q int integer) => q.equalTo(integer).or(),
        ),
    ).findAll();
}

/// Snap 6 - Placing indexes on shoe collection
@Collection()
class Shoe with IsarObject {
  int? id;

  @Index()
  int? size;

  late String model;

  @Index(composite: [CompositeIndex('size')])
  late bool isUnisex;
}

/// Snap 7 - Use where clause to filter shoes
final result = isar.shoes.where()
  .isUnisexSizeEqualTo(true, 46)
  .findAll();

/// Snap 8 - Combining where clauses with filters
final result = isar.shoes.where()
  .isUnisexEqualTo(true)
  .filter()
  .modelContains('Nike')
  .findAll();