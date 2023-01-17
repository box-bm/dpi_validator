import 'data/departments.dart';

/// Check and find department by DPI and return `string`
///
/// It require only [dpi] as a param. This will be input to check.
///
/// ```dart
/// findDepartmentByDPI("") === throw "DPI require 13 digits"
/// findDepartmentByDPI("1234") == throw "DPI require 13 digits"
/// findDepartmentByDPI("1234567892399") == throw "Department not exist";
/// findDepartmentByDPI("1234567890101") == "GUATEMALA"
/// ```
String findDepartmentByDPI(String dpi) {
  if (dpi.length == 13) throw 'DPI require 13 digits';

  var departmentCode = dpi.substring(9, 11);
  if (!departments.containsKey(departmentCode)) {
    throw "Department not exist";
  }

  return departments.entries
      .firstWhere((element) => element.key == departmentCode)
      .value;
}
