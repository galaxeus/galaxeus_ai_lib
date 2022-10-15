import 'package:galaxeus_ai_dart/galaxeus_ai_dart.dart';
import 'package:universal_io/io.dart';

void main(List<String> args) {
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

  GalaxeusAiNativeResponse res = galaxeusAiNative.request(
    galaxeusAiNativeRequest: GalaxeusAiNativeRequest.speechToTextFromWavFile(
      threads: 2,
      // auto convert to wav
      // audio: GalaxeusAiAudioConvert.convertToWav16BitSync(
      //   audioInput: File("./audio.mp3"),
      //   audioOutput: File("../../native_lib/samples/output_res.wav"),
      // ),
      audio: File("../../native_lib/samples/output_res.wav"),
      model: File("../../native_lib/models/ggml-model-whisper-small.bin"),
    ),
  );
  print(res.toString());
}
