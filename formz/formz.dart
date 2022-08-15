/// ------------------------------------------------------------
/// -----------------------Formz tutorial-----------------------
/// --------https://medium.com/@tomicriedel/716d9ec9e844--------
/// ------------------------------------------------------------

/// Snap 1 - Create Password Validation Model

// First, import formz of course
import 'package:formz/formz.dart';

// This will be our model that extends FormzInput. The first parameter
// is the input type, the second one is the error type, that doesn't exist yet.
class PasswordInput extends FormzInput<String, PasswordInputError> {

}

/// Snap 2 - Add form input representations
class PasswordInput extends FormzInput<String, PasswordInputError> {
  // Call super.pure to represent an unmodified form input.
  // It's like the default input. E.g if you write super.pure('') and call isEmpty,
  // it will return true, but you can also write super.pure('Password') and it will return false.
  const PasswordInput.pure() : super.pure('');

  // Call super.dirty to represent a modified form input.
  const PasswordInput.dirty([String value = '']) : super.dirty(value);
}

/// Snap 3 - Create PasswordInputError type

// To keep it simple we use only 3 errors
enum PasswordInputError {
  tooShort,
  noDigit,
  noUppercase,
}
/// Snap 4 - Add password validation
class PasswordInput extends FormzInput<String, PasswordInputError> {
  // [...] - form input representations

  @override
  PaswordInputError validator(String value) {
    // Check if the password is too short
    if (value.length < 8) {
      return PasswordInputError.tooShort;
    }

    // Check if the password contains a digit
    if (!value.contains(RegExp(r'[0-9]'))) {
      return PasswordInputError.noDigit;
    }

    // Check if the password contains an uppercase letter
    if (!value.contains(RegExp(r'[A-Z]'))) {
      return PasswordInputError.noUppercase;
    }

    // If everything is fine, return null
    return null;
  }
}

/// Snap 5 - Create variable stat stores PasswordInput
final passwordInputValue = PasswordInput.pure();
// OR
final passwordInputValue = PasswordInput.dirty(value: 'Nerver gonna give you up');

/// Snap 6 - Interact with our passwordInput

// Returns the value of your input. If it's empty, it just returns ''
print(passwordInputValue.value); 

// Checks if the input is valid. If the returned value of your validator is null, it's valid.
// The opposite is isNotValid
print(passwordInputValue.isValid);
print(passwordInputValue.isNotValid);

// Returns the error of your input. If it's null, it's valid.
// Example output: PasswordInputError.tooShort
print(passwordInputValue.error);
