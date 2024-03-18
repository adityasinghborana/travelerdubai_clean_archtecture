class TourOptionStaticData {
  String tourId;
  String contractId;

  TourOptionStaticData({
    required this.tourId,
    required this.contractId,
  });

  factory TourOptionStaticData.fromJson(Map<String, dynamic> json) {
    return TourOptionStaticData(
      tourId: json['tourId'] as String,
      contractId: json['contractId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'tourId': tourId,
      'contractId': contractId,
    };
  }
}
