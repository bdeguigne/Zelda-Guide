import 'dart:convert';

class Equipment {
  final String image;

  Equipment({
    required this.image,
  });

  Equipment copyWith({
    String? image,
  }) {
    return Equipment(
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'image': image,
    };
  }

  factory Equipment.fromMap(Map<String, dynamic> map) {
    return Equipment(
      image: map['image'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Equipment.fromJson(String source) =>
      Equipment.fromMap(json.decode(source));

  @override
  String toString() => 'Equipment(image: $image)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Equipment && other.image == image;
  }

  @override
  int get hashCode => image.hashCode;
}
