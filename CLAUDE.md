# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Commands

```bash
flutter pub get        # Install dependencies
flutter test           # Run all tests
flutter test test/dpi_validator_test.dart  # Run specific test file
flutter analyze        # Static analysis / linting
```

## Architecture

This is a Flutter/Dart package that validates Guatemalan DPI (Document Personal de Identificación) numbers and returns the associated department and municipality.

**DPI format (13 digits):**
- Digits 0–7: Sequential number
- Digit 8: Check digit (Rule 11 checksum)
- Digits 9–10: Department code (01–22)
- Digits 11–12: Municipality code within department

**Public API** (`lib/dpi_validator.dart` re-exports from `lib/src/dpi_validator.dart`):
- `validateDPI(dynamic dpi) → DPIResponse` — full validation + lookups
- `findDepartmentByDPI(String dpi) → String`
- `findMunicipalityByDPI(String dpi) → String`

**Validation flow in `lib/src/dpi_validator.dart`:**
1. Cast to string, check numeric-only, check exactly 13 digits
2. Run Rule 11 checksum (`lib/src/check_digit.dart`) on first 8 digits
3. Look up department from digits 9–10 (`lib/src/data/departments.dart`)
4. Look up municipality from digits 9–12 (`lib/src/data/municipalities.dart`)
5. Return `DPIResponse` (message, isValid, department, municipality)

**Rule 11 algorithm** (`check_digit.dart`): `(11 - (weighted_sum % 11)) % 11` — the result must match digit 8.

**Data layer** (`lib/src/data/`): Static Dart `Map<String, String>` literals — no network calls, fully offline.
