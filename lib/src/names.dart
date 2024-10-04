import 'package:faker_korean/src/shuffler.dart';
import 'package:faker_korean/src/splitter.dart';

import 'data/names_data.dart';

class Names {
  final Shuffler shuffle;

  const Names(this.shuffle);

  String fullName({String separatorString = ''}) {
    return Splitter(insertString: separatorString).splitAndInsert(
      [shuffle.element(familyNameList), shuffle.element(lastNamesList)],
    );
  }

  String get lastName => shuffle.element(lastNamesList);

  String get familyName => shuffle.element(familyNameList);
}
