part of galaxeus_ai_dart;

class GalaxeusAiRequest {
  late Map rawData;
  GalaxeusAiRequest(this.rawData);

  factory GalaxeusAiRequest.translate(
      {required GalaxeusAiPerson fromPerson,
      required GalaxeusAiPerson toPerson}) {
    return GalaxeusAiRequest({
      "@type": GalaxeusAiChatbotType.group.name,
    });
  }

  factory GalaxeusAiRequest.chatbot(
      {required GalaxeusAiPerson fromPerson,
      required GalaxeusAiPerson toPerson}) {
    return GalaxeusAiRequest({
      "@type": GalaxeusAiChatbotType.group.name,
    });
  }

  factory GalaxeusAiRequest.chatbotGroup(
      {required GalaxeusAiPerson fromPerson,
      required GalaxeusAiPerson toPerson}) {
    return GalaxeusAiRequest({});
  }

  String? get special_type {}

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
