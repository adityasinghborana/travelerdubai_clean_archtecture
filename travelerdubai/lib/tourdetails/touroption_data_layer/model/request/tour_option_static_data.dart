class TourOptionStaticData {
  String tourId;
  String contractId;
  bool isVendor;

  TourOptionStaticData({
    required this.tourId,
    required this.contractId,
    required this.isVendor,
  });

  factory TourOptionStaticData.fromJson(Map<String, dynamic> json) {
    return TourOptionStaticData(
      tourId: json['tourId'] as String,
      contractId: json['contractId'] as String,
      isVendor: json['isVendor'] as bool,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'tourId': tourId,
      'contractId': contractId,
      'isVendor':isVendor
    };
  }
}
