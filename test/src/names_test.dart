import 'package:faker_korean/faker_korean.dart';
import 'package:faker_korean/src/data/names_data.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Names Unit Test', () {
    late final FakerK faker;
    late final String familyName;
    late final String lastName;

    setUpAll(() {
      faker = FakerK();
      faker.names.familyName;
      familyName = faker.names.familyName;
      lastName = faker.names.lastName;
    });

    test('Family Name Test', () {
      expect(familyNameList.contains(familyName), isTrue);
    });

    test('Last Name Test', () {
      expect(lastNamesList.contains(lastName), isTrue);
    });

    test('FullName Test', () {
      final fullName = faker.names.fullName();
      expect(fullName, equals('$familyName$lastName'));
    });
  });
}
