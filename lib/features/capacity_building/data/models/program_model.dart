import 'package:nti_hub_app/features/capacity_building/data/models/about_model.dart';
import 'package:nti_hub_app/features/capacity_building/data/models/academy_model.dart';
import 'package:nti_hub_app/features/capacity_building/data/models/department_model.dart';
import 'package:nti_hub_app/features/capacity_building/data/models/faq_model.dart';
import 'package:nti_hub_app/features/capacity_building/data/models/partners_model.dart';
import 'package:nti_hub_app/features/capacity_building/data/models/site_model.dart';
import 'package:nti_hub_app/features/capacity_building/data/models/terms_model.dart';
import 'package:nti_hub_app/features/capacity_building/data/models/track_model.dart';
import 'package:nti_hub_app/features/capacity_building/data/models/tracks_by_govers_model.dart';

class ProgramModel {
  final String title;
  final String? id;
  final String? brief;
  final String thumbnail;
  final String description;
  final AboutModel? about;
  final List<TrackModel>? tracks;
  final List<FAQModel>? faqs;
  final List<AcademyModel>? academies;
  final List<TermsModel>? terms;
  final List<DepartmentModel>? departments;
  final PartnersModel? partners;
  final List<SiteModel>? sites;
  final TracksGroupModel? tracksGroup;
  ProgramModel({
    required this.title,
    this.brief,
    required this.thumbnail,
    required this.description,
    this.id,
    this.about,
    this.tracks,
    this.faqs,
    this.academies,
    this.terms,
    this.departments,
    this.partners,
    this.sites,
    this.tracksGroup,
  });

  factory ProgramModel.fromJson(Map<String, dynamic> json) {
    return ProgramModel(
      title: json['title'] ?? '',
      brief: json['brief'] ?? '',
      thumbnail: json['thumbnail'] ?? '',
      description: json['description'] ?? '',
      id: json['id'],
      about: json['about'] != null ? AboutModel.fromJson(json['about']) : null,
      tracks: json['tracks'] != null
          ? (json['tracks'] as List).map((e) => TrackModel.fromJson(e)).toList()
          : null,
      faqs: json['faqs'] != null
          ? (json['faqs'] as List).map((e) => FAQModel.fromJson(e)).toList()
          : null,
      academies: json['academies'] != null
          ? (json['academies'] as List)
                .map((e) => AcademyModel.fromJson(e))
                .toList()
          : null,
      terms: json['terms'] != null
          ? (json['terms'] as List).map((e) => TermsModel.fromJson(e)).toList()
          : null,
      departments: json['departments'] != null
          ? (json['departments'] as List)
                .map((e) => DepartmentModel.fromJson(e))
                .toList()
          : null,
      partners: json['partners'] != null
          ? PartnersModel.fromJson(json['partners'])
          : null,
      sites: json['sites'] != null
          ? (json['sites'] as List).map((e) => SiteModel.fromJson(e)).toList()
          : null,
      tracksGroup: json['tracksGroup'] != null
          ? TracksGroupModel.fromJson(json['tracksGroup'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'brief': brief,
      'thumbnail': thumbnail,
      'description': description,
      'id': id,
      'about': about?.toJson(),
      'tracks': tracks?.map((e) => e.toJson()).toList(),
      'faqs': faqs?.map((e) => e.toJson()).toList(),
      'academies': academies?.map((e) => e.toJson()).toList(),
      'terms': terms?.map((e) => e.toJson()).toList(),
      'departments': departments?.map((e) => e.toJson()).toList(),
      'partners': partners?.toJson(),
      'sites': sites?.map((e) => e.toJson()).toList(),
      'tracksGroup': tracksGroup?.toJson(),
    };
  }

  ProgramModel copyWith({
    String? title,
    String? id,
    String? brief,
    String? thumbnail,
    String? description,
    final AboutModel? about,
    final List<TrackModel>? tracks,
    final List<FAQModel>? faqs,
    final List<AcademyModel>? academies,
    final List<TermsModel>? terms,
    final List<DepartmentModel>? departments,
    final PartnersModel? partners,
    final List<SiteModel>? sites,
    final TracksGroupModel? tracksGroup,
  }) {
    return ProgramModel(
      title: title ?? this.title,
      id: id ?? this.id,
      brief: brief ?? this.brief,
      thumbnail: thumbnail ?? this.thumbnail,
      description: description ?? this.description,
      about: about ?? this.about,
      tracks: tracks ?? this.tracks,
      faqs: faqs ?? this.faqs,
      academies: academies ?? this.academies,
      terms: terms ?? this.terms,
      departments: departments ?? this.departments,
      partners: partners ?? this.partners,
      sites: sites ?? this.sites,
      tracksGroup: tracksGroup ?? this.tracksGroup,
    );
  }

  bool get hasAbout => about?.description.isNotEmpty ?? false;
  bool get hasTracks => tracks?.isNotEmpty == true;
  bool get hasAcademies => academies?.isNotEmpty == true;
  bool get hasTerms => terms?.isNotEmpty == true;
  bool get hasFaqs => faqs?.isNotEmpty == true;
  bool get hasDepartments => departments?.isNotEmpty == true;
  bool get hasPartners =>
      partners != null && partners!.partnersImageUrl.isNotEmpty;
  bool get hasSites => sites?.isNotEmpty == true;
  bool get hasTracksByGovernorate => tracksGroup != null;
}
