import 'package:flutter/material.dart';

/// Represents a continuing education requirement
/// for a specific state and profession.
@immutable
class CeRequirement {
  /// Creates a [CeRequirement] instance.
  ///
  /// Both [state] and [profession] are required parameters.
  const CeRequirement({
    required this.state,
    required this.profession,
  });

  /// The state code or name where the requirement applies.
  final String state;

  /// The profession or license type for which the requirement applies.
  final String profession;

  /// Creates a copy of this [CeRequirement] with optional new values.
  CeRequirement copyWith({
    String? state,
    String? profession,
  }) {
    return CeRequirement(
      state: state ?? this.state,
      profession: profession ?? this.profession,
    );
  }

  @override
  bool operator ==(Object other) =>
      other is CeRequirement &&
      state == other.state &&
      profession == other.profession;

  @override
  int get hashCode => Object.hash(state, profession);
}
