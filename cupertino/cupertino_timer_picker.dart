/// ------------------------------------------------------------
/// --------CupertinoTimerPicker - All Cupertino Widgets--------
/// --------https://medium.com/@tomicriedel/b0ec4d11c629--------
/// ------------------------------------------------------------

/// Snap 1 - CupertinoTimerPickerExample

class CupertinoTimerPickerExample extends StatelessWidget {
  const CupertinoTimerPickerExample({super.key});

  @override
  Widget build(BuildContext context) {
    // Other widgets like CupertinoPageScaffold etc.
    return CupertinoButton(
      onPressed: () => showCupertinoModalPopup(
        context: context,
        builder: (BuildContext context) {
          // Use SafeArea widget to avoid system overlaps.
          return SafeArea(
            top: false,
            child: CupertinoTimerPicker(
              mode: CupertinoTimerPickerMode.hms,
              minuteInterval: 5,
              secondInterval: 10,
              initialTimerDuration: Duration(minutes: 122, seconds: 23)
            ),
          );
        },
      ),
      child: Text('Show Picker')
    );
  }
}
