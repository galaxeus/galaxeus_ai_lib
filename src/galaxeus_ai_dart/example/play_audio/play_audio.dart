import 'package:galaxeus_ai_dart/galaxeus_ai_dart.dart';
import 'package:universal_io/io.dart';

void main(List<String> args) async {
  GalaxeusAiNative galaxeusAiNative = GalaxeusAiNative(
    galaxeusAiLib: "../../native_lib/galaxeus.so",
    galaxeusAiMemory: GalaxeusAiMemory(
      onData: (data) async {
        print(data);
        GalaxeusAiMemoryData();
        return null;
      },
    ),
  );
  Future(() {
    GalaxeusAiNativeResponse res = galaxeusAiNative.request(
      galaxeusAiNativeRequest: GalaxeusAiNativeRequest.playAudioFromFile(
        audio: File("../../native_lib/samples/output_res.wav"),
      ),
    );
    return res.toJson();
  });

  print("hleo");
}
