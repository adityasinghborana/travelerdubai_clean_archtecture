// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'eventdetailsresponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EventDetails _$EventDetailsFromJson(Map<String, dynamic> json) => EventDetails(
      id: (json['id'] as num?)?.toInt(),
      eventName: json['eventName'] as String?,
      eventdetailid: (json['eventdetailid'] as num?)?.toInt(),
      description: json['description'] as String?,
      date: json['date'] as String?,
      location: json['location'] as String?,
      googlemapurl: json['googlemapurl'] as String?,
      minage: json['minage'] as String?,
      moreinfo: json['moreinfo'] as String?,
      ticketinfo: json['ticketinfo'] as String?,
      artistname: json['artistname'] as String?,
      artistimage: json['artistimage'] as String?,
      lastbookingtime: json['lastbookingtime'] as String?,
      eventSelling: json['eventSelling'] as bool?,
      ischildallowed: json['ischildallowed'] as bool?,
      isadultallowed: json['isadultallowed'] as bool?,
      isinfantallowed: json['isinfantallowed'] as bool?,
      duration: json['duration'] as String?,
      vendorUid: json['vendorUid'] as String?,
      eventoptions: (json['eventoptions'] as List<dynamic>?)
          ?.map((e) => EventOption.fromJson(e as Map<String, dynamic>))
          .toList(),
      images: (json['images'] as List<dynamic>?)
          ?.map((e) => Image.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$EventDetailsToJson(EventDetails instance) =>
    <String, dynamic>{
      'id': instance.id,
      'eventName': instance.eventName,
      'eventdetailid': instance.eventdetailid,
      'description': instance.description,
      'date': instance.date,
      'location': instance.location,
      'googlemapurl': instance.googlemapurl,
      'minage': instance.minage,
      'moreinfo': instance.moreinfo,
      'ticketinfo': instance.ticketinfo,
      'artistname': instance.artistname,
      'artistimage': instance.artistimage,
      'lastbookingtime': instance.lastbookingtime,
      'eventSelling': instance.eventSelling,
      'ischildallowed': instance.ischildallowed,
      'isadultallowed': instance.isadultallowed,
      'isinfantallowed': instance.isinfantallowed,
      'duration': instance.duration,
      'vendorUid': instance.vendorUid,
      'eventoptions': instance.eventoptions,
      'images': instance.images,
    };

EventOption _$EventOptionFromJson(Map<String, dynamic> json) => EventOption(
      id: (json['id'] as num?)?.toInt(),
      eventId: (json['eventId'] as num?)?.toInt(),
      optionname: json['optionname'] as String?,
      adultprice: json['adultprice'] as String?,
      childprice: json['childprice'] as String?,
      infantprice: json['infantprice'] as String?,
      optiondescription: json['optiondescription'] as String?,
      available: json['available'] as String?,
      timeslots: (json['timeslots'] as List<dynamic>?)
          ?.map((e) => TimeSlot.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$EventOptionToJson(EventOption instance) =>
    <String, dynamic>{
      'id': instance.id,
      'eventId': instance.eventId,
      'optionname': instance.optionname,
      'adultprice': instance.adultprice,
      'childprice': instance.childprice,
      'infantprice': instance.infantprice,
      'optiondescription': instance.optiondescription,
      'available': instance.available,
      'timeslots': instance.timeslots,
    };

TimeSlot _$TimeSlotFromJson(Map<String, dynamic> json) => TimeSlot(
      id: (json['id'] as num?)?.toInt(),
      eventOptionId: (json['eventOptionId'] as num?)?.toInt(),
      timeSlot: json['timeSlot'] as String?,
      available: json['available'] as String?,
      adultPrice: json['adultPrice'] as String?,
      childPrice: json['childPrice'] as String?,
    );

Map<String, dynamic> _$TimeSlotToJson(TimeSlot instance) => <String, dynamic>{
      'id': instance.id,
      'eventOptionId': instance.eventOptionId,
      'timeSlot': instance.timeSlot,
      'available': instance.available,
      'adultPrice': instance.adultPrice,
      'childPrice': instance.childPrice,
    };

Image _$ImageFromJson(Map<String, dynamic> json) => Image(
      id: (json['id'] as num?)?.toInt(),
      imagePath: json['imagePath'] as String?,
      eventDetailId: (json['eventDetailId'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ImageToJson(Image instance) => <String, dynamic>{
      'id': instance.id,
      'imagePath': instance.imagePath,
      'eventDetailId': instance.eventDetailId,
    };
