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

  /// Generates a random numeric string with the specified [length].
  ///
  /// Example:
  /// ```dart
  /// var shuffler = Shuffler();
  /// print(shuffler.numberOfLength(6)); // Outputs a random 6-digit number as a string
  /// ```
  String numberOfLength(int length) => numbers(10, length).join();

  /// Generates a random boolean value.
  ///
  /// Example:
  /// ```dart
  /// var shuffler = Shuffler();
  /// print(shuffler.boolean()); // Outputs true or false randomly
  /// ```
  bool boolean() => _random.nextBool();

  /// Generates a random double between [min] and [scale].
  ///
  /// Example:
  /// ```dart
  /// var shuffler = Shuffler();
  /// print(shuffler.decimal(scale: 5)); // Outputs a random decimal between 0 and 5
  /// ```
  double decimal({num scale = 1, num min = 0}) =>
      _random.nextDouble() * scale + min;

  /// Generates a random string of a length between [min] and [max].
  ///
  /// Example:
  /// ```dart
  /// var shuffler = Shuffler();
  /// print(shuffler.string(10)); // Outputs a random string with a length between 1 and 10
  /// ```
  String string(int max, {int min = 1}) => String.fromCharCodes(
        numbers(92, integer(max, min: min)).map((value) => value + 33),
      );

  /// Generates a list of random elements based on the provided [generator] function, with a size between [min] and [max].
  ///
  /// Example:
  /// ```dart
  /// var shuffler = Shuffler();
  /// var generated = shuffler.amount((i) => i * 2, 5);
  /// print(generated); // Outputs a list with a random number of elements, e.g., [0, 2, 4]
  /// ```
  List<T> amount<T>(T Function(int i) generator, int max, {int min = 1}) {
    var length = integer(max, min: min);
    return List.generate(length, generator);
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

  /// Generates a random string of [length] from the given [charSet].
  ///
  /// Example:
  /// ```dart
  /// var shuffler = Shuffler();
  /// print(shuffler.fromCharSet('abc123', 5)); // Outputs a random string from the charset
  /// ```
  String fromCharSet(String charSet, int length) => String.fromCharCodes(
        Iterable.generate(
          length,
          (_) => charSet.codeUnitAt(
            _random.nextInt(charSet.length),
          ),
        ),
      );
}
