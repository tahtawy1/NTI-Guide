class TrackModel {
  final String title;
  final String? trackLink;

  TrackModel({required this.title, this.trackLink});

  factory TrackModel.fromJson(Map<String, dynamic> json) {
    return TrackModel(
      title: json['title'] ?? '',
      trackLink: json['trackLink'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {'title': title, 'trackLink': trackLink};
  }
}
