/// Check dpi it's ok following two simples rules, have 13 characters and
///
/// It require only [dpi] as a param. This will be input to check.
///
/// ```dart
/// checkDigitByDPI("") === throw "The DPI needs only digits"
/// checkDigitByDPI("1234567890101") == OK, Department: "GUATEMALA", Municipality: "Municipio de Guatemala".
/// ```

void checkDigitByDPI(String dpi) {
  int result = 0;

  dpi
      .substring(0, 8)
      .split('')
      .reversed
      .toList()
      .map((e) => int.parse(e))
      .toList()
      .asMap()
      .forEach((index, element) {
    result += (element * (index + 2));
  });
  int calculatedLastValue = (11 - (result % 11)) % 11;

  if (calculatedLastValue.toString() != dpi.substring(8, 9)) {
    throw "DPI invalid";
  }
}
