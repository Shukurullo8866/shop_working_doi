class CategoryModel {
  CategoryModel({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.createdAt,
  });

  final int id;
  final String name;
  final String imageUrl;
  final String createdAt;

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        id: json["id"] as int? ?? 0,
        name: json["name"] as String? ?? "",
        imageUrl: json["image_url"] as String? ?? "",
        createdAt: json["created_at"] as String? ?? "",
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image_url": imageUrl,
        "created_at": createdAt,
      };
}
