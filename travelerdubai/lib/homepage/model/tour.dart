class Tour {
  final int id;
  final int countryId;
  final String countryName;
  final int cityId;
  final String cityName;
  final String name;
  final int reviewCount;
  final double rating;
  final String duration;
  final String imagePath;
  final String imageCaptionName;
  final String cityTourTypeId;
  final String cityTourType;
  final String shortDescription;
  final String cancellationPolicyName;
  final bool isSlot;
  final bool onlyChild;
  final int contractId;
  final bool recommended;
  final bool isPrivate;

  Tour({
    required this.id,
    required this.countryId,
    required this.countryName,
    required this.cityId,
    required this.cityName,
    required this.name,
    required this.reviewCount,
    required this.rating,
    required this.duration,
    required this.imagePath,
    required this.imageCaptionName,
    required this.cityTourTypeId,
    required this.cityTourType,
    required this.shortDescription,
    required this.cancellationPolicyName,
    required this.isSlot,
    required this.onlyChild,
    required this.contractId,
    required this.recommended,
    required this.isPrivate,
  });
}
