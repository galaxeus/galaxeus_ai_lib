import 'package:galaxeus_ai_dart/galaxeus_ai_dart.dart';
import 'package:universal_io/io.dart';
import 'package:image/image.dart' as img;

void main(List<String> args) async {
  GalaxeusQrCode galaxeusQrCode = GalaxeusQrCode();
  File fileOutPut = File("./data.png");
  File encode = await galaxeusQrCode.encode(text: "Hai ini text qr", fileOutPut: fileOutPut, padding: 10);
  var image = img.decodePng(fileOutPut.readAsBytesSync())!;

  var result = galaxeusQrCode.decode(image: image);
  print(result);
}
