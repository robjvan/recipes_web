class Recipe {
  int id;
  String title;
  int userId;

  //TODO: Add missing fields

  Recipe({
    required this.id,
    required this.title,
    required this.userId,
  });

  factory Recipe.fromJson(final Map<String, dynamic> json) => Recipe(
        id: json['id'],
        title: json['title'],
        userId: json['userId'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'userId': userId,
      };
}
