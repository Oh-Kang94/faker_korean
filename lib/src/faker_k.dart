import 'package:faker_korean/src/address.dart';
import 'package:faker_korean/src/names.dart';
import 'package:faker_korean/src/shuffler.dart';

class FakerK {
  final Shuffler _shuffler;

  // Names 객체를 담는 변수
  late final Names names;

  late final Address address;

  // FakerK의 생성자에서 Shuffler를 초기화하고 Names를 초기화함
  FakerK({int? seed}) : _shuffler = Shuffler(seedNumber: seed) {
    names = Names(_shuffler); // FakerK.names에 접근할 수 있도록 Names를 초기화
    address = Address(_shuffler);
  }
}
