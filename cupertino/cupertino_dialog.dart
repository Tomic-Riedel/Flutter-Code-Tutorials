/// ------------------------------------------------------------
/// ----------Cupertino Dialog -  All Cupertino widgets----------
/// -------https://medium.com/@tomicriedel/---------
/// ------------------------------------------------------------

/// Snap 1 - Cupertino dialog example

class CupertinoDialogExample extends StatelessWidget {
  const CupertinoDialogExample({super.key});

  @override
  Widget build(BuildContext context) {
    // Some other widgets before
    return CupertinoButton(
        child: Text('Open Dialog'),
        onPressed: () {
          showCupertinoDialog(
            context: context,

            // Challenge for you: 
            // Play around with the borderDismissable property
          );
        });
  }
}
