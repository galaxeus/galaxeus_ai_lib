part of galaxeus_ai_dart;

class GalaxeusAiRequest {
  late Map rawData;
  GalaxeusAiRequest(this.rawData);
 
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
