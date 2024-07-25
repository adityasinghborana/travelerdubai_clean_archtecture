import 'package:json_annotation/json_annotation.dart';

part 'homepagedata.g.dart';

@JsonSerializable()
class HomepageData {
  final int? id;
  final int? counter1;
  final int ?counter2;
  final int? counter3;
  final int ?counter4;
  final String? detail;
  final String ?detail1;
  final String ?detail2;
  final String ?gridsectionheading;
  final String ?gridsectionsubheading;
  final String ?heading1;
  final String ?heading2;
  final String ?heading3;
  final String ?heading4;
  final String ?heading5;
  final String ?heading6;
  final String ?imagepath;
  final String ?imagepath2;
  final String ?imagepath3;
  final String ?label1;
  final String ?label2;
  final String? label3;
  final String ?label4;
  final String? subheading1;
  final String? subheading2;
  final String ?subtitle;
  final String ?title;

  HomepageData({
    this.id,
    this.counter1,
     this.counter2,
 this.counter3,
this.counter4,
 this.detail,
   this.detail1,
  this.detail2,
this.gridsectionheading,
   this.gridsectionsubheading,
   this.heading1,
     this.heading2,
 this.heading3,
   this.heading4,
   this.heading5,
   this.heading6,
     this.imagepath,
  this.imagepath2,
 this.imagepath3,
 this.label1,
 this.label2,
    this.label3,
  this.label4,
   this.subheading1,
    this.subheading2,
     this.subtitle,
   this.title,
  });

  factory HomepageData.fromJson(Map<String, dynamic> json) =>
      _$HomepageDataFromJson(json);

  Map<String, dynamic> toJson() => _$HomepageDataToJson(this);
}
