class ZoneDetailsModel {
  ZoneDetailsModel({
    this.id,
    this.latitude,
    this.longitude,
    this.coverageArea,
  });

  int? id;
  double? latitude;
  double? longitude;
  double? coverageArea;

  factory ZoneDetailsModel.fromJson(Map<String, dynamic> json) =>
      ZoneDetailsModel(
        id: json["id"],
        latitude: json["lat"],
        longitude: json["longitude"],
        coverageArea: json["coverageArea"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "lat": latitude,
        "longitude": longitude,
        "coverageArea": coverageArea,
      };
}
