import 'package:faker_korean/faker_korean.dart';
import 'package:faker_korean/src/data/email_data.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Internet Unit Test', () {
    late final FakerK faker;
    setUpAll(() {
      faker = FakerK();
    });

    test('Id Test', () {
      final String id = faker.internet.id;
      final RegExp idRegex = RegExp(r'^[a-zA-Z0-9._%+-]{4,12}$');

      expect(id, isA<String>());
      expect(id, matches(idRegex));
    });

    test('Email Test', () {
      final String email = faker.internet.email;
      final RegExp emailRegex =
          RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9-]+\.[a-zA-Z]{2,30}$');

      expect(email, matches(emailRegex));
    });

    test('Disposable Email Test', () {
      final String disposableEmail = faker.internet.disposableEmail;
      final RegExp disposableEmailRegex =
          RegExp(r'^[a-zA-Z0-9._%+-]+@mailinator\.com$');

      expect(disposableEmail, matches(disposableEmailRegex));
    });

    test('Url Test', () {
      final String url = faker.internet.url;
      final RegExp urlRegex =
          RegExp(r'^https:\/\/www\.[a-z0-9_-]+\.([a-z]{2,})$');

      expect(url, matches(urlRegex));

      final String domain = url.split('.')[1];
      expect(domain, matches(RegExp(r'^[a-z0-9_-]+$')));

      final String domainSuffix = url.split('.').last;
      expect(domainSuffixes.contains(domainSuffix), isTrue);
      expect(domainSuffix.length, greaterThanOrEqualTo(2));
    });

    test('Uri Test', () {
      final Uri uri = faker.internet.uri;
      final String host = uri.host;
      final String domain = host.split('.').first;
      final String domainSuffix = host.split('.').last;
      // Scheme
      expect(uri.scheme, equals('https'));
      // Domain
      expect(domainSuffixes.contains(domainSuffix), isTrue);
      expect(domainSuffix.length, greaterThanOrEqualTo(2));
      expect(domain, matches(RegExp(r'^[a-z0-9_-]+$')));
      // fragment
      expect(int.parse(uri.fragment), lessThanOrEqualTo(15));
      // QueryParameter
      expect(int.tryParse(uri.queryParameters['id']!), lessThanOrEqualTo(15));
    });

    test('MacAddress Test', () {
      final String macAddress = faker.internet.macAddress;

      final RegExp macAddressRegex = RegExp(
        r'^([0-9a-fA-F]{2}:){5}[0-9a-fA-F]{2}$',
      );

      expect(macAddress, matches(macAddressRegex));

      expect(macAddress.length, equals(17));
    });
  });
}
