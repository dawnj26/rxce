enum CourseCategory {
  drugTherapy,
  hivAidsTherapy,
  law,
  pharmacyAdministration,
  patientSafety,
  immunizations,
  compounding,
  opioids,
  additional;

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
