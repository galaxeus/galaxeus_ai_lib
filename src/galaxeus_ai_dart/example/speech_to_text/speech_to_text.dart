import 'package:galaxeus_ai_dart/galaxeus_ai_dart.dart';
import 'package:galaxeus_lib/galaxeus_lib.dart';
import 'package:universal_io/io.dart';

void main(List<String> args) async {
  DateTime time = DateTime.now();
  GalaxeusAiNative galaxeusAiNative = GalaxeusAiNative(
    galaxeusAiLib: "../../native_lib/galaxeus_ai.so",
    galaxeusAiMemory: GalaxeusAiMemory(
      onData: (data) async {
        print(data);
        GalaxeusAiMemoryData();
        return null;
      },
    ),
  );

  Future.microtask(() {
    GalaxeusAiNativeResponse res = galaxeusAiNative.request(
      galaxeusAiNativeRequest: GalaxeusAiNativeRequest.speechToTextFromWavFile(
        // audio: GalaxeusAiAudioConvert.convertToWav16BitSync(
        //   audioInput: File("../../native_lib/samples/audio.wav"),
        //   audioOutput: File("../../native_lib/samples/output_res.wav"),
        // ),
        audio: File("../../native_lib/samples/output_id.wav"),
        model: File("../../native_lib/models/ggml-model-whisper-small.bin"),
      ),
    );
    print(res.toString());
    print(convertToAgoFromDateTime(time));
    return;
  });
  print(convertToAgoFromDateTime(time));
}
