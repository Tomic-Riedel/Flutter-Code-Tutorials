/// ------------------------------------------------------------
/// --CupertinoSlidingSegmentedControl -  All Cupertino widgets--
/// -------https://medium.com/@tomicriedel/74921e114600---------
/// ------------------------------------------------------------

/// Snap 1 - CupertinoSlidingSegmentedControl Example

enum Car {
  BMW,
  Mercedes,
  VW,
}

class CupertinoSlidingSegmentedControlExample extends StatefulWidget {
  const CupertinoSlidingSegmentedControlExample({super.key});

  @override
  State<CupertinoSlidingSegmentedControlExample> createState() =>
      _CupertinoSlidingSegmentedControlExampleState();
}

class _CupertinoSlidingSegmentedControlExampleState
    extends State<CupertinoSlidingSegmentedControlExample> {

    // This variable represents our currently selected car
  final selectedValue = Car.BMW;
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      // We will use the navigation bar to display the segmented control
      navigationBar: CupertinoNavigationBar(
        // Because we specify Car as our type, our
        // map has to be Map<Car, Widget>
        middle: CupertinoSlidingSegmentedControl<Car>(
          // We use <Car, Widget>, because
          // Our segmented control is of type car
          // And our onValueChanged will return
          // Car. So as you can see, everything
          // is based around one type.
          children: <Car, Widget>{
            Car.BMW: Text('BMW'),
            Car.Mercedes: Text('Mercedes'),
            Car.VW: Text('VW'),
          },
          onValueChanged: (Car car) {
            setState(() {
              selectedValue = car;
            });
          },
          groupValue: selectedValue,

          // Challenge for you: Set all the colors ;)
        ),
      ),
      child: Center(
        Text(
          '${selectedValue.name} was selected',
        ),
      ),
    );
  }
}
