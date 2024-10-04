import 'package:faker_korean/src/shuffler.dart';
import 'package:faker_korean/src/combiner.dart';

import 'data/names_data.dart';

class Names {
  final Shuffler shuffle;

  const Names(this.shuffle);

  String fullName({String separatorString = ''}) {
    return Combiner(insertString: separatorString).combineAndInsert(
      [shuffle.element(familyNameList), shuffle.element(lastNamesList)],
    );
  }

  String get lastName => shuffle.element(lastNamesList);

  String get familyName => shuffle.element(familyNameList);
}
