import 'package:dpi_validator/dpi_validator.dart';
import 'package:dpi_validator/src/models/dpi_response.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const validDpiGuatemala = '2999225880101';
  const validDpiQuetzaltenango = '2222624190903';
  const validDpiTotonicapan = '2349313450808';

  group('findDepartmentByDPI', () {
    test('returns correct department', () {
      expect(findDepartmentByDPI(validDpiGuatemala), 'GUATEMALA');
      expect(findDepartmentByDPI(validDpiQuetzaltenango), 'QUETZALTENANGO');
      expect(findDepartmentByDPI(validDpiTotonicapan), 'TOTONICAPAN');
    });

    test('throws on wrong length', () {
      expect(() => findDepartmentByDPI('1234'), throwsA(isA<String>()));
    });

    test('throws on unknown department code', () {
      expect(
        () => findDepartmentByDPI('1234567892399'),
        throwsA('Department not exist'),
      );
    });
  });

  group('findMunicipalityByDPI', () {
    test('returns correct municipality', () {
      expect(findMunicipalityByDPI(validDpiGuatemala), 'Municipio de Guatemala');
      expect(findMunicipalityByDPI(validDpiQuetzaltenango), 'Olintepeque');
      expect(findMunicipalityByDPI(validDpiTotonicapan), 'San Bartolo');
    });

    test('throws on wrong length', () {
      expect(() => findMunicipalityByDPI('1234'), throwsA(isA<String>()));
    });

    test('throws on unknown municipality code', () {
      expect(
        () => findMunicipalityByDPI('1234567892399'),
        throwsA('Municipality not exist'),
      );
    });
  });

  group('validateDPI', () {
    test('returns valid response for correct DPIs', () {
      expect(
        validateDPI(validDpiGuatemala),
        const DPIResponse(
          message: 'OK',
          isValid: true,
          municipality: 'Municipio de Guatemala',
          department: 'GUATEMALA',
        ),
      );
      expect(
        validateDPI(validDpiQuetzaltenango),
        const DPIResponse(
          message: 'OK',
          isValid: true,
          municipality: 'Olintepeque',
          department: 'QUETZALTENANGO',
        ),
      );
      expect(
        validateDPI(validDpiTotonicapan),
        const DPIResponse(
          message: 'OK',
          isValid: true,
          municipality: 'San Bartolo',
          department: 'TOTONICAPAN',
        ),
      );
    });

    test('accepts int input', () {
      expect(validateDPI(2999225880101).isValid, isTrue);
    });

    test('returns invalid for non-numeric input', () {
      expect(
        validateDPI('ABC1234567890'),
        const DPIResponse(message: 'The DPI needs only digits', isValid: false),
      );
      expect(
        validateDPI('1234-567-8901'),
        const DPIResponse(message: 'The DPI needs only digits', isValid: false),
      );
    });

    test('returns invalid when length is not 13 digits', () {
      expect(
        validateDPI('123456789012'),
        const DPIResponse(message: 'DPI require 13 digits', isValid: false),
      );
      expect(
        validateDPI('12345678901234'),
        const DPIResponse(message: 'DPI require 13 digits', isValid: false),
      );
    });

    test('returns invalid when check digit fails', () {
      expect(
        validateDPI('2345559970101'),
        const DPIResponse(message: 'DPI invalid', isValid: false),
      );
    });

    test('isValid is false and municipality/department are null on error', () {
      final response = validateDPI('0000000000000');
      expect(response.isValid, isFalse);
      expect(response.department, isNull);
      expect(response.municipality, isNull);
    });
  });
}
