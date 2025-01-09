class CharacterModel {
  final String name;
  final String house;
  final String image;
  final Map<String,dynamic> wand;

  CharacterModel({required this.name, required this.house, required this.image, required this.wand});

  factory CharacterModel.fromJson(Map<String, dynamic> json) {
    return CharacterModel(
      name: json['name'],
      house: json['house'] ?? 'Unknown',
      image: json['image'],
      wand: json['wand']
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'house': house,
      'image': image,
      'wand': wand,
    };
  }
}