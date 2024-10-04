import 'package:faker_korean/faker_korean.dart';
import 'package:faker_korean/src/data/email_data.dart';
import 'package:faker_korean/src/combiner.dart';

class Internet {
  final Shuffler _shuffler;

  const Internet(this._shuffler);

  String get id => _shuffler.generateWithRegex(
        pattern: RegExp(r'^[a-zA-Z0-9._%+-]{4,12}$'),
      );

  String get email => const Combiner(insertString: '@')
      .combineAndInsert([id, _shuffler.element(domainNames)]);

  /// 메일 수신용 Test
  String get disposableEmail => '$id@mailinator.com';

  String get pw => _shuffler.generateWithRegex(
        min: 8,
        max: 16,
        pattern: RegExp(
          r'^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,16}$',
        ),
      );

  String get url {
    final domain = _shuffler.generateWithRegex(
      pattern: RegExp(r'^[a-z0-9_-]$'),
    );
    final domainSuffix = _shuffler.element(domainSuffixes);
    final url = const Combiner(insertString: '.')
        .combineAndInsert(['https://www', domain, domainSuffix]);
    return url;
  }

  Uri get uri {
    final domain = _shuffler.generateWithRegex(
      pattern: RegExp(r'^[a-z0-9_-]$'),
    );
    final domainSuffix = _shuffler.element(domainSuffixes);
    return Uri(
      scheme: 'https',
      host: '$domain.$domainSuffix',
      path: 'find',
      fragment: _shuffler.integer(15).toString(),
      queryParameters: {'id': _shuffler.integer(15).toString()},
    );
  }

  String get macAddress => _shuffler
      .numbers(0xff, 6)
      .map((number) => number.toRadixString(16).padLeft(2, '0'))
      .join(':');
}
