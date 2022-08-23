class Seed {
  String? type;
  String? message;
  List? data;
  String? seedId;
  String? name;
  String? description;
  String? imageUrl;

  Seed.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    name = json['name'];
    message = json['message'];
    imageUrl = json['imageUrl'];
    seedId = json['seedId'];
    description = json['description'];
    data = json['data'];
  }
}
