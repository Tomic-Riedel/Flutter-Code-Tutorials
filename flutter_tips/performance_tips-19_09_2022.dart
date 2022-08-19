/// ------------------------------------------------------------
/// -------The best Flutter performance tips you can find!------
/// --------https://medium.com/@tomicriedel/8aa27e0baea0--------
/// ------------------------------------------------------------

/// Snap 1 - Use operators the right way
/// Source: https://blog.logrocket.com/performance-improvements-mobile-apps-flutter
car = van == null ? bus : audi;         // Old pattern

car = audi ?? bus;                      // New pattern

car = van == null ? null : audi.bus;    // Old pattern

car = audi?.bus;                        // New pattern

(item as Car).name = 'Mustang';         // Old pattern

if (item is Car) item.name = 'Mustang'; // New pattern