import 'package:faker_korean/faker_korean.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Faker Util Unit Test', () {
    test('Combiner test', () {
      const Combiner combiner = Combiner();
      const Combiner combinerWDash = Combiner(insertString: '-');
      expect(combiner.combineAndInsert(["안녕", "하세요"]), "안녕 하세요");
      expect(combinerWDash.combineAndInsert(["안녕", "하세요"]), "안녕-하세요");
    });

    test('If the seed is same as others, results are same.', () {
      final faker1 = FakerK(seed: 42);
      final faker2 = FakerK(seed: 42);

      expect(faker1.names.fullName(), faker2.names.fullName());
      expect(faker1.names.familyName, faker2.names.familyName);
      expect(faker1.names.lastName, faker2.names.lastName);
    });

    test('If the seed is different from others, results are different.', () {
      final faker1 = FakerK(seed: 42);
      final faker2 = FakerK(seed: 43);

      expect(faker1.names.fullName, isNot(faker2.names.fullName));
      expect(faker1.names.familyName, isNot(faker2.names.familyName));
      expect(faker1.names.lastName, isNot(faker2.names.lastName));
    });
  });
}
