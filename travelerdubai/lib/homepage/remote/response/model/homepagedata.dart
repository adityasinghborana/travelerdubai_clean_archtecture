import 'package:json_annotation/json_annotation.dart';

part 'homepagedata.g.dart';

@JsonSerializable()
class HomepageData {
  final int id;
  final int counter1;
  final int counter2;
  final int counter3;
  final int counter4;
  final String detail;
  final String detail1;
  final String detail2;
  final String gridsectionheading;
  final String gridsectionsubheading;
  final String heading1;
  final String heading2;
  final String heading3;
  final String heading4;
  final String imagepath;
  final String imagepath2;
  final String imagepath3;
  final String label1;
  final String label2;
  final String label3;
  final String label4;
  final String subheading1;
  final String subheading2;
  final String subtitle;
  final String title;

  HomepageData({
    required this.id,
    required this.counter1,
    required this.counter2,
    required this.counter3,
    required this.counter4,
    required this.detail,
    required this.detail1,
    required this.detail2,
    required this.gridsectionheading,
    required this.gridsectionsubheading,
    required this.heading1,
    required this.heading2,
    required this.heading3,
    required this.heading4,
    required this.imagepath,
    required this.imagepath2,
    required this.imagepath3,
    required this.label1,
    required this.label2,
    required this.label3,
    required this.label4,
    required this.subheading1,
    required this.subheading2,
    required this.subtitle,
    required this.title,
  });

  factory HomepageData.fromJson(Map<String, dynamic> json) =>
      _$HomepageDataFromJson(json);

  Map<String, dynamic> toJson() => _$HomepageDataToJson(this);
}
