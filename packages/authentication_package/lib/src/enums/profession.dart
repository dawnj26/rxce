/// Represents professional roles in the healthcare system.
enum Profession {
  /// A licensed pharmacist.
  pharmacist,

  /// A pharmacy technician.
  pharmacyTech,

  /// A student in a healthcare field.
  student,

  /// A licensed physician.
  physician,

  /// A physician assistant.
  physicianAssistant,
  ;

  /// Returns the human-readable label for this profession.
  String get label {
    switch (this) {
      case Profession.pharmacist:
        return 'Pharmacist';
      case Profession.pharmacyTech:
        return 'Pharmacy Technician';
      case Profession.student:
        return 'Student';
      case Profession.physician:
        return 'Physician';
      case Profession.physicianAssistant:
        return 'Physician Assistant';
    }
  }
}
