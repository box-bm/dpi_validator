class DPIResponse {
  String message;
  bool isValid;
  String? department;
  String? municipality;

  DPIResponse({
    this.department,
    this.municipality,
    required this.message,
    required this.isValid,
  });

  @override
  String toString() {
    return "message: $message, isValid: $isValid, department: $department, municipality: $municipality";
  }
}
