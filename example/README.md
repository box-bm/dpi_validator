# Example

To use functions, you only need to import the package and then use function as you want.

Here is a simple examples

```dart
import 'package:dpi_validator/dpi_validator.dart';

// Will return an object.
// DPIResponse(
//  message: "OK",
//  isValid: true,
//  municipality: "Municipio de Guatemala",
//  department: "GUATEMALA")
validateDPI("1234567890101");

// Will return a string. For example: "Municipio de Guatemala"
findMunicipality("1234567890101");

// Will return a string. For example: "GUATEMALA", "JUTIAPA"
findDepartment("1234567890101");
```
