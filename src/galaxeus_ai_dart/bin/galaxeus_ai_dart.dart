import 'package:galaxeus_ai_dart/galaxeus_ai_dart.dart';

void main(List<String> args) {
  GalaxeusAiNative galaxeusAiNative = GalaxeusAiNative(
      galaxeusAiLib:
          "/home/hexaminate/Documents/HEXAMINATE/app/ai/galaxeus_ai/native_lib/galaxeus.so");
  print(galaxeusAiNative.request(
    galaxeusAiNativeRequest: GalaxeusAiNativeRequest(
      {"@type": "aloe"},
    ),
  ));
}
