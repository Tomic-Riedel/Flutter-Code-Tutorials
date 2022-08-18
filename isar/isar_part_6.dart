/// ------------------------------------------------------------
/// ---------------Flutter Isar Database - part 4---------------
/// --------https://medium.com/@tomicriedel/f88555c19047--------
/// ------------------------------------------------------------

/// Snap 1 - Using Write transactions & Conventions

@Collection()
class Contact {
  @Id()
  int? id;

  late String name;
}

// GOOD
await isar.writeTxn((isar) async {
  for (var contact in getContacts()) {
    isar.contacts.put(contact);
  }
});

// BAD: move loop inside transaction
for (var contact in getContacts()) {
  await isar.writeTxn((isar) async {
    isar.contacts.put(contact);
  });
}