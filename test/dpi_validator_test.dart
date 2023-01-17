import 'package:dpi_validator/dpi_validator.dart';
import 'package:dpi_validator/src/dpi_response.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  var dpi = '2999225880101';
  test('Find municipalities', () {
    expect(
      findMunicipalityByDPI(dpi),
      "Municipio de Guatemala",
    );
  });

  test('Find departments', () {
    expect(
      findDepartmentByDPI(dpi),
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
