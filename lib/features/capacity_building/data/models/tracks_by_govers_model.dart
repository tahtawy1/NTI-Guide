class TracksGroupModel {
  final String tracksGroupLink;

  TracksGroupModel({required this.tracksGroupLink});

  factory TracksGroupModel.fromJson(Map<String, dynamic> json) {
    return TracksGroupModel(tracksGroupLink: json['tracksGroupLink'] ?? '');
  }

  Map<String, dynamic> toJson() {
    return {'tracksGroupLink': tracksGroupLink};
  }
}
