/// ------------------------------------------------------------
/// ---------Dart ObjectBox - The complete crash course---------
/// -------https://medium.com/@tomicriedel/94b0586392a5---------
/// ------------------------------------------------------------

/// Snap 1 - Create Entity Class
@Entity()
class User {
  // Specify the id
  @Id()
  int id = 0;

  String? name;

  // Convert DateTime to int in milliseconds
  @Property(type: PropertyType.date)
  DateTime? date;

  // Ignore this property in the database
  @Transient()
  int? computedProperty;
}
/// Snap 2 - Create a store
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'objectbox.g.dart'; // created by `flutter pub run build_runner build`

class ObjectBox {
  /// The Store of this app.
  late final Store store;
  
  ObjectBox._create(this.store) {
    // Add any additional setup code, e.g. build queries.
  }

  /// Create an instance of ObjectBox to use throughout the app.
  static Future<ObjectBox> create() async {
    final docsDir = await getApplicationDocumentsDirectory();
    // Future<Store> openStore() {...} is defined in the generated objectbox.g.dart
    final store = await openStore(directory: p.join(docsDir.path, "obx-example"));
    return ObjectBox._create(store);
  }
}

/// Snap 3 - Initialize ObjectBox
/// Provides access to the ObjectBox Store throughout the app.
late ObjectBox objectbox;

Future<void> main() async {
  // This is required so ObjectBox can get the application directory
  // to store the database in.
  WidgetsFlutterBinding.ensureInitialized();

  objectbox = await ObjectBox.create();

  runApp(MyApp());
}

/// Snap 4 - Open box
final userBox = store.box<User>();

/// Snap 5 - Box operations
userBox.put(user);
userBox.putMany(users);

oneUser = userBox.get(id);
multipleUsers = userBox.getMany(ids);
allUsers = userbox.getAll();

final isRemoved = userBox.remove(id);
userBox.removeMany(userIds);
userBox.removeAll();

final count = userBox.count();
