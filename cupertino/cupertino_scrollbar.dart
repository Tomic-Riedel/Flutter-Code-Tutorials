/// ------------------------------------------------------------
/// ---------CupertinoScrollbar - All Cupertino Widgets---------
/// --------https://medium.com/@tomicriedel/d67d44d63586--------
/// ------------------------------------------------------------

/// Snap 1 - CupertionScrollbar Example
class CupertinoScrollbarExample extends StatefulWidget {
  const CupertinoScrollbarExample({super.key});

  @override
  State<CupertinoScrollbarExample> createState() =>
      _CupertinoScrollbarExampleState();
}

class _CupertinoScrollbarExampleState extends State<CupertinoScrollbarExample> {
  @override
  Widget build(BuildContext context) {
    // Some other widgets, like CupertinoPageScaffold etc.
    return CupertinoScrollbar(
      child: ListView(
          // Your listview
          ),
      thickness: 5,
      thicknessWhileDragging: 7.5,
      interactive: true,
      
      thumbVisibility: true,
      radius: Radius.circular(10.0),
      radiusWhileDragging: Radius.circular(24.0),

      trackVisibility: true,

      // You can add some other customization options if you want

    );
  }
}
