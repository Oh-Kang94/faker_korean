import 'package:faker_korean/src/shuffler.dart';
import 'package:faker_korean/src/combiner.dart';

import 'data/names_data.dart';

class Names {
  final Shuffler shuffle;

  final String _familyName;
  final String _lastName;

  Names(this.shuffle)
      : _familyName = shuffle.element(familyNameList),
        _lastName = shuffle.element(lastNamesList);

  String fullName({String separatorString = ''}) {
    return Combiner(insertString: separatorString).combineAndInsert(
      [_familyName, _lastName],
    );
  }

  String get lastName => _lastName;

  String get familyName => _familyName;
}
