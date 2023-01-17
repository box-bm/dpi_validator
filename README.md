# DPI Validator

A package for check the DPI.

This plugin works fine in any platform (Android, iOS, MacOS, Linux and Windows).

## Features

| Feature               | Android | iOS | MacOS | Windows | Linux | Web |
| --------------------- | ------- | --- | ----- | ------- | ----- | --- |
| validateDPI           | ✅      | ✅  | ✅    | ✅      | ✅    | ✅  |
| findDepartmentByDPI   | ✅      | ✅  | ✅    | ✅      | ✅    | ✅  |
| findMunicipalityByDPI | ✅      | ✅  | ✅    | ✅      | ✅    | ✅  |

## Getting started

This plugin works only in Guatemala City
Only you need to install and use that.

## Usage

From any place of your code, only call function.

```dart
import 'package:dpi_validator/dpi_validator.dart';

// Will return an object.
// DPIResponse(
//  message: "OK",
//  isValid: true,
//  municipality: "Municipio de Guatemala",
//  department: "GUATEMALA")
validateDPI("your dpi");

// Will return a string. For example: "Municipio de Guatemala"
findMunicipalityByDPI("your dpi");

// Will return a string. For example: "GUATEMALA", "JUTIAPA"
findDepartmentByDPI("your dpi");
```

## Additional information

This plugins works offline.
