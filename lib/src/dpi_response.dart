/// [DPIResponse] is a class what include elements of the dpi validations
///
/// ```dart
/// DPIResponse({
///   required this.message,
///   required this.isValid,
///   this.department,
///   this.municipality,
/// });
/// ```
class DPIResponse {
  /// [message] is a description of the result
  String message;

  /// [isValid] is boolean type, send `true` if it's valid or `false` if has error
  bool isValid;

  /// [department] name what return a `string` and it's filled when validate dpi
  String? department;

  /// [municipality] name what return a `string` and it's filled when validate dpi
  String? municipality;

  /// [DPIResponse] is the class what will return and show feedback when validate DPI
  DPIResponse({
    required this.message,
    required this.isValid,
    this.department,
    this.municipality,
  });

  @override
  String toString() {
    return "message: $message, isValid: $isValid, department: $department, municipality: $municipality";
  }
}
