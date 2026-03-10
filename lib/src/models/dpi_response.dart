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
  final String message;

  /// [isValid] is boolean type, send `true` if it's valid or `false` if has error
  final bool isValid;

  /// [department] name what return a `string` and it's filled when validate dpi
  final String? department;

  /// [municipality] name what return a `string` and it's filled when validate dpi
  final String? municipality;

  /// [DPIResponse] is the class what will return and show feedback when validate DPI
  const DPIResponse({
    required this.message,
    required this.isValid,
    this.department,
    this.municipality,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DPIResponse &&
          message == other.message &&
          isValid == other.isValid &&
          department == other.department &&
          municipality == other.municipality;

  @override
  int get hashCode =>
      Object.hash(message, isValid, department, municipality);

  @override
  String toString() {
    return "message: $message, isValid: $isValid, department: $department, municipality: $municipality";
  }
}
