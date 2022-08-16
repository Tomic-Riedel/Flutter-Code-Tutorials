/// ------------------------------------------------------------
/// ----------------------Hive DB tutorial----------------------
/// --------https://medium.com/@tomicriedel/42ea3bb85189--------
/// ------------------------------------------------------------


/// Snap 1 - Initialize Hive

// Import hive first
import 'package:hive/hive.dart';

// Initialize Hive when using Flutter
await Hive.initHive();

// Initialize Hive for non-flutter apps
await Hive.init();

/// Snap 2 - Create a Hive Box
var box = await Hive.openBox('my_box');

/// Snap 3 - Add entry to our box
box.put('my_key', 'my_value');

// Put multiple entries at one in our box
box.putAll({
  'my_key_1': 'my_value_1',
  'my_key_2': 'my_value_2',
});

/// Snap 4 - Get entry from our box
box.get('my_key_1'); // returns 'my_value_1'

// Get value of my_key_3 -> Does not exist
box.get('my_key_3');  // returns null

// returns 'my_default_value' -> prevent null values
box.get('my_key_3', defaultValue: 'my_default_value'); 

/// Snap 5 - Delete entry from our box
box.delete('my_key_2');

// Checks if box has this key
print(box.containsKey('my_key_2')); // returns false

// ATTENTION: Setting the value to null is NOT the same as deleting the entry
box.put('my_key_2', null);
print(box.containsKey('my_key_2')); // returns true


/// Snap 6 - Filter items
var gmailUsers = userBox.values.where((user) => user.email.endsWith('gmail.com'));

/// Snap 7 - Close box and close Hive

await box.close(); // Close box

await Hive.close(); // Close Hive
