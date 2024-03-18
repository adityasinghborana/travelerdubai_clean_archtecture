import 'package:json_annotation/json_annotation.dart';
part 'intent_request.g.dart';
@JsonSerializable()
class IntentRequest{
final String UserId;

  IntentRequest({required this.UserId});
  factory IntentRequest.fromJson(Map<String, dynamic> json) => _$IntentRequestFromJson(json);
  Map<String, dynamic> toJson() => _$IntentRequestToJson(this);
}