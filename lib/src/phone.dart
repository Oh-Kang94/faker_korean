import 'package:faker_korean/faker_korean.dart';
import 'package:faker_korean/src/data/phone_data.dart';
import 'package:faker_korean/src/util/extension.dart';

class Phone {
  final Shuffler shuffle;

  const Phone(this.shuffle);

  String telNumber({String separator = '-'}) =>
      "${shuffle.element(areaCode)}${shuffle.makeDouble(4, minDigits: 3)}${shuffle.makeDouble(4, minDigits: 4)}"
          .formatPhoneNumber(separator: separator);

  String phoneNumber({String separator = '-'}) =>
      "010${shuffle.makeDouble(4, minDigits: 4)}${shuffle.makeDouble(4, minDigits: 4)}"
          .formatPhoneNumber(separator: separator);
}
