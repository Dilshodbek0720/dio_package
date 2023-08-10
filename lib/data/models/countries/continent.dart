class Continent {
  final String code;
  final String name;

  Continent({
    required this.code,
    required this.name,
  });

  factory Continent.fromJson(Map<String, dynamic> json){
    return Continent(
        code: json['code'] ?? "",
        name: json['name'] ?? ""
    );
  }

}