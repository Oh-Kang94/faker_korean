import 'package:faker_korean/faker_korean.dart';
import 'package:faker_korean/src/data/address_data.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Address Unit Test', () {
    late FakerK faker;
    setUp(() {
      faker = FakerK();
    });

    test('PostalCode', () {
      final String postalCode = faker.address.postalCode;
      expect(postalCode.length, equals(5));
    });

    test('SiAddress', () {
      final String siAddress = faker.address.siAddress;
      expect(sidoMap.containsValue(siAddress), isTrue);
    });

    test('SidoguAddress', () {
      final String sidoguAddress = faker.address.sidoguAddress;
      expect(sidoguMap.containsValue(sidoguAddress), isTrue);
    });

    test('RoadAddress', () {
      final String roadAddress = faker.address.roadAddress;

      final bool startsWithValidRoad =
          roadList.any((road) => roadAddress.startsWith(road));

      final RegExp roadAddressPattern = RegExp(r'\d+$');
      final String? numberPart = roadAddressPattern.stringMatch(roadAddress);

      expect(startsWithValidRoad, isTrue);
      expect(numberPart, isNotNull);
      expect(int.parse(numberPart!), inInclusiveRange(0, 999));
    });

    test('DetailAddress', () {
      final String detailAddress = faker.address.detailAddress;
      final RegExp detailAddressPattern = RegExp(r'(\d+)동 (\d+)호');
      final Match? match = detailAddressPattern.firstMatch(detailAddress);

      expect(match, isNotNull);

      if (match != null) {
        final int dong = int.parse(match.group(1)!);
        final int ho = int.parse(match.group(2)!);

        expect(dong, inInclusiveRange(0, 1099));

        expect(ho, inInclusiveRange(0, 9999));
      }
    });

    test('Full Address Test', () {
      final FakerK faker = FakerK(seed: 123);
      final String fullAddress = faker.address.fullAddress;

      final String postalCode = faker.address.postalCode;
      final String siAddress = faker.address.siAddress;
      final String sidoguAddress = faker.address.sidoguAddress;
      final String roadAddress = faker.address.roadAddress;
      final String detailAddress = faker.address.detailAddress;

      expect(fullAddress.startsWith('($postalCode)'), isTrue);
      expect(fullAddress.contains(siAddress), isTrue);
      expect(fullAddress.contains(sidoguAddress), isTrue);
      expect(fullAddress.contains(roadAddress), isTrue);
      expect(fullAddress.endsWith(detailAddress), isTrue);
    });
  });
}
