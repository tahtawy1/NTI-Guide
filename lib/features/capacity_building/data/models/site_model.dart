class SiteModel {
  final String title;
  final double latitude;
  final double longitude;
  //addr
  SiteModel({
    required this.title,
    required this.latitude,
    required this.longitude,
  });

  factory SiteModel.fromJson(Map<String, dynamic> json) {
    return SiteModel(
      title: json['governorate'],
      latitude: json['latitude'],
      longitude: json['longitude'],
    );
  }

  Map<String, dynamic> toJson() {
    return {'governorate': title, 'latitude': latitude, 'longitude': longitude};
  }
}
