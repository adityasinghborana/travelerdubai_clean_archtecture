import 'package:json_annotation/json_annotation.dart';
part 'contactusresponse.g.dart';
@JsonSerializable()
class ContactUsData {
final String? Heading;
final String? Subheading;
final String? Subheading2;
final String? Address;
final String?mobilenumber;
final String? Email;
final String? Heading2;
final String? Imagepath;
ContactUsData(this.Heading, this.Subheading, this.Subheading2, this.Address,
    this.mobilenumber, this.Email, this.Heading2, this.Imagepath);

  factory ContactUsData.fromJson(Map<String, dynamic> json) =>
      _$ContactUsDataFromJson(json);
  Map<String, dynamic> toJson() => _$ContactUsDataToJson(this);


}
