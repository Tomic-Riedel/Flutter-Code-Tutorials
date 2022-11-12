/// ------------------------------------------------------------
/// -------Dart for Terminals - The Complete Crash Course-------
/// --------https://medium.com/@tomicriedel/89bbcef0318--------
/// ------------------------------------------------------------

/// Snap 1 - Menu input
var selected = menu(
  'Select your size',
  options: ['XS', 'S', 'M', 'L', 'XL', 'XXL'],
  defaultOption: 'M',
);

/// Snap 2 - Pass class to options
class Car {
  String make;
  String model;
  Car(this.make, this.model);
}

var selected = menu('Choose your preferred car:',
    options: [Car('Ford', 'Falcon'), Car('Holden', 'Capree'), Car('BMW', 'M3')],
    format: (car) => '${car.make} ${car.model}',
    defaultOption: 'beer');

/// Snap 3 - Display a row with 4 columns
print(
    Format().row([
        'First column',
        'Second column',
        'Third column',
        'Fourth column'
    ], widths: [
        17,
        9,
        16,
        -1
    ], alignments: [
        TableAlignment.left,
        TableAlignment.right,
        TableAlignment.middle,
        TableAlignment.left
    ]),
);