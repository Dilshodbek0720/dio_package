import 'countries.dart';

class Data {
  final List<Countries> countries;
  Data({required this.countries});

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
        countries: (json['countries'] as List?)
                ?.map((e) => Countries.fromJson(e))
                .toList() ??
            []);
  }
}
