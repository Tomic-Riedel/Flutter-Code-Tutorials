/// ------------------------------------------------------------
/// -----------CupertinoPicker - All Cupertino Widgets----------
/// --------https://medium.com/@tomicriedel/fb73e4168592--------
/// ------------------------------------------------------------

/// Snap 1 - CupertinoPickerExample
const List<String> _carCompanies = <String>[
  'Mercedes',
  'BMW',
  'Porsche',
  'Lamborghini',
  'Ford',
  'Renault',
];

class CupertinoPickerExample extends StatelessWidget {
  const CupertinoPickerExample({super.key});

  @override
  Widget build(BuildContext context) {
    // Other widgets, like CupertinoPageScaffold etc.
    return CupertinoButton(
      onPressed: {
        showCupertinoModalPopup<void>(
          context: context,
          builder: (BuildContext context) {
            // Use SafeArea widget to avoid system overlaps.
            return SafeArea(
              top: false,
              child: CupertinoPicker(
                magnification: 1.25,
                useMagnifier: true,
                squeeze: 1.1,
                onSelectedItemChanged: (int selectedItem) {
                  // Do whatever you want to do
                },
                children: List<Widget>.generate(
                  _carCompanies.length,
                  (int index) {
                    return Center(
                      child: Text(
                        _carCompanies[index],
                      ),
                    );
                  },
                ),
              ),
            );
          },
        ),
      },
      child: Text('Show Picker'),
    );
  }
}
