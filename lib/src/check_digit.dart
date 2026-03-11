/// Check dpi it's ok following two simples rules, have 13 characters and
///
/// It require only [dpi] as a param. This will be input to check.
///
/// ```dart
/// checkDigitByDPI("") === throw "The DPI needs only digits"
/// checkDigitByDPI("1234567890101") == OK, Department: "GUATEMALA", Municipality: "Municipio de Guatemala".
/// ```

void checkDigitByDPI(String dpi) {
  int sum = 0;
  final digits = dpi.substring(0, 8).split('').reversed.toList();

  for (int i = 0; i < digits.length; i++) {
    sum += int.parse(digits[i]) * (i + 2);
  }

  final calculatedCheckDigit = (11 - (sum % 11)) % 11;

  if (calculatedCheckDigit != int.parse(dpi[8])) {
    throw 'DPI invalid';
  }
}
