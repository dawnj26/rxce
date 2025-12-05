/// Represents the topic category of a course.
enum CourseCategory {
  /// Courses on disease management and drug therapy options.
  drugTherapy,

  /// Courses focused on HIV/AIDS treatment and management.
  hivAidsTherapy,

  /// Courses on pharmacy law and regulations.
  law,

  /// Courses on pharmacy operations and management.
  pharmacyAdministration,

  /// Courses on medication safety and error prevention.
  patientSafety,

  /// Courses on immunization protocols and administration.
  immunizations,

  /// Courses on pharmaceutical compounding techniques.
  compounding,

  /// Courses on pain management and opioid-related topics.
  opioids,

  /// Courses on miscellaneous pharmacy-related topics.
  additional;

  /// Returns the human-readable label for this category.
  String get label {
    switch (this) {
      case CourseCategory.drugTherapy:
        return 'Disease State Management/Drug Therapy';
      case CourseCategory.hivAidsTherapy:
        return 'HIV/AIDS Therapy';
      case CourseCategory.law:
        return 'Law';
      case CourseCategory.pharmacyAdministration:
        return 'Pharmacy Administration';
      case CourseCategory.patientSafety:
        return 'Patient Safety';
      case CourseCategory.immunizations:
        return 'Immunizations';
      case CourseCategory.compounding:
        return 'Compounding';
      case CourseCategory.opioids:
        return 'Pain Management/Opioids';
      case CourseCategory.additional:
        return 'Additional Topic Areas';
    }
  }
}
