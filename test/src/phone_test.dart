import 'package:faker_korean/faker_korean.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Phone Unit Test', () {
    late final FakerK faker;

    setUpAll(() {
      faker = FakerK();
    });

    test('TelNumber Test', () {
      final String telNumber = faker.phone.telNumber();
      final RegExp telNumberRegex = RegExp(r'^[\d]{2,3}-[\d]{3,4}-[\d]{3,4}');

      final String telNumberWWhiteSpace = faker.phone.telNumber(separator: ' ');
      final RegExp telNumberWWhiteSpaceRegex =
          RegExp(r'^[\d]{2,3}\s[\d]{3,4}\s[\d]{3,4}');

      expect(telNumber, matches(telNumberRegex));
      expect(telNumberWWhiteSpace, matches(telNumberWWhiteSpaceRegex));
    });

    test('PhoneNumber Test', () {
      final String phoneNumber = faker.phone.phoneNumber();
      final RegExp phoneNumberRegex = RegExp(r'^010-[\d]{4,4}-[\d]{4,4}');

      final String phoneNumberWWhiteSpace =
          faker.phone.phoneNumber(separator: ' ');
      final RegExp phoneNumberWWhiteSpaceRegex =
          RegExp(r'^010\s[\d]{4,4}\s[\d]{4,4}');

      expect(phoneNumber, matches(phoneNumberRegex));
      expect(phoneNumberWWhiteSpace, matches(phoneNumberWWhiteSpaceRegex));
    });
  });
}
