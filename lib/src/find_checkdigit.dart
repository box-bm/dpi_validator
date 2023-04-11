/// Check dpi it's ok following two simples rules, have 13 characters and
///
/// It require only [dpi] as a param. This will be input to check.
///
/// ```dart
/// find_checkdigitByDPI("") === throw "The DPI needs only digits"
/// find_checkdigitByDPI("1234567890101") == OK, Department: "GUATEMALA", Municipality: "Municipio de Guatemala".
/// ```

Integer find_checkdigitByDPI(String dpi) {
  var result = 0;
  for (var i = 0; i < 8; i++) {
    result = result + int.tryParse(dpi.substring(i, 1)) * (i+2);
  };
  result = result % 11;
  if (result == int.tryParse(dpi.substring(8, 1))){
    return 0
  }else {
    throw "DPI Invalid"
  }
}
