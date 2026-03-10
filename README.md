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

## Support

[![Buy Me A Coffee](https://img.buymeacoffee.com/button-api/?text=Buy%20me%20a%20coffee&emoji=%E2%98%95&slug=boxdev&button_colour=FFDD00&font_colour=000000&font_family=Cookie&outline_colour=000000&coffee_colour=ffffff)](https://www.buymeacoffee.com/boxdev)
