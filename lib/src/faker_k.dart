import 'package:faker_korean/faker_korean.dart';

class FakerK {
  final Shuffler _shuffler;

  // Names 객체를 담는 변수
  late final Names names;

  late final Address address;

  late final Bank bank;

  late final Phone phone;

  late final Lipsum lipsum;

  late final Internet internet;

  late final Images images;

  // FakerK의 생성자에서 Shuffler를 초기화하고 Names를 초기화함
  FakerK({int? seed}) : _shuffler = Shuffler(seedNumber: seed) {
    names = Names(_shuffler);
    address = Address(_shuffler);
    bank = Bank(_shuffler);
    phone = Phone(_shuffler);
    lipsum = Lipsum(_shuffler);
    internet = Internet(_shuffler);
    images = Images();
  }
}
