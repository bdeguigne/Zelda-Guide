import 'dart:convert';

import 'package:flutter/foundation.dart';

class Monster {
  Monster(
    this.id,
    this.commonLocation,
    this.description,
    this.drops,
    this.image,
    this.name,
  );

  final int id;
  final List<String> commonLocation;
  final String description;
  final List<String> drops;
  final String image;
  final String name;

  Monster copyWith({
    int? id,
    List<String>? commonLocation,
    String? description,
    List<String>? drops,
    String? image,
    String? name,
  }) {
    return Monster(
      id ?? this.id,
      commonLocation ?? this.commonLocation,
      description ?? this.description,
      drops ?? this.drops,
      image ?? this.image,
      name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'common_locations': commonLocation,
      'description': description,
      'drops': drops,
      'image': image,
      'name': name,
    };
  }

  factory Monster.fromMap(Map<String, dynamic> map) {
    return Monster(
      map['id'],
      map['common_locations'] != null
          ? List<String>.from(map['common_locations'])
          : List.empty(),
      map['description'],
      map['drops'] != null ? List<String>.from(map['drops']) : List.empty(),
      map['image'],
      map['name'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Monster.fromJson(String source) =>
      Monster.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Monster(id: $id, commonLocation: $commonLocation, description: $description, drops: $drops, image: $image, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Monster &&
        other.id == id &&
        listEquals(other.commonLocation, commonLocation) &&
        other.description == description &&
        listEquals(other.drops, drops) &&
        other.image == image &&
        other.name == name;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        commonLocation.hashCode ^
        description.hashCode ^
        drops.hashCode ^
        image.hashCode ^
        name.hashCode;
  }
}
