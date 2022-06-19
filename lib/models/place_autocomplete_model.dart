class AutoPlaceComplete {
  final String description;
  final String placeId;

  AutoPlaceComplete({required this.description, required this.placeId});

  factory AutoPlaceComplete.fromJson(Map<String, dynamic> json) {
    return AutoPlaceComplete(
        description: json['description'], placeId: json['place_id']);
  }
}
