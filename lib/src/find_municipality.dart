import 'package:dpi_validator/src/data/municipalities.dart';

/// Check and find municipality by DPI and return `string`
///
/// It require only [dpi] as a param. This will be input to check.
///
/// ```dart
/// findMunicipalityByDPI("") === throw "DPI require 13 digits"
/// findMunicipalityByDPI("1234") == throw "DPI require 13 digits"
/// findMunicipalityByDPI("1234567892399") == throw "Municipality not exist";
/// findMunicipalityByDPI("1234567890101") == "Municipio de Guatemala"
/// ```

String findMunicipalityByDPI(String dpi) {
  if (dpi.length != 13) throw 'DPI require 13 digits';

  final municipalityCode = dpi.substring(9);
  final municipality = municipalities[municipalityCode];

  if (municipality == null) throw 'Municipality not exist';

  return municipality;
}
