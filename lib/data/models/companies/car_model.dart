class CarModel {
  final num id;
  final String carModel;
  final String logo;
  final num establishedYear;
  final num averagePrice;
  final String description;
  final List<String> carPics;

  CarModel({
    required this.id,
    required this.carModel,
    required this.logo,
    required this.establishedYear,
    required this.averagePrice,
    required this.description,
    required this.carPics,
  });

  factory CarModel.fromJson(Map<String, dynamic> json) {
    return CarModel(
      id: json['id'] ?? 0,
      carModel: json['car_model'] ?? "",
      logo: json['logo'] ?? "",
      establishedYear: json['established_year'] ?? 0,
      averagePrice: json['average_price'] ?? 0,
      description: json['description'] ?? "",
      carPics: (json['car_pics'] as List?)
          ?.map((e) => e as String)
          .toList() ??
          [],
    );
  }
}
