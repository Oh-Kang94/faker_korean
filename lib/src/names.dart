import 'package:faker_korean/src/shuffler.dart';

import 'data/names_data.dart';

class Names {
  final Shuffler shuffle;

  const Names(this.shuffle);

  String get fullName =>
      shuffle.element(familyNameList) + shuffle.element(lastNamesList);

  String get lastName => shuffle.element(lastNamesList);

  String get familyName => shuffle.element(familyNameList);
}
