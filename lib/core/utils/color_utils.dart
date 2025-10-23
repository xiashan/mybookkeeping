import 'package:flutter/material.dart';

/// 将 #RRGGBB 或 #AARRGGBB 转换为 Color
Color hexToColor(String hex) {
  var normalized = hex.replaceAll('#', '').toUpperCase();
  if (normalized.length == 6) {
    normalized = 'FF$normalized';
  }
  final value = int.tryParse(normalized, radix: 16);
  if (value == null) {
    return const Color(0xFFEAEAEA);
  }
  return Color(value);
}
