import 'package:dpi_validator/dpi_validator.dart';
import 'package:dpi_validator/src/models/dpi_response.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  var dpi = '2999225880101';

  group("Check Municipalities", () {
    test('Find municipalities', () {
      expect(
        findMunicipalityByDPI(dpi),
        "Municipio de Guatemala",
      );
    });
  });

  group('Departments', () {
    test('Find departments', () {
      expect(
        findDepartmentByDPI(dpi),
        "GUATEMALA",
      );
    });
  });

  group("DPI Validation", () {
    test('Validate Real DPI', () {
      expect(
        validateDPI(dpi).toString(),
        DPIResponse(
                message: "OK",
                isValid: true,
                municipality: "Municipio de Guatemala",
                department: "GUATEMALA")
            .toString(),
      );
      expect(
        validateDPI(2222624190903).toString(),
        DPIResponse(
                message: "OK",
                isValid: true,
                municipality: "Olintepeque",
                department: "QUETZALTENANGO")
            .toString(),
      );
      expect(
        validateDPI(2222624190903).toString(),
        DPIResponse(
                message: "OK",
                isValid: true,
                municipality: "Olintepeque",
                department: "QUETZALTENANGO")
            .toString(),
      );
      expect(
        validateDPI(2349313450808).toString(),
        DPIResponse(
                message: "OK",
                isValid: true,
                municipality: "San Bartolo",
                department: "TOTONICAPAN")
            .toString(),
      );
    });

    test('DPI require 13 digits error', () {
      expect(
        validateDPI(82731928731049).toString(),
        DPIResponse(message: "DPI require 13 digits", isValid: false)
            .toString(),
      );
      expect(
        validateDPI(827318731049).toString(),
        DPIResponse(message: "DPI require 13 digits", isValid: false)
            .toString(),
      );
    });

    test("Invented DPIs", () {
      expect(
        validateDPI(2345559970101).toString(),
        DPIResponse(message: "DPI invalid", isValid: false).toString(),
      );
    });
  });
}
