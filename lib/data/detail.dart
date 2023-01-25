// This file is "main.dart"
// ignore_for_file: non_constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'detail.freezed.dart';
part 'detail.g.dart';

@freezed
class Detail with _$Detail {
  const factory Detail({
    required int id,
    String? tagline,
    int? runtime,
  }) = _Detail;

  factory Detail.fromJson(Map<String, Object?> json) => _$DetailFromJson(json);
}
