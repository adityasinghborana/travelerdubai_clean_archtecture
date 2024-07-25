
import 'package:json_annotation/json_annotation.dart';
part 'city.g.dart';

@JsonSerializable()
class City {
  final int id;
  final String imagePath ;
  final int CityId;
  final String CityName;



  City({
    required this.id ,
    required this.imagePath,
    required this.CityName ,
    required this.CityId ,


  });
  factory City.fromJson(Map<String, dynamic> json) =>
      _$CityFromJson(json);

  Map<String, dynamic> toJson() => _$CityToJson(this);

}