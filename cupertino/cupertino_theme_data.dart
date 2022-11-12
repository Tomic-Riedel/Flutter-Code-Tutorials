/// ------------------------------------------------------------
/// ---------CupertinoThemeData -  All cupertino widgets---------
/// --------https://medium.com/@tomicriedel/d9908f167178--------
/// ------------------------------------------------------------

/// Snap 1 - Example of CupertinoThemeData
class CupertinoThemeDataExample extends StatelessWidget {
  const CupertinoThemeDataExample({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      theme: CupertinoThemeData(
        textTheme: CupertinoTextThemeData(
          textStyle: TextStyle(
            // The normal text will always be bold
            fontWeight: FontWeight.bold,
            // And has as the font size 12
            fontSize: 12.0,
          ),
        ),
        // Our scaffold will have a slightly grayed background in light mode
        // In dark mode a dark color, but not 100% black (a little bit lighter)
        scaffoldBackgroundColor: CupertinoColors.secondarySystemBackground,
      ),
      home: CupertinoPageScaffold(
        child: Center(
          Text('This is our content'),
        ),
      ),
    );
  }
}
