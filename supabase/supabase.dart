/// ------------------------------------------------------------
/// ------Flutter Supabase - All The Complete Crash Course------
/// --------https://medium.com/@tomicriedel/208562290147--------
/// ------------------------------------------------------------

/// Snap 1 - Initialize Supabase
Future<void> main() async {
  await Supabase.initialize(url: 'https://myproject.supabase.co', anonKey: 'public-anon-key');
  runApp(MyApp());
}

/// Snap 2 - Access Supabase client after initialization
final supabase = Supabase.instance.client;

/// Snap 3 - User sign up
final AuthResponse res = await supabase.auth.signUp(
  email: 'example@email.com',
  password: 'example-password',
);
final Session? session = res.session;
final User? user = res.user;

/// Snap 4 - Get the current session & user
final Session? session = supabase.auth.currentSession;

final User? user = supabase.auth.currentUser;

/// Snap 5 - User sign in
final AuthResponse res = await supabase.auth.signInWithPassword(
  email: 'example@email.com',
  // Or/and phone
  phone: '+11111111111'
  password: 'example-password',
);
final Session? session = res.session;
final User? user = res.user;

/// Snap 6 - Sign in with OAuth
await supabase.auth.signInWithOAuth(Provider.github);

/// Snap 7 - User sign out
await supabase.auth.signOut();


/// --- Databases ---

/// Snap 8 - Fetching data
final data = await supabase
  .from('persons')
  .select('name');

/// Snap 9 - Insert data
final data = await supabase
    .from('persons')
    .insert({'name': 'Anna', 'mail': 'annassmail@mail.com'});
    // Note: Instead of a single entry,
    // You can also insert multiple records with
    // Bulk create
    // This could look something like this:
    .insert([{'name': 'Some Name', 'mail': 'somemail@mail.com'}, {...}])

/// Snap 10 - Update data
final data = await supabase
  .from('persons')
  .update({ 'name': 'Annabell' })
  .match({ 'mail': 'annasmail@mail.com' });

/// Snap 11 - Upsert data
final data = await supabase
  .from('persons')
  .upsert({ 'id': 2, 'name': 'Annabell', 'mail': 'annabellsmail@mail.com' });

/// Snap 12 - Delete data

// Delete entry Annabell with annabellsmail@mail.com
final data = await supabase
  .from('persons')
  .delete()
  .match({ 'id': 3 });