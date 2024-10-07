import 'dart:math';

class Shuffler {
  final Random _random;

  /// Constructor for [Shuffler]. If [seedNumber] is provided, the randomization will be deterministic.
  Shuffler({int? seedNumber}) : _random = Random(seedNumber);

  T element<T>(List<T> list) {
    return list[_random.nextInt(list.length)];
  }

  T mapElementKey<T>(Map<dynamic, dynamic> map) {
    return map.keys.elementAt(_random.nextInt(map.length));
  }

  T mapElementValue<T>(Map<dynamic, dynamic> map) {
    return map.values.elementAt(_random.nextInt(map.length));
  }

  List<int> numbers(num max, num times) {
    var number = <int>[];

    for (var i = 0; i < times; i++) {
      number.add(_random.nextInt(max as int));
    }
    return number;
  }

  int integer(int max, {int min = 0}) =>
      max == min ? max : _random.nextInt(max - min) + min;

  double makeDouble(int maxDigits, {int minDigits = 1}) {
    double maxValue = pow(10, maxDigits).toDouble();
    double minValue = pow(10, minDigits - 1).toDouble();

    return (_random.nextDouble() * (maxValue - minValue) + minValue)
        .floorToDouble();
  }

  int integerCompareDigits(int maxDigits, {int minDigits = 1}) {
    return makeDouble(maxDigits, minDigits: minDigits).floor();
  }

  bool boolean() => _random.nextBool();

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
}
