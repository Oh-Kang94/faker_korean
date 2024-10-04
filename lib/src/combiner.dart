class Combiner {
  final String _insertString;

  const Combiner({
    String? insertString,
  }) : _insertString = insertString ?? ' ';

  String combineAndInsert(List<String> stringList) {
    String result = '';

    for (int i = 0; i < stringList.length; i++) {
      result += stringList[i];

      if (i != stringList.length - 1) {
        result += _insertString;
      }
    }
    return result;
  }
}
