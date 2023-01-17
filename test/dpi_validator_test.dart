import 'package:dpi_validator/dpi_validator.dart';
import 'package:dpi_validator/src/dpi_response.dart';
import 'package:dpi_validator/src/find_department.dart';
import 'package:dpi_validator/src/find_municipality.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  var dpi = '2999225880101';
  test('Find municipalities', () {
    expect(
      findMunicipality(dpi),
      "Municipio de Guatemala",
    );
  });

  test('Find departments', () {
    expect(
      findDepartment(dpi),
      "GUATEMALA",
    );
  });

  test('Validate DPI', () {
    expect(
      validateDPI(dpi).toString(),
      DPIResponse(
              message: "OK",
              isValid: true,
              municipality: "Municipio de Guatemala",
              department: "GUATEMALA")
          .toString(),
    );
  });
}
