import 'dart:io';

import 'package:faker_korean/faker_korean.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  group('Image Unit Test', () {
    late final FakerK faker;

    setUpAll(() {
      faker = FakerK();
      // Neglect Test Image Issue
      HttpOverrides.global = null;
    });

    test('Single Image String Test', () {
      final String imageUrl = faker.images.imageUrl(
        height: 100,
        width: 100,
        imageFormat: ImageFormat.jpg,
        random: 10,
        seed: 'faker',
      );
      expect(
        imageUrl,
        equals('https://picsum.photos/seed/faker/100/100.jpg?random=10'),
      );
    });

    test('Multiple Image String Test', () {
      final List<String> imagesUrl = faker.images.imagesUrl(5);
      expect(imagesUrl.length, equals(5));
    });

    testWidgets('Single Image Widget Test', (WidgetTester tester) async {
      final ImageProvider image = faker.images.image();

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Image(image: image),
          ),
        ),
      );

      await tester.pumpAndSettle();

      expect(find.byType(Image), findsOneWidget);
    });

    testWidgets('Multiple Image Widget Test', (WidgetTester tester) async {
      const int length = 3;
      final List<ImageProvider> images = faker.images.images(length);

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Column(
              children: [
                Image(image: images[0]),
                Image(image: images[1]),
                Image(image: images[2]),
              ],
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();

      expect(images, isA<List<ImageProvider>>());
      expect(images.length, equals(length));
      expect(find.byType(Image), findsNWidgets(length));
    });
  });
}
