// ignore_for_file: non_constant_identifier_names

part of galaxeus_ai_dart;

class GalaxeusAiAudioConvert {
  GalaxeusAiAudioConvert();

  static File convertToWav16Bit({
    required File audioInput,
    required File audioOutput,
    String? pathFFmpeg,
    FFmpegArgs? fFmpegArgs,
    String? workingDirectory,
    Map<String, String>? environment,
    bool includeParentEnvironment = true,
    bool runInShell = false,
    Duration? timeout,
  }) {
    timeout ??= Duration(seconds: 10);
    DateTime time_expire = DateTime.now().add(timeout);
    var res = FFmpeg(pathFFmpeg: pathFFmpeg).convertAudioToWavWhisper(pathAudioInput: audioInput.path, pathAudioOutput: audioOutput.path, pathFFmpeg: pathFFmpeg, fFmpegArgs: fFmpegArgs, workingDirectory: workingDirectory, environment: environment, runInShell: runInShell);
    while (true) {
      if (DateTime.now().isAfter(time_expire)) {
        throw "time out";
      }
      if (res) {
        if (audioOutput.existsSync()) {
          return audioOutput;
        }
      } else {
        if (!audioInput.existsSync()) {
          throw "audio input not found";
        }
      }
    }
  }

  static File convertToWav16BitSync({
    required File audioInput,
    required File audioOutput,
    String? pathFFmpeg,
    FFmpegArgs? fFmpegArgs,
    String? workingDirectory,
    Map<String, String>? environment,
    bool includeParentEnvironment = true,
    bool runInShell = false,
    Duration? timeout,
  }) {
    timeout ??= Duration(seconds: 10);
    DateTime time_expire = DateTime.now().add(timeout);
    var res = FFmpeg(pathFFmpeg: pathFFmpeg).convertAudioToWavWhisper(pathAudioInput: audioInput.path, pathAudioOutput: audioOutput.path, pathFFmpeg: pathFFmpeg, fFmpegArgs: fFmpegArgs, workingDirectory: workingDirectory, environment: environment, runInShell: runInShell);
    while (true) {
      if (DateTime.now().isAfter(time_expire)) {
        throw "time out";
      }
      if (res) {
        if (audioOutput.existsSync()) {
          return audioOutput;
        }
      } else {
        if (!audioInput.existsSync()) {
          throw "audio input not found";
        }
      }
    }
  }
}
