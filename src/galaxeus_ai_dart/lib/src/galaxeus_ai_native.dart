// ignore_for_file: non_constant_identifier_names

part of galaxeus_ai_dart;

// ignore: camel_case_types
typedef whisper_request_native = Pointer<Utf8> Function(Pointer<Utf8> body);

class GalaxeusAiNative {
  late String galaxeus_ai_lib = "galaxeus_ai.so";
  GalaxeusAiNative({String? galaxeusAiLib}) {
    if (galaxeusAiLib != null) {
      galaxeus_ai_lib = galaxeusAiLib;
    }
  }
  DynamicLibrary get openLib {
    if (Platform.isIOS || Platform.isMacOS) {
      return DynamicLibrary.process();
    } else {
      return DynamicLibrary.open(galaxeus_ai_lib);
    }
  }

  GalaxeusAiNativeResponse request({
    required GalaxeusAiNativeRequest galaxeusAiNativeRequest,
  }) {
    try {
      var res = openLib.lookupFunction<whisper_request_native, whisper_request_native>("request").call(galaxeusAiNativeRequest.toString().toNativeUtf8());
      Map result = json.decode(res.toDartString());
      return GalaxeusAiNativeResponse(result);
    } catch (e) {
      return GalaxeusAiNativeResponse({"@type": "error"});
    }
  }
}

/// Don't forget to run malloc.free with result!
Pointer<Pointer<Utf8>> strListToPointer(List<String> strings) {
  List<Pointer<Utf8>> utf8PointerList = strings.map((str) => str.toNativeUtf8()).toList();

  final Pointer<Pointer<Utf8>> pointerPointer = malloc.allocate(utf8PointerList.length);

  strings.asMap().forEach((index, utf) {
    pointerPointer[index] = utf8PointerList[index];
  });

  return pointerPointer;
}

class WhisperArgs {
  late List<String> args;
  WhisperArgs(this.args);
  Pointer<Pointer<Utf8>> toNativeList() {
    List<Pointer<Utf8>> utf8PointerList = args.map((str) => str.toNativeUtf8()).toList();

    final Pointer<Pointer<Utf8>> pointerPointer = malloc.allocate(utf8PointerList.length);

    args.asMap().forEach((index, utf) {
      pointerPointer[index] = utf8PointerList[index];
    });
    return pointerPointer;
  }
}

class GalaxeusAiNativeRequest {
  late Map rawData;
  GalaxeusAiNativeRequest(this.rawData);

  factory GalaxeusAiNativeRequest.fromWavFile({
    required File audio,
    required File model,
    bool is_translate = false,
    int threads = 4,
    bool is_verbose = false,
    String language = "id",
    bool is_special_tokens = false,
    bool is_no_timestamps = false,
  }) {
    return GalaxeusAiNativeRequest({
      "@type": "getTextFromWavFile",
      "is_translate": is_translate,
      "threads": threads,
      "is_verbose": is_verbose,
      "language": language,
      "is_special_tokens": is_special_tokens,
      "is_no_timestamps": is_no_timestamps,
      "audio": audio.path,
      "model": model.path,
    });
  }

  Map toMap() {
    return (rawData);
  }

  Map toJson() {
    return (rawData);
  }

  @override
  String toString() {
    return json.encode(rawData);
  }
}

class GalaxeusAiNativeResponse {
  late Map rawData;
  GalaxeusAiNativeResponse(this.rawData);

  String? get special_type {
    try {
      if (rawData["@type"] is String == false) {
        return null;
      }
      return rawData["@type"] as String;
    } catch (e) {
      return null;
    }
  }

  String? get text {
    try {
      if (rawData["text"] is String == false) {
        return null;
      }
      return rawData["text"] as String;
    } catch (e) {
      return null;
    }
  }

  Map toMap() {
    return (rawData);
  }

  Map toJson() {
    return (rawData);
  }

  @override
  String toString() {
    return json.encode(rawData);
  }
}
