import 'dart:math';

/// A class that provides various randomization utilities using the Dart [Random] class.
class Shuffler {
  /// Random instance, can be seeded for reproducible randomness.
  final Random _random;

  /// Constructor for [Shuffler]. If [seedNumber] is provided, the randomization will be deterministic.
  Shuffler({int? seedNumber}) : _random = Random(seedNumber);

  /// Returns a random element from the given [list].
  ///
  /// Example:
  /// ```dart
  /// var shuffler = Shuffler();
  /// print(shuffler.element([1, 2, 3, 4])); // Outputs a random element from the list
  /// ```
  T element<T>(List<T> list) {
    return list[_random.nextInt(list.length)];
  }

  /// Returns a random key from the given [map].
  ///
  /// Example:
  /// ```dart
  /// var shuffler = Shuffler();
  /// var myMap = {'a': 1, 'b': 2, 'c': 3};
  /// print(shuffler.mapElementKey(myMap)); // Outputs a random key, e.g., 'b'
  /// ```
  T mapElementKey<T>(Map<dynamic, dynamic> map) {
    return map.keys.elementAt(_random.nextInt(map.length));
  }

  /// Returns a random value from the given [map].
  ///
  /// Example:
  /// ```dart
  /// var shuffler = Shuffler();
  /// var myMap = {'a': 1, 'b': 2, 'c': 3};
  /// print(shuffler.mapElementValue(myMap)); // Outputs a random value, e.g., 2
  /// ```
  T mapElementValue<T>(Map<dynamic, dynamic> map) {
    return map.values.elementAt(_random.nextInt(map.length));
  }

  /// Generates a list of random integers between 0 and [max] (exclusive), repeated [times] times.
  ///
  /// Example:
  /// ```dart
  /// var shuffler = Shuffler();
  /// print(shuffler.numbers(10, 5)); // Outputs 5 random numbers between 0 and 9
  /// ```
  List<int> numbers(num max, num times) {
    var number = <int>[];

    for (var i = 0; i < times; i++) {
      number.add(_random.nextInt(max as int));
    }
    return number;
  }

  /// Returns a random integer between [min] (inclusive) and [max] (exclusive).
  ///
  /// Example:
  /// ```dart
  /// var shuffler = Shuffler();
  /// print(shuffler.integer(10, min: 5)); // Outputs a random integer between 5 and 9
  /// ```
  int integer(int max, {int min = 0}) =>
      max == min ? max : _random.nextInt(max - min) + min;

  double makeDouble(int maxDigits, {int minDigits = 1}) {
    double maxValue = pow(10, maxDigits - 1).toDouble();
    double minValue = pow(10, minDigits - 2).toDouble();

    return (_random.nextDouble() * (maxValue - minValue) + minValue)
        .floorToDouble();
  }

  /// Generates a random boolean value.
  ///
  /// Example:
  /// ```dart
  /// var shuffler = Shuffler();
  /// print(shuffler.boolean()); // Outputs true or false randomly
  /// ```
  bool boolean() => _random.nextBool();

  /// Generates a random string of a length between [min] and [max].
  ///
  /// Example:
  /// ```dart
  /// var shuffler = Shuffler();
  /// print(shuffler.stringKorean(10)); // Outputs a random string with a length between 1 and 10
  /// ```
  String stringKorean({int len = 10}) {
    const String chars =
        "가각간갇갈감갑갚갛나날남납낱내낸녀녁노놀놈놉놋누눈눌늙니다달담답당대댁더도독돈돌돕동둘듭디라락란랏래랭로락리마막만맛매맥모목몽무문물미민바박반받밧배백보복본봉부북비사삭산샤서석선설섣세섹소솔숨쉰수숙술순슬시식신아악안앉애액야약양얏여역연열영예오옥온옷왕왜외위유육율응이익인일임입잇자작잔잡장재저전절점제조종주준줄줏지직차착찬찾처척천체치키타탁탈탓탱파편평포풀피하학한해햇혼휘힝";

    return List.generate(len, (index) => chars[_random.nextInt(chars.length)])
        .join();
  }

  String generateWithRegex({
    int max = 12,
    int min = 4,
    required RegExp pattern,
  }) {
    final Random random = Random();
    final int length = integer(max, min: 4);

    return List.generate(length, (_) {
      String generatedChar;
      do {
        generatedChar = String.fromCharCode(33 + random.nextInt(94));
      } while (!pattern.hasMatch(generatedChar));
      return generatedChar;
    }).join('');
  }

  /// Replaces `#` characters in the given [pattern] list with random digits.
  ///
  /// Example:
  /// ```dart
  /// var shuffler = Shuffler();
  /// print(shuffler.fromPattern(['###-###'])); // Outputs something like '123-456'
  /// ```
  String fromPattern(List pattern) =>
      element(pattern).splitMapJoin('#', onMatch: (_) => numbers(9, 1).join());

  /// Replaces `#` characters in the given [pattern] list with random hexadecimal digits.
  ///
  /// Example:
  /// ```dart
  /// var shuffler = Shuffler();
  /// print(shuffler.fromPatternToHex(['###-###'])); // Outputs something like 'abc-def'
  /// ```
  String fromPatternToHex(List pattern) => element(pattern).splitMapJoin(
        '#',
        onMatch: (_) =>
            numbers(16, 1).map((number) => number.toRadixString(16)).join(),
      );
}
