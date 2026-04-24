class TermsModel {
  final String term;
  final List<String> subTerms; // not required

  TermsModel({required this.term, this.subTerms = const []});

  factory TermsModel.fromJson(Map<String, dynamic> json) {
    return TermsModel(
      term: json['term'] as String,
      subTerms: (json['subTerms'] as List? ?? []).whereType<String>().toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {'term': term, 'subTerms': subTerms};
  }
}
