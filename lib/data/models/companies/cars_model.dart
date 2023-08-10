class CarsModel {
  final int id;
  final String car_model;
  final int average_price;
  final String logo;
  final int established_year;

  CarsModel({
    required this.id,
    required this.car_model,
    required this.average_price,
    required this.logo,
    required this.established_year,
  });

  factory CarsModel.fromJson(Map<String, dynamic> json) {
    return CarsModel(
      id: json['id'] ?? 0,
      car_model: json['car_model'] ?? "",
      average_price: json['average_price'] ?? 0,
      logo: json['logo'] ?? "",
      established_year: json['established_year'] ?? 0,
    );
  }
}
