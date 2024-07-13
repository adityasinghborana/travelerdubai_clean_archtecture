
import 'package:json_annotation/json_annotation.dart';
part 'Aboutus.g.dart';
@JsonSerializable()
class Aboutpagedata {
  final int id;
  final String title;
  final String subtitle;

  final String imagepath;
  final String imagepath2;
  final String imagepath3;
  final String heading1;
  final String text;
  final String detail1;
  final String heading2;
  final String subheading2;
  final String detail2;

  Aboutpagedata(
      {required this.id,
        required this.title,
        required this.subtitle,
        required this.imagepath,
        required this.imagepath2,
        required this.imagepath3,
        required this.heading1,
        required this.text,
        required this.detail1,
        required this.heading2,
        required this.subheading2,
        required this.detail2});

  factory Aboutpagedata.fromJson(Map<String, dynamic> json) =>
      _$AboutpagedataFromJson(json);

  Map<String, dynamic> toJson() => _$AboutpagedataToJson(this);

}
