import 'package:faker_korean/faker_korean.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('FakerK General tests', () {
    late FakerK faker;

    // 각 테스트 실행 전에 FakerK 인스턴스를 생성합니다.
    setUp(() {
      faker = FakerK();
    });

    test('names 객체가 제대로 초기화되는지 확인', () {
      expect(faker.names, isA<Names>());
    });

    test('familyName이 정상적으로 반환되는지 확인', () {
      final familyName = faker.names.familyName;
      expect(familyName, isNotEmpty);
      expect(familyName, isA<String>());
    });

    test('lastName이 정상적으로 반환되는지 확인', () {
      final lastName = faker.names.lastName;
      expect(lastName, isNotEmpty);
      expect(lastName, isA<String>());
    });

    test('fullName이 정상적으로 반환되는지 확인', () {
      final fullName = faker.names.fullName;
      expect(fullName, isNotEmpty);
      expect(fullName, isA<String>());
      expect(fullName.length, greaterThan(1)); // fullName이 2자 이상인지 확인
    });

    test('시드를 제공했을 때 같은 값이 나오는지 확인', () {
      final faker1 = FakerK(seed: 42);
      final faker2 = FakerK(seed: 42);

      expect(faker1.names.fullName, faker2.names.fullName);
      expect(faker1.names.familyName, faker2.names.familyName);
      expect(faker1.names.lastName, faker2.names.lastName);
    });

    test('시드를 다르게 줬을 때 다른 값이 나오는지 확인', () {
      final faker1 = FakerK(seed: 42);
      final faker2 = FakerK(seed: 43);

      expect(faker1.names.fullName, isNot(faker2.names.fullName));
      expect(faker1.names.familyName, isNot(faker2.names.familyName));
      expect(faker1.names.lastName, isNot(faker2.names.lastName));
    });
  });
}
