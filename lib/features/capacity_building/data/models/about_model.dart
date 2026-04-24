class AboutModel {
  final String description;
  String? imageUrl; // not required

  AboutModel({required this.description, this.imageUrl});

  factory AboutModel.fromJson(Map<String, dynamic> json) {
    return AboutModel(
      description: json['description'],
      imageUrl: json['imageUrl'],
    );
  }

  Map<String, dynamic> toJson() {
    return {'description': description, 'imageUrl': imageUrl};
  }
}
