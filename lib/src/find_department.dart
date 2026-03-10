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
  if (dpi.length != 13) throw 'DPI require 13 digits';

  final departmentCode = dpi.substring(9, 11);
  final department = departments[departmentCode];

  if (department == null) throw 'Department not exist';

  return department;
}
