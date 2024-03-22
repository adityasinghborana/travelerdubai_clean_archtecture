import 'package:json_annotation/json_annotation.dart';
part 'homepage.g.dart';

@JsonSerializable()
class HomepageData {
  final int id;
  final String detail;
  final String gridSectionHeading;
  final String gridSectionSubheading;
  final String heading1;
  final String heading2;
  final String heading3;
  final String imagePath;
  final String imagePath2;
  final String imagePath3;
  final String subtitle;
  final String title;



  HomepageData ({required this.id, required this.detail,required  this.gridSectionHeading,
    required this.gridSectionSubheading,required  this.heading1, required this.heading2,required  this.heading3,
    required this.imagePath, required this.imagePath2, required this.imagePath3, required this.subtitle,
    required this.title});
  factory HomepageData.fromJson(Map<String, dynamic> json) =>
      _$HomepageDataFromJson(json);

  Map<String, dynamic> toJson() => _$HomepageDataToJson(this);

}

