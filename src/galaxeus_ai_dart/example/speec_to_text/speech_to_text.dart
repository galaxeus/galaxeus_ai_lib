import 'package:galaxeus_ai_dart/galaxeus_ai_dart.dart';
import 'package:universal_io/io.dart';

void main(List<String> args) {
  GalaxeusAiNative galaxeusAiNative = GalaxeusAiNative(
      galaxeusAiLib:
          "/home/hexaminate/Documents/HEXAMINATE/app/ai/galaxeus_ai/native_lib/galaxeus.so");

  GalaxeusAiNativeResponse res = galaxeusAiNative.request(
    galaxeusAiNativeRequest: GalaxeusAiNativeRequest.speechToTextFromWavFile(
      audio: GalaxeusAiAudioConvert.convertToWav16BitSync(
        audioInput: File("../../native_lib/samples/audio.ogg"),
        audioOutput: File("../../native_lib/samples/output_res.wav"),
      ),
      model: File("../../native_lib/models/ggml-model-whisper-small.bin"),
    ),
  );
  print(res.toString());
}
