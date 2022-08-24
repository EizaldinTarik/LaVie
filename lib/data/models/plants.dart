class Plant {
  String? type;
  String? message;
  List? data;
  String? plantId;
  String? name;
  String? description;
  String? imageUrl;
  int? waterCapacity;
  int? sunLight;
  int? temperature;

  Plant.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    name = json['name'];
    message = json['message'];
    imageUrl = json['imageUrl'];
    plantId = json['seedId'];
    description = json['description'];
    data = json['data'];
    waterCapacity = json['waterCapacity'];
    sunLight = json['sunLight'];
    temperature = json['temperature'];
  }
}
