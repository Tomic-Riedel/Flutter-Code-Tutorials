/// ------------------------------------------------------------
/// --------CupertinoPageTransition - All Cupertino Widgets--------
/// --------https://medium.com/@tomicriedel/75a390c83fe3--------
/// ------------------------------------------------------------

/// Snap 1 - CupertinoPageTransition Example
class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Other widgets, like CupertinoPageScaffold etc.
    return CupertinoButton(
      onPressed: () => Navigator.of(context).push(SecondScreen.route),
      child: Text('Navigate to second screen'),
    );
  }
}

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  // Specify our route
  static Route<dynamic> route() {
    return CupertinoPageTransition(
      builder: (BuildContext context) {
        // Return our initial screen
        return SecondScreen();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // Widgets for the second screen
  }
}
