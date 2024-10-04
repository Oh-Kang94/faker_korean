import 'package:flutter/widgets.dart';

class BankModel {
  final String bankCode;
  final String bankName;
  final ImageProvider bankImage;
  final String account;

  BankModel({
    required this.account,
    required this.bankCode,
    required this.bankName,
    required this.bankImage,
  });
}
