/// ------------------------------------------------------------
/// ---------------Flutter Isar Database - part 5---------------
/// --------https://medium.com/@tomicriedel/d4bda93480d2--------
/// ------------------------------------------------------------

/// Snap 1 - Sort first by model , then by size

// The model we will use
@Collection()
class Shoe with IsarObject {
  int? id;

  @Index()
  int? size;

  late String model;

  @Index(composite: [CompositeIndex('size')])
  late bool isUnisex;
}

// Sort first by model, then by size
final sortedShoes = isar.shoes.filter()
  .sortByModel()
  .thenBySizeDesc()
  .findAll();

/// Snap 2 - Already sorted, because of the index
// Assume we have a list of shoe sizes: [40, 32, 39, 48, 42]
final bigShoes = isar.shoes.where().sizeGreaterThan(39).findAll();
// We will get as a result [40, 42, 48]

/// Snap 3 - No where clause, but implicit sorting
final shoes = await isar.shoes
    .where(sort: Sort.desc) // Sort descending
    .anySize()
    .findAll();
// Result: [48, 42, 40, 38 32]

/// Snap 4 - Unique values
final shoes = await isar.shoes.filter().distinctByModel().findAll();

// You can also combine distinct conditions
// This finds all shoes with distinct model-size combinations
final shoes = await isar.shoes.filter().distinctByModel().distinctBySize().findAll();

/// Snap 5 - Where clause distinct
final shoes = await isar.shoes
    .where(distinct: true)
    .anySize()
    .findAll();

/// Snap 6 - Offset & limit results
final firstTenShoes = await.isar.shoes
    .where()
    .limit(10)
    .findAll();

//You can also paginate the results with offset()
final firstTenShoes = isar.shoes
    .where()
    .offset(20)
    .limit(10)
    .findAll();

/// Snap 7 - Property queries
List<String> models = await isar.shoes.where()
  .modelProperty()
  .findAll();

List<int> sizes = await isar.shoes.where()
  .sizeProperty()
  .findAll();