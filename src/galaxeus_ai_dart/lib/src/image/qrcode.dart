part of galaxeus_ai_dart;

class GalaxeusQrCode {
  String decode({required img.Image image}) {
    LuminanceSource source = RGBLuminanceSource(image.width, image.height,
        image.getBytes(format: img.Format.abgr).buffer.asInt32List());
    var bitmap = BinaryBitmap(HybridBinarizer(source));
    var reader = QRCodeReader();
    var result = reader.decode(bitmap);
    return result.text;
  }

  Future<File> encode({
    required String text,
    required File fileOutPut,
    int padding = 10,
    int backgroundColor = 0xFFFFFFFF,
  }) async {
    var qrcode = Encoder.encode(text, ErrorCorrectionLevel.h);
    var matrix = qrcode.matrix!;
    var scale = 10;
    var width = matrix.width * scale;
    var height = matrix.height * scale;
    var image = img.Image(width + 200, height + 200);
    var xs = [];
    img.fill(image, backgroundColor);
    for (var x = 0; x < matrix.width; x++) {
      for (var y = 0; y < matrix.height; y++) {
        if (matrix.get(x, y) == 1) {
          xs.add([x + padding, y + padding]);
        }
      }
    }
    for (var i = 0; i < xs.length; i++) {
      var x = xs[i][0];
      var y = xs[i][1];
      img.fillRect(image, x * scale, y * scale, x * scale + scale,
          y * scale + scale, 0xFF000000);
    }
    var pngBytes = img.encodePng(image);
    return await File(fileOutPut.path).writeAsBytes(pngBytes);
  }

  File encodeSync({
    required String text,
    required File fileOutPut,
  }) {
    var qrcode = Encoder.encode(text, ErrorCorrectionLevel.h);
    var matrix = qrcode.matrix!;
    var scale = 10;
    var width = matrix.width * scale;
    var height = matrix.height * scale;
    var image = img.Image(width + 200, height + 200);
    var xs = [];
    for (var x = 0; x < matrix.width; x++) {
      for (var y = 0; y < matrix.height; y++) {
        if (matrix.get(x, y) == 1) {
          xs.add([x + 10, y + 10]);
        }
      }
    }
    for (var i = 0; i < xs.length; i++) {
      var x = xs[i][0];
      var y = xs[i][1];
      img.fillRect(image, x * scale, y * scale, x * scale + scale,
          y * scale + scale, 0xFF000000);
    }
    var pngBytes = img.encodePng(image);

    File file = File(fileOutPut.path);
    file.writeAsBytesSync(pngBytes);
    return file;
  }
}
