class GenreDtoModel {
  final int? id;
  final String? name;

  GenreDtoModel({required this.id, required this.name});

  factory GenreDtoModel.fromMap(Map<String, dynamic> response) =>
    GenreDtoModel(
      id: response["id"] ?? 0,
      name: response["name"].toString()
    );
}