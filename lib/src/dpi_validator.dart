import 'package:dpi_validator/dpi_validator.dart';
import 'package:dpi_validator/src/dpi_response.dart';

/// Check dpi it's ok following two simples rules, have 13 characters and
///
/// It require only [dpi] as a param. This will be input to check.
///
/// ```dart
/// validateDPI("") === throw "The DPI needs only digits"
/// validateDPI("1234") == throw "DPI require 13 digits"
/// validateDPI("1234567890101") == OK, Department: "GUATEMALA", Municipality: "Municipio de Guatemala".
/// ```
DPIResponse validateDPI(dynamic dpi) {
  try {
    dpi = dpi.toString();
    // validate if has only numbers
    if (int.tryParse(dpi) == null) {
      throw 'The DPI needs only digits';
    }

    // check the lengt of the dpi, it's required to have 13 digits, no more or less
    if (dpi.length != 13) {
      throw 'DPI require 13 digits';
    }

    // find in each list and get data by municipality and department
    String municipality = findMunicipalityByDPI(dpi);
    String department = findDepartmentByDPI(dpi);

    // Return a valid response
    return DPIResponse(
        message: "OK",
        isValid: true,
        municipality: municipality,
        department: department);
  } catch (e) {
    return DPIResponse(message: e.toString(), isValid: false);
  }
}
