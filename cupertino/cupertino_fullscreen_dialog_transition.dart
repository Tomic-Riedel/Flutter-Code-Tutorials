/// ------------------------------------------------------------
/// -CupertinoFullscreenDialogTransition -  All Cupertino widgets
/// -------https://medium.com/@tomicriedel/bea931268cb2---------
/// ------------------------------------------------------------

/// Snap 1 - CupertionFullscreenDialogTransition Example
class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Place some other widgets here
    return CupertinoButton(
      child: Text('Navigate'),
      onPressed: () => Navigator.of(context).push(
        PageRouteBuilder(
          opaque: false,
          pageBuilder: (context, _, __) {
            return SecondScreen();
          },
        ),
      ),
    );
  }
}

// The full dialog page
class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

// Use TickerProviderStateMixing to create animations
class _SecondScreenState extends State<SecondScreen>
    with TickerProviderStateMixing {
  // Create animation controllers and Animation<double>
  AnimationController _primary, _secondary;
  Animation<double> _animationPrimary, _animationSecondary;

  @override
  void initState() {
    // Set primary & secondary animation contrller
    _primary = AnimationController(
      vsync: this,
      duration: Duration(
        seconds: 1,
        milliseconds: 500,
      ),
    );
    _secondary = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1, milliseconds: 500),
    );

    // set animation for primary and secondary
    _animationPrimary = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _primary,
        curve: Curves.easeOut,
      ),
    );

    _animationSecondary = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _primary,
        curve: Curves.easeOut,
      ),
    );

    // Start the primary animation
    _primary.forward();

    super.initState();
  }

  // Don't forget to dispose the controllers ;)
  @override
  void dispose() {
    _primary.dispose();
    _secondary.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoFullscreenDialogTransition(
      // Setting primary and secondary route animation
      primaryRouteAnimation: _animationPrimary,
      secondaryRouteAnimation: _animationSecondary,

      // Set the any child you want
      child: CupertinoButton(
        child: Text('Go back'),
        onPressed: () {
          _primary.reverse();

          // Delay the pop by the duration of your animation (In this example 1,5 seconds)
          Future.delayed(Duration(seconds: 1, milliseconds: 500), () {
            Navigator.of(context).pop();
          });
        },
      )

      // Easy challenge: Play around with the linearTransition property
    );
  }
}
