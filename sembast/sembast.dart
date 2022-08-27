/// ------------------------------------------------------------
/// ---------Fluter Sembast - The Complete Crash Course---------
/// --------https://medium.com/@tomicriedel/cf4fe226a3f3--------
/// ------------------------------------------------------------

/// Snap 1 - Open a databse

// First we have to import sembast package
import 'package:sembast/sembast.dart';

// File path to the database in the current directory
String dbPath = 'sample.db';

// Create Dabase factory
DatabaseFactory dbFactory = databaseFactoryIo;

// Use the DtabaseFactory to open the database
Database = db.await dbFactory.openDatabase(dbPath);

/// Snap 2 - Read and write records
// dynamically typed store
var store = StoreRef.main();
// Easy to put/get simple values or map
// A key can be of type int or String and the value can be anything as long as it can
// be properly JSON encoded/decoded
await store.record('title').put(db, 'Simple application');
await store.record('version').put(db, 10);
await store.record('settings').put(db, {'offline': true});

// read values
var title = await store.record('title').get(db) as String;
var version = await store.record('version').get(db) as int;
var settings = await store.record('settings').get(db) as Map;
  
// ...and delete
await store.record('version').delete(db);