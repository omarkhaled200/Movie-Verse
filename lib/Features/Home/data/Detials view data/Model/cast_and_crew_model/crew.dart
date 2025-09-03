import 'package:equatable/equatable.dart';

class Crew extends Equatable {
  final bool? adult;
  final int? gender;
  final int? id;
  final String? knownForDepartment;
  final String? name;
  final String? originalName;
  final double? popularity;
  final dynamic profilePath;
  final String? creditId;
  final String? department;
  final String? job;

  const Crew({
    this.adult,
    this.gender,
    this.id,
    this.knownForDepartment,
    this.name,
    this.originalName,
    this.popularity,
    this.profilePath,
    this.creditId,
    this.department,
    this.job,
  });

  factory Crew.fromJson(Map<String, dynamic> json) => Crew(
    adult: json['adult'] as bool?,
    gender: json['gender'] as int?,
    id: json['id'] as int?,
    knownForDepartment: json['known_for_department'] as String?,
    name: json['name'] as String?,
    originalName: json['original_name'] as String?,
    popularity: (json['popularity'] as num?)?.toDouble(),
    profilePath: json['profile_path'] as dynamic,
    creditId: json['credit_id'] as String?,
    department: json['department'] as String?,
    job: json['job'] as String?,
  );

  Map<String, dynamic> toJson() => {
    'adult': adult,
    'gender': gender,
    'id': id,
    'known_for_department': knownForDepartment,
    'name': name,
    'original_name': originalName,
    'popularity': popularity,
    'profile_path': profilePath,
    'credit_id': creditId,
    'department': department,
    'job': job,
  };

  @override
  List<Object?> get props {
    return [
      adult,
      gender,
      id,
      knownForDepartment,
      name,
      originalName,
      popularity,
      profilePath,
      creditId,
      department,
      job,
    ];
  }
}
