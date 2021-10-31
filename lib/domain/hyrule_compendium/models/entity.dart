import 'dart:convert';

import 'package:flutter/foundation.dart';

class Entity {
  Entity({
    required this.commonLocations,
    required this.cookingEffect,
    required this.description,
    required this.heartsRecovered,
    required this.image,
    required this.name,
  });

  final List<String> commonLocations;
  final String cookingEffect;
  final String description;
  final double heartsRecovered;
  final String image;
  final String name;

  Entity copyWith({
    List<String>? commonLocations,
    String? cookingEffect,
    String? description,
    double? heartsRecovered,
    String? image,
    String? name,
  }) {
    return Entity(
      commonLocations: commonLocations ?? this.commonLocations,
      cookingEffect: cookingEffect ?? this.cookingEffect,
      description: description ?? this.description,
      heartsRecovered: heartsRecovered ?? this.heartsRecovered,
      image: image ?? this.image,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'commonLocations': commonLocations,
      'cookingEffect': cookingEffect,
      'description': description,
      'heartsRecovered': heartsRecovered,
      'image': image,
      'name': name,
    };
  }

  factory Entity.fromMap(Map<String, dynamic> map) {
    return Entity(
      commonLocations: List<String>.from(map['common_locations']),
      cookingEffect: map['cooking_effect'],
      description: map['description'],
      heartsRecovered: map['hearts_recovered'],
      image: map['image'],
      name: map['name'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Entity.fromJson(String source) => Entity.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Entity(commonLocations: $commonLocations, cookingEffect: $cookingEffect, description: $description, heartsRecovered: $heartsRecovered, image: $image, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Entity &&
        listEquals(other.commonLocations, commonLocations) &&
        other.cookingEffect == cookingEffect &&
        other.description == description &&
        other.heartsRecovered == heartsRecovered &&
        other.image == image &&
        other.name == name;
  }

  @override
  int get hashCode {
    return commonLocations.hashCode ^
        cookingEffect.hashCode ^
        description.hashCode ^
        heartsRecovered.hashCode ^
        image.hashCode ^
        name.hashCode;
  }
}
