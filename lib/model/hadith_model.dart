class Hadith {
  final int number;
  final String arab;
  final String id;

  const Hadith({
    required this.number,
    required this.arab,
    required this.id,
  });

  factory Hadith.fromJson(Map<String, dynamic> json) {
    return Hadith(
      number: json['number'] as int,
      arab: json['arab'] as String,
      id: json['id'] as String,
    );
  }
}
