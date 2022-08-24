class Tool {
  String? type;
  String? message;
  List? data;
  String? toolId;
  String? name;
  String? description;
  String? imageUrl;

  Tool.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    name = json['name'];
    message = json['message'];
    imageUrl = json['imageUrl'];
    toolId = json['toolId'];
    description = json['description'];
    data = json['data'];
  }
}
