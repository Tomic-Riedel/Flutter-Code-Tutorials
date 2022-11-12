/// ------------------------------------------------------------
/// ---------CupertinoDatePicker -  All Cupertino widgets--------
/// --------https://medium.com/@tomicriedel/9908f167178---------
/// ------------------------------------------------------------

/// Snap 1 CupertinoDatePicker Example
class CupertinoDatePicker extends StatelessWidget {
  const CupertinoDatePicker({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      //You have to call _showDialog to show the date picker
      onPressed: () => _showDialog(
        CupertinoDatePicker(
          // For all my Argentinian readers: Do you remember
          // this date and time 🤔? (Oh man I am so sorry, I
          // thought about this event before writing the article xD)
          initialDateTime: DateTime(2014, 7, 13, 16, 00),

          // Let's just focus on the time
          mode: CupertinodatePickerMode.dateAndTime,
          onDateTimeChanged: (DateTime date) {
            // Do something
          },

          // Challenge for you: Set a minimum and maximum date.
        ),
      ),
    );
  }
}
