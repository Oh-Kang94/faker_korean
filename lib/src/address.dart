import 'package:faker_korean/src/shuffler.dart';
import 'package:faker_korean/src/combiner.dart';

import 'data/address_data.dart';

class Address {
  final Shuffler shuffle;

  Address(this.shuffle)
      : _siAddress = shuffle.mapElementValue(sidoMap),
        _sidoguAddress = shuffle.mapElementValue(sidoguMap),
        _roadAddress = const Combiner().combineAndInsert(
          [
            shuffle.element(roadList),
            shuffle.integer(1000).toString(),
          ],
        ),
        _detailAddress = "${shuffle.integer(1100)}동 ${shuffle.integer(10000)}호",
        _postalCode = "${shuffle.integerCompareDigits(5, minDigits: 5)}";

  final String _siAddress;
  final String _sidoguAddress;
  final String _roadAddress;
  final String _detailAddress;
  final String _postalCode;

  String get fullAddress =>
      "($postalCode) $siAddress $sidoguAddress $roadAddress, $detailAddress";

  String get siAddress => _siAddress;

  String get sidoguAddress => _sidoguAddress;

  String get roadAddress => _roadAddress;

  String get detailAddress => _detailAddress;

  String get postalCode => _postalCode;
}
