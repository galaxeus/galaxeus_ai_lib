part of galaxeus_ai_dart;

class GalaxeusAiPerson {
  late Map rawData;
  GalaxeusAiPerson(this.rawData);

  Map toMap() {
    return rawData;
  }

  Map toJson() {
    return rawData;
  }

  @override
  String toString() {
    return json.encode(rawData);
  }
}
