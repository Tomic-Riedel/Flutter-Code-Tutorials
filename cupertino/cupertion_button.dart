/// ------------------------------------------------------------
/// ----------CupertinoButton -  All cupertino widgets-----------
/// --------https://medium.com/@tomicriedel/e493abbd6ac--------
/// ------------------------------------------------------------

/// Snap 1 - Cupertino Button Example
class CupertinoButtonExample extends StatelessWidget {
  const CupertinoButtonExample({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Center(
        child: Column(
          children: [
            CupertinoButton(
                color: CupertinoColors.activeOrange,
                disabledColor: CupertinoColors.systemGrey,
                child: Text('My unfilled button')),
            CupertinoButton.filled(
                color: CupertinoColors.activeOrange,
                disabledColor: CupertinoColors.systemGrey,
                child: Text('My filled button')),
          ],
        ),
      ),
    );
  }
}
