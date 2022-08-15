
/// ------------------------------------------------------------
/// -----------------------Formz tutorial-----------------------
/// ------------------------------------------------------------

/// Snap 1 - Create Password Validation Model

// First, import formz of course
import 'package:formz/formz.dart';

// This will be our model that extends FormzInput. The first parameter
// is the input type, the second one is the error type, that doesn't exist yet.
class PasswordInput extends FormzInput<String, PasswordInputError> {

}

/// Snap 2 - Create PasswordInputError type

// To keep it simple we use only 3 errors
enum PasswordInputError {
  tooShort,
  noDigit,
  noUppercase,
}