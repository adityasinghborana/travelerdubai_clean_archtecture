

import 'package:json_annotation/json_annotation.dart';

part 'eventdetailsresponse.g.dart';

@JsonSerializable()
class EventDetails {
  int? id;
  String? eventName;
  int? eventdetailid;
  String? description;
  String? date;
  String? location;
  String? googlemapurl;
  String? minage;
  String? moreinfo;
  String? ticketinfo;
  String? artistname;
  String? artistimage;
  String? lastbookingtime;
  bool? eventSelling;
  bool? ischildallowed;
  bool? isadultallowed;
  bool? isinfantallowed;
  String? duration;
  String? vendorUid;
  List<EventOption>? eventoptions;
  List<Image>? images;

  EventDetails({
    this.id,
    this.eventName,
    this.eventdetailid,
    this.description,
    this.date,
    this.location,
    this.googlemapurl,
    this.minage,
    this.moreinfo,
    this.ticketinfo,
    this.artistname,
    this.artistimage,
    this.lastbookingtime,
    this.eventSelling,
    this.ischildallowed,
    this.isadultallowed,
    this.isinfantallowed,
    this.duration,
    this.vendorUid,
    this.eventoptions,
    this.images,
  });

  factory EventDetails.fromJson(Map<String, dynamic> json) => _$EventDetailsFromJson(json);
  Map<String, dynamic> toJson() => _$EventDetailsToJson(this);
}

@JsonSerializable()
class EventOption {
  int? id;
  int? eventId;
  String? optionname;
  String? adultprice;
  String? childprice;
  String? infantprice;
  String? optiondescription;
  String? available;
  List<TimeSlot>? timeslots;

  EventOption({
    this.id,
    this.eventId,
    this.optionname,
    this.adultprice,
    this.childprice,
    this.infantprice,
    this.optiondescription,
    this.available,
    this.timeslots,
  });

  factory EventOption.fromJson(Map<String, dynamic> json) => _$EventOptionFromJson(json);
  Map<String, dynamic> toJson() => _$EventOptionToJson(this);
}

@JsonSerializable()
class TimeSlot {
  int? id;
  int? eventOptionId;
  String? timeSlot;
  String? available;
  String? adultPrice;
  String? childPrice;

  TimeSlot({
    this.id,
    this.eventOptionId,
    this.timeSlot,
    this.available,
    this.adultPrice,
    this.childPrice,
  });

  factory TimeSlot.fromJson(Map<String, dynamic> json) => _$TimeSlotFromJson(json);
  Map<String, dynamic> toJson() => _$TimeSlotToJson(this);
}

@JsonSerializable()
class Image {
  int? id;
  String? imagePath;
  int? eventDetailId;

  Image({
    this.id,
    this.imagePath,
    this.eventDetailId,
  });

  factory Image.fromJson(Map<String, dynamic> json) => _$ImageFromJson(json);
  Map<String, dynamic> toJson() => _$ImageToJson(this);
}
