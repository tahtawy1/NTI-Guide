class HeroSectionModel {
  final List<String> programIds;

  HeroSectionModel({required this.programIds});

  factory HeroSectionModel.fromJson(Map<String, dynamic> json) {
    return HeroSectionModel(
      programIds:
          (json['programIds'] as List<dynamic>?)
              ?.map((e) => e.toString())
              .toList() ??
          [],
    );
  }

  Map<String, dynamic> toJson() {
    return {'programIds': programIds};
  }
}
