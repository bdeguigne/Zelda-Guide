import 'dart:convert';

import 'package:flutter/foundation.dart';

class Equipment {
  final double attack;
  final List<String> commonLocations;
  final double defense;
  final String description;
  final String image;
  final String name;

  Equipment({
    required this.attack,
    required this.commonLocations,
    required this.defense,
    required this.description,
    required this.image,
    required this.name,
  });

  Equipment copyWith({
    double? attack,
    List<String>? commonLocations,
    double? defense,
    String? description,
    String? image,
    String? name,
  }) {
    return Equipment(
      attack: attack ?? this.attack,
      commonLocations: commonLocations ?? this.commonLocations,
      defense: defense ?? this.defense,
      description: description ?? this.description,
      image: image ?? this.image,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'attack': attack,
      'commonLocations': commonLocations,
      'defense': defense,
      'description': description,
      'image': image,
      'name': name,
    };
  }

  factory Equipment.fromMap(Map<String, dynamic> map) {
    return Equipment(
      attack: map['attack'] ?? 0,
      commonLocations: map['common_locations'] != null
          ? List<String>.from(map['common_locations'])
          : List.empty(),
      defense: map['defense'] ?? 0,
      description: map['description'],
      image: map['image'],
      name: map['name'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Equipment.fromJson(String source) =>
      Equipment.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Equipment(attack: $attack, commonLocations: $commonLocations, defense: $defense, description: $description, image: $image, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Equipment &&
        other.attack == attack &&
        listEquals(other.commonLocations, commonLocations) &&
        other.defense == defense &&
        other.description == description &&
        other.image == image &&
        other.name == name;
  }

  @override
  int get hashCode {
    return attack.hashCode ^
        commonLocations.hashCode ^
        defense.hashCode ^
        description.hashCode ^
        image.hashCode ^
        name.hashCode;
  }
}
