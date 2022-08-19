/// ------------------------------------------------------------
/// ---------Flutter Logger - The complete crash course---------
/// --------https://medium.com/@tomicriedel/11de3a37dd20--------
/// ------------------------------------------------------------

/// Snap 1 - Create logger variable
import 'package:logger/logger.dart';

var logger = Logger(
  filter: null, // Use the default LogFilter (-> only log in debug mode)
  printer: PrettyPrinter(
      // Use the PrettyPrinter to format and print log (You have more options with PrettyPrinter)
      methodCount: 2, // number of method calls to be displayed
      errorMethodCount: 8, // number of method calls if stacktrace is provided

      // If you import dart:io, you can detect lineLength 
      // With io.stdout.terminalColumns
      lineLength: 120, // width of the output

      //You can also do this for colors:
      // io.stdout.supportAnsyEscapes
      colors: true, // Colorful log messages

      printEmojis: true, // Print an emoji for each log message
      printTime: false // Should each log print contain a timestamp
      ),
  output: null, // Use the default LogOutput (-> send everything to console)
);

/// Snap 2 - Log levels
logger.v("Verbose log");

logger.d("Debug log");

logger.i("Info log");

logger.w("Warning log");

logger.e("Error log");

// Yep, they reinvented the meaning of wtf
logger.wtf("What a terrible failure log");

// If you are currently interested in only one log level,
// you can use the following methods:
Logger.level = Level.warning; // Outputs only warnings

/// Snap 3 - LogFilter
class MyFilter extends LogFilter {
  @override

  // The following function show all logs, even in
  // release mode. This is NOT recommended!
  bool shouldLog(LogEvent event) {
    return true;
  }
}

/// Snap 4 - LogPrinter
class MyPrinter extends LogPrinter {
  @override
  List<String> log(LogEvent event) {
    return [event.message];
  }
}

/// Snap 5 - LogOutput
class ConsoleOutput extends LogOutput {
  @override
  void output(OutputEvent event) {
    for (var line in event.lines) {
      print(line);
    }
  }
}