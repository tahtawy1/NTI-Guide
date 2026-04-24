class PartnersModel {
  final String partnersImageUrl;
  PartnersModel({required this.partnersImageUrl});

  factory PartnersModel.fromJson(Map<String, dynamic> json) {
    return PartnersModel(partnersImageUrl: json['partnersImageUrl'] ?? '');
  }

  Map<String, dynamic> toJson() {
    return {'partnersImageUrl': partnersImageUrl};
  }
}
