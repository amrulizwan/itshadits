class Book {
  final String id;
  final int available;
  final String name;

  const Book({
    required this.id,
    required this.available,
    required this.name,
  });

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      id: json['id'] as String,
      available: json['available'] as int,
      name: json['name'] as String,
    );
  }
}
