import 'dart:convert';

import 'package:flutter/foundation.dart';

class Treasure {
  final List<String> commonLocations;
  final List<String> drops;
  final String description;
  final String image;
  final String name;
  Treasure({
    required this.commonLocations,
    required this.drops,
    required this.description,
    required this.image,
    required this.name,
  });

  Treasure copyWith({
    List<String>? commonLocations,
    List<String>? drops,
    String? description,
    String? image,
    String? name,
  }) {
    return Treasure(
      commonLocations: commonLocations ?? this.commonLocations,
      drops: drops ?? this.drops,
      description: description ?? this.description,
      image: image ?? this.image,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'commonLocations': commonLocations,
      'drops': drops,
      'description': description,
      'image': image,
      'name': name,
    };
  }

  factory Treasure.fromMap(Map<String, dynamic> map) {
    return Treasure(
      commonLocations: List<String>.from(map['common_locations']),
      drops: List<String>.from(map['drops']),
      description: map['description'],
      image: map['image'],
      name: map['name'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Treasure.fromJson(String source) =>
      Treasure.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Treasure(commonLocations: $commonLocations, drops: $drops, description: $description, image: $image, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Treasure &&
        listEquals(other.commonLocations, commonLocations) &&
        listEquals(other.drops, drops) &&
        other.description == description &&
        other.image == image &&
        other.name == name;
  }

  @override
  int get hashCode {
    return commonLocations.hashCode ^
        drops.hashCode ^
        description.hashCode ^
        image.hashCode ^
        name.hashCode;
  }
}
