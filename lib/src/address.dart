import 'package:faker_korean/src/shuffler.dart';

import 'data/address_data.dart';

class Address {
  final Shuffler shuffle;

  const Address(this.shuffle);

  String get fullAddress =>
      "$siAddress $sidoguAddress $roadAddress, $detailAddress";

  String get siAddress => shuffle.element(sidoMap.values.toList());

  String get sidoguAddress => shuffle.element(sidoguMap.values.toList());

  String get roadAddress =>
      "${shuffle.element(roadList)} ${shuffle.integer(1000).toString()}";

  String get detailAddress =>
      "${shuffle.integer(1100)}동 ${shuffle.integer(10000)}호";
}
