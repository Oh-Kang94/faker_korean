import 'package:flutter_test/flutter_test.dart';

Matcher expectInRange(int min, int max) {
  return predicate<int>(
    (value) {
      return value >= min && value <= max;
    },
    'is between $min and $max',
  );
}
