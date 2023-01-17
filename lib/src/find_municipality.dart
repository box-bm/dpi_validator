import 'package:dpi_validator/src/data/municipalities.dart';

String findMunicipality(String dpi) {
  var municipalityCode = dpi.substring(9);
  if (!municipalities.containsKey(municipalityCode)) {
    throw "Municipality code not exist";
  }

  return municipalities.entries
      .firstWhere((element) => element.key == municipalityCode)
      .value;
}
