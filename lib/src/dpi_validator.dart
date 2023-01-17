import 'package:dpi_validator/src/dpi_response.dart';
import 'package:dpi_validator/src/find_department.dart';
import 'package:dpi_validator/src/find_municipality.dart';

DPIResponse validateDPI(dynamic dpi) {
  try {
    dpi = dpi.toString();
    if (int.tryParse(dpi) == null) {
      throw 'The DPI needs only digits';
    }

    if (dpi.length != 13) {
      throw 'DPI require 13 digits';
    }
    String municipality = findMunicipality(dpi);
    String department = findDepartment(dpi);
    return DPIResponse(
        message: "OK",
        isValid: true,
        municipality: municipality,
        department: department);
  } catch (e) {
    return DPIResponse(message: e.toString(), isValid: false);
  }
}
