class DepartmentModel {
  final String title;
  final String description;
  final String contactLink;

  DepartmentModel({
    required this.title,
    required this.description,
    required this.contactLink,
  });

  factory DepartmentModel.fromJson(Map<String, dynamic> json) {
    return DepartmentModel(
      title: json['title'],
      description: json['description'],
      contactLink: json['contactLink'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'contactLink': contactLink,
    };
  }
}
