import 'package:faker_korean/faker_korean.dart';
import 'package:flutter_test/flutter_test.dart';

import 'util.dart';

void main() {
  group("Lipsum Unit Test", () {
    late final FakerK faker;

    setUpAll(() {
      faker = FakerK();
    });

    test('Word Test', () {
      const int maxLen = 10;
      const int minLen = 3;
      final String word = faker.lipsum.word();
      final String wordWRestricted =
          faker.lipsum.word(maxLen: maxLen, minLen: minLen);

      expect(word.length, expectInRange(5, 7));
      expect(wordWRestricted.length, expectInRange(minLen, maxLen));
    });

    test('Sentence Test', () {
      const int wordCount = 10;
      final String sentence = faker.lipsum.sentence();
      final String sentenceWRestricted =
          faker.lipsum.sentence(wordCount: wordCount);

      expect(sentence.split(" ").length, equals(5));
      expect(sentenceWRestricted.split(" ").length, equals(wordCount));
    });

    test('Paragraph Test', () {
      const int sentenceCount = 10;
      final String paragraph = faker.lipsum.paragraph();
      final String paragraphWRestricted =
          faker.lipsum.paragraph(sentenceCount: sentenceCount);

      expect(paragraph.split(". ").length, equals(5));
      expect(paragraphWRestricted.split(". ").length, equals(sentenceCount));
    });
  });
}
