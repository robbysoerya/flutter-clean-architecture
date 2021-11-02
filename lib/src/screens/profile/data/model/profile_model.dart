import 'package:json_annotation/json_annotation.dart';

part 'profile_model.g.dart';

@JsonSerializable()
class Projects {
  Projects(this.project);

  List<Project> project;

  factory Projects.fromJson(Map<String, dynamic> json) =>
      _$ProjectsFromJson(json);

  Map<String, dynamic> toJson() => _$ProjectsToJson(this);
}

@JsonSerializable()
class Project {
  Project(this.title, this.description, this.link);

  String title;
  String description;
  String link;

  factory Project.fromJson(Map<String, dynamic> json) =>
      _$ProjectFromJson(json);

  Map<String, dynamic> toJsonn() => _$ProjectToJson(this);
}
