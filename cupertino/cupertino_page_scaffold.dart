/// ------------------------------------------------------------
/// --------CupertinoPageScaffold - All cupertino widgets---------
/// --------https://medium.com/@tomicriedel/1c30aba78208--------
/// ------------------------------------------------------------

/// Snap 1 - Example of CupertinoPageScaffold
@override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      // Sets the background color to red. Cupertino theme
      // & colors will be explained later in this series
      backgroundColor: CupertinoColors.systemRed,

      // CupertinoNavigationBar is also a widget, that will
      // be explained later in this series
      navigationBar: const CupertinoNavigationBar(
        middle: Text('CupertinoPageScaffold Sample'),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Text('All the content'),
            ),
          ],
        ),
      ),
    );
  }