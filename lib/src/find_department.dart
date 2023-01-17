import 'data/departments.dart';

String findDepartment(String dpi) {
  var departmentCode = dpi.substring(9, 11);
  if (!departments.containsKey(departmentCode)) {
    throw "Department not exist";
  }

  return departments.entries
      .firstWhere((element) => element.key == departmentCode)
      .value;
}
