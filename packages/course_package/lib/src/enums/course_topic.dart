/// Represents the topic category of a course.
enum CourseTopic {
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
      case CourseTopic.drugTherapy:
        return 'Disease State Management/Drug Therapy';
      case CourseTopic.hivAidsTherapy:
        return 'HIV/AIDS Therapy';
      case CourseTopic.law:
        return 'Law';
      case CourseTopic.pharmacyAdministration:
        return 'Pharmacy Administration';
      case CourseTopic.patientSafety:
        return 'Patient Safety';
      case CourseTopic.immunizations:
        return 'Immunizations';
      case CourseTopic.compounding:
        return 'Compounding';
      case CourseTopic.opioids:
        return 'Pain Management/Opioids';
      case CourseTopic.additional:
        return 'Additional Topic Areas';
    }
  }

  /// Returns the unique ID associated with this category.
  int get id {
    switch (this) {
      case CourseTopic.drugTherapy:
        return 1;
      case CourseTopic.hivAidsTherapy:
        return 2;
      case CourseTopic.law:
        return 3;
      case CourseTopic.pharmacyAdministration:
        return 4;
      case CourseTopic.patientSafety:
        return 5;
      case CourseTopic.immunizations:
        return 6;
      case CourseTopic.compounding:
        return 7;
      case CourseTopic.opioids:
        return 8;
      case CourseTopic.additional:
        return 9;
    }
  }

  /// Creates a [CourseTopic] from the given UAN string.
  static CourseTopic fromUan(String uan) {
    // Sample UAN: 0669-0000-22-106-H07-P
    final topic = uan.split('-')[4];
    final topicCode = topic.substring(1);

    switch (topicCode) {
      case '01':
        return CourseTopic.drugTherapy;
      case '02':
        return CourseTopic.hivAidsTherapy;
      case '03':
        return CourseTopic.law;
      case '04':
        return CourseTopic.pharmacyAdministration;
      case '05':
        return CourseTopic.patientSafety;
      case '06':
        return CourseTopic.immunizations;
      case '07':
        return CourseTopic.compounding;
      case '08':
        return CourseTopic.opioids;
      case '99':
        return CourseTopic.additional;
      default:
        throw ArgumentError('Invalid UAN for CourseCategory: $uan');
    }
  }
}
