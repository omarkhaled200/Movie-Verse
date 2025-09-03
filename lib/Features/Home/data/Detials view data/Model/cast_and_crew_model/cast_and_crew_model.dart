import 'package:equatable/equatable.dart';

import 'cast.dart';
import 'crew.dart';

class CastAndCrewModel extends Equatable {
  final List<Cast>? cast;
  final List<Crew>? crew;

  const CastAndCrewModel({this.cast, this.crew});

  factory CastAndCrewModel.fromJson(Map<String, dynamic> json) {
    return CastAndCrewModel(
      cast: (json['cast'] as List<dynamic>?)
          ?.map((e) => Cast.fromJson(e as Map<String, dynamic>))
          .toList(),
      crew: (json['crew'] as List<dynamic>?)
          ?.map((e) => Crew.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
    'cast': cast?.map((e) => e.toJson()).toList(),
    'crew': crew?.map((e) => e.toJson()).toList(),
  };

  @override
  List<Object?> get props => [cast, crew];
}
