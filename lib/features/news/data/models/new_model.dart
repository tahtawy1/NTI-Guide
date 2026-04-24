import 'package:cloud_firestore/cloud_firestore.dart';

class NewModel {
  final String brief;
  final String thumbnail;
  final List<String> imagesUrl;
  final Timestamp date;
  final String description;

  const NewModel({
    required this.brief,
    required this.thumbnail,
    required this.imagesUrl,
    required this.date,
    required this.description,
  });

  /// Returns date formatted as "Jan 5, 2025"
  String get formattedDate {
    final dt = date.toDate();
    const months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec',
    ];
    return '${months[dt.month - 1]} ${dt.day}, ${dt.year}';
  }

  NewModel copyWith({
    String? brief,
    String? thumbnail,
    List<String>? imagesUrl,
    Timestamp? date,
    String? description,
  }) {
    return NewModel(
      brief: brief ?? this.brief,
      thumbnail: thumbnail ?? this.thumbnail,
      imagesUrl: imagesUrl ?? this.imagesUrl,
      date: date ?? this.date,
      description: description ?? this.description,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'breif': brief,
      'thumbnail': thumbnail,
      'imagesUrl': imagesUrl,
      'date': date,
      'description': description,
    };
  }

  factory NewModel.fromMap(Map<String, dynamic> map) {
    try {
      return NewModel(
        brief: map['breif'] as String? ?? '',
        thumbnail: map['thumbnail'] as String? ?? '',
        imagesUrl: List<String>.from(
          (map['imagesUrl'] as List<dynamic>? ?? []).map((e) => e.toString()),
        ),
        date: map['date'] is Timestamp
            ? map['date'] as Timestamp
            : Timestamp.now(),
        description: map['description'] as String? ?? '',
      );
    } catch (_) {
      return NewModel(
        brief: '',
        thumbnail: '',
        imagesUrl: const [],
        date: Timestamp.now(),
        description: '',
      );
    }
  }
}
