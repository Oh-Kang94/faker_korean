import 'dart:typed_data';

import 'package:faker_korean/faker_korean.dart';
import 'package:faker_korean/src/data/bank_data.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'dart:ui' as ui;

class Bank {
  final Shuffler shuffle;

  const Bank(this.shuffle);

  String account({int? digits}) {
    return shuffle
        .integerCompareDigits(digits ?? 14, minDigits: digits ?? 10)
        .toString();
  }

  String get bankName => shuffle.element(bankNameMap.values.toList());

  Future<ImageProvider> bankImage({double size = 24}) async {
    String svgString = shuffle.mapElementValue(bankImageMap);
    Uint8List svg = await _svgStringToPngBytes(svgString, size, size);
    return MemoryImage(svg);
  }

  Future<BankModel> bankAll({double size = 24}) async {
    String randomBankCode = shuffle.mapElementKey(bankNameMap);

    // 선택한 은행 코드에 맞는 이름과 이미지 가져오기
    String bankName = bankNameMap[randomBankCode]!;
    ImageProvider bankImage = MemoryImage(
      await _svgStringToPngBytes(bankImageMap[randomBankCode]!, size, size),
    );

    // BankModel 반환
    return BankModel(
      bankCode: randomBankCode,
      bankName: bankName,
      bankImage: bankImage,
      account: account(),
    );
  }

  @protected
  Future<Uint8List> _svgStringToPngBytes(
    // The SVG string
    String svgStringContent,
    // The target width of the output image
    double targetWidth,
    // The target height of the output image
    double targetHeight,
  ) async {
    final SvgStringLoader svgStringLoader = SvgStringLoader(svgStringContent);

    final PictureInfo pictureInfo = await vg.loadPicture(svgStringLoader, null);

    final ui.Picture picture = pictureInfo.picture;

    final ui.PictureRecorder recorder = ui.PictureRecorder();

    final ui.Canvas canvas = Canvas(
      recorder,
      Rect.fromPoints(Offset.zero, Offset(targetWidth, targetHeight)),
    );

    canvas.scale(
      targetWidth / pictureInfo.size.width,
      targetHeight / pictureInfo.size.height,
    );

    canvas.drawPicture(picture);

    final ui.Image imgByteData = await recorder
        .endRecording()
        .toImage(targetWidth.ceil(), targetHeight.ceil());

    final ByteData? bytesData =
        await imgByteData.toByteData(format: ui.ImageByteFormat.png);

    final Uint8List imageData = bytesData?.buffer.asUint8List() ?? Uint8List(0);

    pictureInfo.picture.dispose();

    return imageData;
  }
}
