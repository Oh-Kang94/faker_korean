import 'package:faker_korean/faker_korean.dart';

class Lipsum {
  final Shuffler shuffle;

  const Lipsum(this.shuffle);

  String word({int maxLen = 7, int minLen = 5}) =>
      shuffle.stringKorean(len: shuffle.integer(maxLen, min: minLen));

  String sentence({int wordCount = 5}) {
    return '${List.generate(wordCount, (_) => word()).join(' ')}.';
  }

  String paragraph({int sentenceCount = 5}) {
    return List.generate(sentenceCount, (_) => sentence()).join(' ');
  }
}
