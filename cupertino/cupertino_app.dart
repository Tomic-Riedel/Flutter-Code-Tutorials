/// ------------------------------------------------------------
/// -------------CupertinoApp - All cupertino widgets-------------
/// --------https://medium.com/@tomicriedel/299bce3f6f64--------

/// Snap 1 - CupertinoApp in Action
class CupertinoExample extends StatelessWidget {
  const CupertinoExample({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      home: CupertinoPageScaffold(
        child: Center(
          child: Text('This is your page content'),
        ),
      ),
      // Define your routes, as you would do it
      // in a MaterialApp
      routes: [],
      // Determine, if you want to show the debug
      // banner or not
      debugShowCheckedModeBanner: false,

      // Our theme, we will take a deeper look
      // at this later
      theme: CupertinoThemeData(
        brightness: Brightness.dark,
        primaryColor: CupertinoColors.systemOrange,
      ),
    );
  }
}
