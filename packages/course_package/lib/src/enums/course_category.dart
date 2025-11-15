enum CourseTopic {
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
}
