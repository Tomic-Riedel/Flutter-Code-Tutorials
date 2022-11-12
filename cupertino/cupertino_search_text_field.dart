/// ------------------------------------------------------------
/// ------CupertinoSearchTextField -  All Cupertino widgets------
/// -------https://medium.com/@tomicriedel/5b7da5101e2f---------
/// ------------------------------------------------------------

/// Snap 1 - CupertinoSearchTextField Example
class CupertinoSearchTextFieldExample extends StatefulWidget {
  const CupertinoSearchTextFieldExample({super.key});

  @override
  State<CupertinoSearchTextFieldExample> createState() =>
      _CupertinoSearchTextFieldExampleState();
}

class _CupertinoSearchTextFieldExampleState
    extends State<CupertinoSearchTextFieldExample> {
  late TextEditingController textController;

  @override
  void initState() {
    super.initState();
    textController = TextEditingController();
  }

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Other widgets like CupertinoPageScaffold etc.
    return CuperitnoSearchTextField(
        controller: textController,
        onSubmitted: (input) {
            // My code :)
        }
        placeholder: 'Search...',
        autofocus: true,
        autocorrect: true,

        // Challenge for you:
        // Customize your textfield with everything you can imagine
        // Colors, fonts, icons etc.

    );
  }
}
