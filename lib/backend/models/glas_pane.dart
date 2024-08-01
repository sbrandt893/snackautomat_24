import 'package:flutter/material.dart';

// const _glassPane_null = Object();

class GlassPane {
  final String name;
  final int maxHealthPoints;
  final int actualHealthPoints;
  final List<Offset> cracks;

  GlassPane({
    required this.name,
    required this.maxHealthPoints,
    required this.actualHealthPoints,
    required this.cracks,
  });

  GlassPane copyWith({
    int? healthPoints,
    List<Offset>? cracks,
  }) {
    return GlassPane(
      name: name,
      maxHealthPoints: maxHealthPoints,
      actualHealthPoints: healthPoints ?? actualHealthPoints,
      cracks: cracks ?? this.cracks,
    );
  }

  factory GlassPane.standard() {
    return GlassPane(
      name: 'GlasPane (Standard-Model)',
      maxHealthPoints: 100,
      actualHealthPoints: 100,
      cracks: [],
    );
  }

  @override
  String toString() {
    return 'GlasPane(name: $name, maxHealthPoints: $maxHealthPoints, actualHealthPoints: $actualHealthPoints, cracks: $cracks)';
  }

  GlassPane addCrack({required Offset crack}) {
    return copyWith(
      cracks: [...cracks, crack],
    );
  }

  GlassPane repair() {
    return copyWith(
      healthPoints: maxHealthPoints,
      cracks: [],
    );
  }

  GlassPane damage({required int damageAmount}) {
    if (actualHealthPoints <= 0) {
      return this;
    }
    int newHealthPoints = actualHealthPoints - damageAmount;
    return copyWith(
      healthPoints: newHealthPoints,
    );
  }
}
