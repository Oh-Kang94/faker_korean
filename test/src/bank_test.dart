import 'package:faker_korean/faker_korean.dart';
import 'package:faker_korean/src/data/bank_data.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Bank Unit Test', () {
    late FakerK faker;

    setUp(() {
      faker = FakerK();
    });

    test('Bank Name Test', () {
      final String bankName = faker.bank.bankName;
      expect(bankNameMap.containsValue(bankName), isTrue);
    });

    test('Bank Image Test', () async {
      final ImageProvider bankImage = await faker.bank.bankImage();
      expect(bankImage, isNotNull);
      expect(bankImage, isA<ImageProvider>());
    });

    test('Bank Account Test', () {
      const int digits = 11;
      final account = faker.bank.account();
      final accountDigit = faker.bank.account(digits: digits);
      expect(account, isNotEmpty);
      expect(account, isA<String>());
      expect(account.length, greaterThanOrEqualTo(10));
      expect(
        accountDigit.length,
        greaterThanOrEqualTo(digits),
      );
    });

    test('Bank All Test', () async {
      final FakerK fakerWSeed = FakerK(seed: 10);
      final BankModel bankModel = await fakerWSeed.bank.bankAll(size: 24);
      expect(bankModel, isA<BankModel>());
      expect(bankModel.account.length, greaterThanOrEqualTo(10));
      expect(bankModel.bankImage, isA<ImageProvider>());
      expect(bankNameMap.containsValue(bankModel.bankName), isTrue);
    });
  });
}
