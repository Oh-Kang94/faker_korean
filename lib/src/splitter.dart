class Splitter {
  final String _insertString;

  const Splitter({
    String? insertString,
  }) : _insertString = insertString ?? ' ';

  String splitAndInsert(List<String> stringList) {
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
