import 'continent.dart';

class Countries {
  final String code;
  final String name;
  final String phone;
  final Continent continent;
  final String capital;
  final String currency;
  final String emoji;

  Countries({
    required this.code,
    required this.name,
    required this.phone,
    required this.continent,
    required this.capital,
    required this.currency,
    required this.emoji,
  });

  factory Countries.fromJson(Map<String, dynamic> json) => Countries(
    code: json['code'] ?? "",
    name: json['name'] ?? "",
    phone: json['phone'] ?? "",
    continent: Continent.fromJson(json['continent']),
    capital: json['capital'] ?? "",
    currency: json['currency'] ?? "",
    emoji: json['emoji'] ?? ""
  );

}