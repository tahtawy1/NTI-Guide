class AcademyModel {
  final String logoUrl;
  String? description;

  AcademyModel({required this.logoUrl, this.description});

  factory AcademyModel.fromJson(Map<String, dynamic> json) {
    return AcademyModel(
      logoUrl: json['logoUrl'],
      description: json['description'],
    );
  }

  Map<String, dynamic> toJson() {
    return {'logoUrl': logoUrl, 'description': description};
  }
}
