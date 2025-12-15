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
  additional
  ;

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

  /// Returns the unique ID associated with this category.
  int get id {
    switch (this) {
      case CourseCategory.drugTherapy:
        return 1;
      case CourseCategory.hivAidsTherapy:
        return 2;
      case CourseCategory.law:
        return 3;
      case CourseCategory.pharmacyAdministration:
        return 4;
      case CourseCategory.patientSafety:
        return 5;
      case CourseCategory.immunizations:
        return 6;
      case CourseCategory.compounding:
        return 7;
      case CourseCategory.opioids:
        return 8;
      case CourseCategory.additional:
        return 9;
    }
  }

  /// Creates a [CourseCategory] from the given UAN string.
  static CourseCategory fromUan(String uan) {
    // Sample UAN: 0669-0000-22-106-H07-P
    final topic = uan.split('-')[4];
    final topicCode = topic.substring(1);

    switch (topicCode) {
      case '01':
        return CourseCategory.drugTherapy;
      case '02':
        return CourseCategory.hivAidsTherapy;
      case '03':
        return CourseCategory.law;
      case '04':
        return CourseCategory.pharmacyAdministration;
      case '05':
        return CourseCategory.patientSafety;
      case '06':
        return CourseCategory.immunizations;
      case '07':
        return CourseCategory.compounding;
      case '08':
        return CourseCategory.opioids;
      case '99':
        return CourseCategory.additional;
      default:
        throw ArgumentError('Invalid UAN for CourseCategory: $uan');
    }
  }
}
