import 'package:faker_korean/src/splitter.dart';

extension PhoneNumberFormatting on String {

  String formatPhoneNumber({String separator = " "}) {
    String cleaned = replaceAll(RegExp(r'\D'), '');

    switch (cleaned.length) {
      case 8:
        // 8자리 전화번호 포맷팅
        return _formatPhoneNumber(
          cleaned.substring(0, 4),
          cleaned.substring(4, 8),
          '',
          separator,
        );

      case 9:
        if (cleaned.startsWith('02')) {
          // 9자리 전화번호 포맷팅 (예: 021234567 -> 02-123-4567)
          return _formatPhoneNumber(
            cleaned.substring(0, 2),
            cleaned.substring(2, 4),
            cleaned.substring(4, 9),
            separator,
          );
        }
        break;

      case 10:
        if (cleaned.startsWith('02')) {
          // 10자리 전화번호 포맷팅 (예: 0212345678 -> 02-1234-5678)
          return _formatPhoneNumber(
            cleaned.substring(0, 2),
            cleaned.substring(2, 6),
            cleaned.substring(6, 10),
            separator,
          );
        }
        // 10자리 전화번호 포맷팅 (예: 0632345678 -> 063-234-5678)
        if (cleaned.startsWith('0')) {
          return _formatPhoneNumber(
            cleaned.substring(0, 3),
            cleaned.substring(3, 6),
            cleaned.substring(6, 10),
            separator,
          );
        }
        // 10자리 전화번호 포맷팅 (예: 1234567890 -> 1234-5678-90)
        return _formatPhoneNumber(
          cleaned.substring(0, 4),
          cleaned.substring(4, 8),
          cleaned.substring(8, 10),
          separator,
        );

      case 11:
        // 11자리 전화번호 포맷팅 (예: 01012345678 -> 010-1234-5678)
        return _formatPhoneNumber(
          cleaned.substring(0, 3),
          cleaned.substring(3, 7),
          cleaned.substring(7, 11),
          separator,
        );

      case 12:
        // 12자리 전화번호 포맷팅 (예: 123456789012 -> 1234-5678-9012)
        return _formatPhoneNumber(
          cleaned.substring(0, 4),
          cleaned.substring(4, 8),
          cleaned.substring(8, 12),
          separator,
        );

      default:
        // 기본적으로 전화번호 포맷을 처리할 수 없는 경우
        return cleaned;
    }

    return cleaned; // default case 처리
  }
}

/// Split 방법에 따른 대응
String _formatPhoneNumber(
  String part1,
  String part2,
  String part3,
  String separator,
) {
  return Splitter(insertString: separator)
      .splitAndInsert([part1, part2, part3]);
}
