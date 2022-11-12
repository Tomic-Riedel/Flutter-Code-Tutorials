/// ------------------------------------------------------------
/// -------CupertinoNavigationBar - All Cupertino Widgets-------
/// --------https://medium.com/@tomicriedel/4ef18775f8ea--------
/// ------------------------------------------------------------

/// Snap 1 - CupertinoNavigationBar Example
class CupertinoNavigationBarExample extends StatelessWidget {
  const CupertinoNavigationBarExample({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('My Middle Text'),
        leading: IconButton(
          icon: Icon(CupertinoIcons.back),
          onPressed: () => Navigator.of(context).pop(),
        ),

        // Challenge for you: 
        // Add a trailing and a background, that is transparent
        // But a little bit blured
      ),
    );
  }
}
