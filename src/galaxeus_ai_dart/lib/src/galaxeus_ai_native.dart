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

// /// Don't forget to run malloc.free with result!
// Pointer<Pointer<Utf8>> strListToPointer(List<String> strings) {
//   List<Pointer<Utf8>> utf8PointerList = strings.map((str) => str.toNativeUtf8()).toList();

//   final Pointer<Pointer<Utf8>> pointerPointer = malloc.allocate(utf8PointerList.length);

//   strings.asMap().forEach((index, utf) {
//     pointerPointer[index] = utf8PointerList[index];
//   });

//   return pointerPointer;
// }

// class WhisperArgs {
//   late List<String> args;
//   WhisperArgs(this.args);
//   Pointer<Pointer<Utf8>> toNativeList() {
//     List<Pointer<Utf8>> utf8PointerList = args.map((str) => str.toNativeUtf8()).toList();

//     final Pointer<Pointer<Utf8>> pointerPointer = malloc.allocate(utf8PointerList.length);

//     args.asMap().forEach((index, utf) {
//       pointerPointer[index] = utf8PointerList[index];
//     });
//     return pointerPointer;
//   }
// }
