import 'package:flutter/widgets.dart';

enum ImageFormat { jpg, webp }

class Images {
  String imageUrl({
    int width = 200,
    int height = 200,
    int? random,
    String? seed,
    ImageFormat? imageFormat,
  }) =>
      _imageUri(
        width,
        height,
        random: random,
        seed: seed,
        imageFormat: imageFormat,
      ).toString();

  List<String> imagesUrl(
    int? length, {
    int width = 200,
    int height = 200,
    String? seed,
    ImageFormat? imageFormat,
  }) =>
      List.generate(
        length ?? 1,
        (index) => imageUrl(
          height: height,
          width: width,
          random: index,
          seed: seed,
          imageFormat: imageFormat,
        ),
      );

  ImageProvider image({
    int width = 200,
    int height = 200,
    int? random,
    String? seed,
    ImageFormat? imageFormat,
  }) =>
      NetworkImage(
        imageUrl(
          width: width,
          height: height,
          random: random,
          imageFormat: imageFormat,
          seed: seed,
        ),
      );

  List<ImageProvider> images(
    int? length, {
    int width = 200,
    int height = 200,
    String? seed,
    ImageFormat? imageFormat,
  }) =>
      List.generate(
        length ?? 1,
        (index) => NetworkImage(
          imageUrl(
            width: width,
            height: height,
            random: index,
            imageFormat: imageFormat,
            seed: seed,
          ),
        ),
      );

  Uri _imageUri(
    int width,
    int height, {
    int? random,
    String? seed,
    ImageFormat? imageFormat,
  }) {
    final formatExt = imageFormat != null ? '.${imageFormat.name}' : '';
    return Uri(
      scheme: 'https',
      host: 'picsum.photos',
      pathSegments: [
        if (seed != null) ...['seed', seed],
        '$width',
        '$height$formatExt',
      ],
      queryParameters: random != null ? {'random': '$random'} : null,
    );
  }
}
