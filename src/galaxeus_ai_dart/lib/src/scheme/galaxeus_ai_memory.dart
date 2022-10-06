part of galaxeus_ai_dart;

class GalaxeusAiMemory {
  late FutureOr<GalaxeusAiMemoryData?> Function(String data) onData;
  GalaxeusAiMemory({
    required this.onData,
  });
}

class GalaxeusAiMemoryData {
  GalaxeusAiMemoryData();
}
