import 'package:course_package/src/enums/enums.dart';
import 'package:course_package/src/models/models.dart';

class CourseApi {
  const CourseApi();

  // Simulated database
  static final List<CourseItem> _courses = _generateSampleCourses();

  /// Fetch courses with pagination
  Future<PaginatedResponse<CourseItem>> getCourses({
    int page = 1,
    int pageSize = 10,
    CourseType? filterByType,
    CourseTopic? filterByTopic,
  }) async {
    // Simulate network delay
    await Future<void>.delayed(const Duration(milliseconds: 500));

    var filteredCourses = List<CourseItem>.from(_courses);

    // Apply filters
    if (filterByType != null) {
      filteredCourses = filteredCourses.where((course) {
        return course.courseType == filterByType;
      }).toList();
    }

    if (filterByTopic != null) {
      filteredCourses = filteredCourses.where((course) {
        return course.topic == filterByTopic;
      }).toList();
    }

    final total = filteredCourses.length;
    final startIndex = (page - 1) * pageSize;
    final endIndex = (startIndex + pageSize).clamp(0, total);

    final paginatedItems = filteredCourses.sublist(
      startIndex.clamp(0, total),
      endIndex,
    );

    return PaginatedResponse(
      items: paginatedItems,
      total: total,
      page: page,
      pageSize: pageSize,
    );
  }

  /// Fetch a single course by ID
  Future<CourseItem?> getCourseById(String id) async {
    await Future<void>.delayed(const Duration(milliseconds: 300));

    try {
      return _courses.firstWhere(
        (course) => course.id == id,
        orElse: () => throw Exception('Course not found'),
      );
    } on Exception {
      return null;
    }
  }

  /// Search courses by title or description
  Future<List<CourseItem>> searchCourses(String query) async {
    await Future<void>.delayed(const Duration(milliseconds: 400));

    final lowerQuery = query.toLowerCase();
    return _courses.where((course) {
      return course.title.toLowerCase().contains(lowerQuery) ||
          course.description.toLowerCase().contains(lowerQuery);
    }).toList();
  }

  /// Get featured courses (free for members or on sale)
  Future<List<CourseItem>> getFeaturedCourses({int limit = 5}) async {
    await Future<void>.delayed(const Duration(milliseconds: 300));

    return _courses
        .where((course) => course.isFreeForMembers || course.price < 50)
        .take(limit)
        .toList();
  }

  static List<CourseItem> _generateSampleCourses() {
    final coursesJson = [
      {
        'id': '1',
        'title': 'Advanced Diabetes Management',
        'description':
            'Comprehensive course on modern diabetes treatment approaches',
        'dateAdded': DateTime.now()
            .subtract(const Duration(days: 5))
            .toIso8601String(),
        'ceus': 2.0,
        'price': 49.99,
        'targetAudiences': ['Pharmacists', 'Pharmacy Technicians'],
        'topic': 'drugTherapy',
        'isLive': true,
        'isPrerecordedWebinar': false,
        'isGamifiedCourse': false,
        'isFreeForMembers': false,
      },
      {
        'id': '2',
        'title': 'HIV/AIDS Treatment Update 2024',
        'description': 'Latest advances in HIV/AIDS therapy and patient care',
        'dateAdded': DateTime.now()
            .subtract(const Duration(days: 10))
            .toIso8601String(),
        'ceus': 1.5,
        'price': 0.0,
        'targetAudiences': ['Pharmacists'],
        'topic': 'hivAidsTherapy',
        'isLive': false,
        'isPrerecordedWebinar': true,
        'isGamifiedCourse': false,
        'isFreeForMembers': true,
      },
      {
        'id': '3',
        'title': 'Pharmacy Law Essentials',
        'description': 'Key legal concepts every pharmacist must know',
        'dateAdded': DateTime.now()
            .subtract(const Duration(days: 15))
            .toIso8601String(),
        'ceus': 3.0,
        'price': 79.99,
        'targetAudiences': ['Pharmacists'],
        'topic': 'law',
        'isLive': false,
        'isPrerecordedWebinar': false,
        'isGamifiedCourse': false,
        'isFreeForMembers': false,
      },
      {
        'id': '4',
        'title': 'Immunization Best Practices',
        'description':
            'Evidence-based immunization protocols and administration',
        'dateAdded': DateTime.now()
            .subtract(const Duration(days: 20))
            .toIso8601String(),
        'ceus': 2.0,
        'price': 39.99,
        'targetAudiences': ['Pharmacists', 'Pharmacy Technicians'],
        'topic': 'immunizations',
        'isLive': false,
        'isPrerecordedWebinar': false,
        'isGamifiedCourse': true,
        'isFreeForMembers': false,
      },
      {
        'id': '5',
        'title': 'Compounding Fundamentals',
        'description': 'Introduction to pharmaceutical compounding techniques',
        'dateAdded': DateTime.now()
            .subtract(const Duration(days: 25))
            .toIso8601String(),
        'ceus': 4.0,
        'price': 99.99,
        'targetAudiences': ['Pharmacists'],
        'topic': 'compounding',
        'isLive': true,
        'isPrerecordedWebinar': false,
        'isGamifiedCourse': false,
        'isFreeForMembers': false,
      },
      {
        'id': '6',
        'title': "Opioid Crisis: A Pharmacist's Role",
        'description': 'Managing pain while addressing the opioid epidemic',
        'dateAdded': DateTime.now()
            .subtract(const Duration(days: 30))
            .toIso8601String(),
        'ceus': 2.5,
        'price': 0.0,
        'targetAudiences': ['Pharmacists', 'Pharmacy Technicians'],
        'topic': 'opioids',
        'isLive': false,
        'isPrerecordedWebinar': false,
        'isGamifiedCourse': false,
        'isFreeForMembers': true,
      },
      {
        'id': '7',
        'title': 'Patient Safety in Pharmacy Practice',
        'description':
            'Strategies to minimize medication errors and improve outcomes',
        'dateAdded': DateTime.now()
            .subtract(const Duration(days: 35))
            .toIso8601String(),
        'ceus': 1.0,
        'price': 29.99,
        'targetAudiences': ['Pharmacists', 'Pharmacy Technicians'],
        'topic': 'patientSafety',
        'isLive': false,
        'isPrerecordedWebinar': true,
        'isGamifiedCourse': false,
        'isFreeForMembers': false,
      },
      {
        'id': '8',
        'title': 'Pharmacy Management Excellence',
        'description': 'Leadership and business skills for pharmacy managers',
        'dateAdded': DateTime.now()
            .subtract(const Duration(days: 40))
            .toIso8601String(),
        'ceus': 3.5,
        'price': 89.99,
        'targetAudiences': ['Pharmacists'],
        'topic': 'pharmacyAdministration',
        'isLive': false,
        'isPrerecordedWebinar': false,
        'isGamifiedCourse': false,
        'isFreeForMembers': false,
      },
      {
        'id': '9',
        'title': 'Cardiovascular Pharmacotherapy',
        'description': 'Updated guidelines for heart disease management',
        'dateAdded': DateTime.now()
            .subtract(const Duration(days: 45))
            .toIso8601String(),
        'ceus': 2.5,
        'price': 59.99,
        'targetAudiences': ['Pharmacists'],
        'topic': 'drugTherapy',
        'isLive': false,
        'isPrerecordedWebinar': false,
        'isGamifiedCourse': false,
        'isFreeForMembers': false,
      },
      {
        'id': '10',
        'title': 'Aseptic Technique Certification',
        'description': 'Sterile compounding procedures and USP guidelines',
        'dateAdded': DateTime.now()
            .subtract(const Duration(days: 50))
            .toIso8601String(),
        'ceus': 5.0,
        'price': 129.99,
        'targetAudiences': ['Pharmacists', 'Pharmacy Technicians'],
        'topic': 'compounding',
        'isLive': true,
        'isPrerecordedWebinar': false,
        'isGamifiedCourse': false,
        'isFreeForMembers': false,
      },
      {
        'id': '11',
        'title': 'Pediatric Dosing Essentials',
        'description': 'Safe and effective medication use in children',
        'dateAdded': DateTime.now()
            .subtract(const Duration(days: 55))
            .toIso8601String(),
        'ceus': 1.5,
        'price': 0.0,
        'targetAudiences': ['Pharmacists'],
        'topic': 'drugTherapy',
        'isLive': false,
        'isPrerecordedWebinar': false,
        'isGamifiedCourse': false,
        'isFreeForMembers': true,
      },
      {
        'id': '12',
        'title': 'Mental Health Pharmacy Practice',
        'description': 'Psychotropic medications and patient counseling',
        'dateAdded': DateTime.now()
            .subtract(const Duration(days: 60))
            .toIso8601String(),
        'ceus': 3.0,
        'price': 69.99,
        'targetAudiences': ['Pharmacists'],
        'topic': 'drugTherapy',
        'isLive': false,
        'isPrerecordedWebinar': true,
        'isGamifiedCourse': false,
        'isFreeForMembers': false,
      },
      {
        'id': '13',
        'title': 'Vaccine Storage and Handling',
        'description': 'Proper protocols for maintaining vaccine efficacy',
        'dateAdded': DateTime.now()
            .subtract(const Duration(days: 65))
            .toIso8601String(),
        'ceus': 1.0,
        'price': 24.99,
        'targetAudiences': ['Pharmacists', 'Pharmacy Technicians'],
        'topic': 'immunizations',
        'isLive': false,
        'isPrerecordedWebinar': false,
        'isGamifiedCourse': false,
        'isFreeForMembers': false,
      },
      {
        'id': '14',
        'title': 'Oncology Pharmacy Basics',
        'description': 'Introduction to cancer therapy and supportive care',
        'dateAdded': DateTime.now()
            .subtract(const Duration(days: 70))
            .toIso8601String(),
        'ceus': 4.0,
        'price': 99.99,
        'targetAudiences': ['Pharmacists'],
        'topic': 'drugTherapy',
        'isLive': false,
        'isPrerecordedWebinar': false,
        'isGamifiedCourse': false,
        'isFreeForMembers': false,
      },
      {
        'id': '15',
        'title': 'HIPAA Compliance for Pharmacies',
        'description': 'Privacy regulations and best practices',
        'dateAdded': DateTime.now()
            .subtract(const Duration(days: 75))
            .toIso8601String(),
        'ceus': 2.0,
        'price': 0.0,
        'targetAudiences': ['Pharmacists', 'Pharmacy Technicians'],
        'topic': 'law',
        'isLive': false,
        'isPrerecordedWebinar': false,
        'isGamifiedCourse': true,
        'isFreeForMembers': true,
      },
      {
        'id': '16',
        'title': 'Antibiotic Stewardship',
        'description': 'Combating resistance through appropriate prescribing',
        'dateAdded': DateTime.now()
            .subtract(const Duration(days: 80))
            .toIso8601String(),
        'ceus': 2.0,
        'price': 44.99,
        'targetAudiences': ['Pharmacists'],
        'topic': 'drugTherapy',
        'isLive': false,
        'isPrerecordedWebinar': false,
        'isGamifiedCourse': false,
        'isFreeForMembers': false,
      },
      {
        'id': '17',
        'title': 'Geriatric Medication Management',
        'description': 'Optimizing drug therapy for elderly patients',
        'dateAdded': DateTime.now()
            .subtract(const Duration(days: 85))
            .toIso8601String(),
        'ceus': 2.5,
        'price': 54.99,
        'targetAudiences': ['Pharmacists'],
        'topic': 'drugTherapy',
        'isLive': false,
        'isPrerecordedWebinar': true,
        'isGamifiedCourse': false,
        'isFreeForMembers': false,
      },
      {
        'id': '18',
        'title': 'Medication Error Prevention',
        'description': 'Systems and strategies to reduce dispensing errors',
        'dateAdded': DateTime.now()
            .subtract(const Duration(days: 90))
            .toIso8601String(),
        'ceus': 1.5,
        'price': 34.99,
        'targetAudiences': ['Pharmacists', 'Pharmacy Technicians'],
        'topic': 'patientSafety',
        'isLive': false,
        'isPrerecordedWebinar': false,
        'isGamifiedCourse': false,
        'isFreeForMembers': false,
      },
      {
        'id': '19',
        'title': 'Cannabis and CBD: Clinical Updates',
        'description': 'Evidence-based review of medical marijuana',
        'dateAdded': DateTime.now()
            .subtract(const Duration(days: 95))
            .toIso8601String(),
        'ceus': 1.0,
        'price': 29.99,
        'targetAudiences': ['Pharmacists'],
        'topic': 'additional',
        'isLive': true,
        'isPrerecordedWebinar': false,
        'isGamifiedCourse': false,
        'isFreeForMembers': false,
      },
      {
        'id': '20',
        'title': 'Pharmacy Ethics and Professionalism',
        'description': 'Navigating ethical dilemmas in practice',
        'dateAdded': DateTime.now()
            .subtract(const Duration(days: 100))
            .toIso8601String(),
        'ceus': 2.0,
        'price': 0.0,
        'targetAudiences': ['Pharmacists'],
        'topic': 'law',
        'isLive': false,
        'isPrerecordedWebinar': false,
        'isGamifiedCourse': false,
        'isFreeForMembers': true,
      },
      {
        'id': '21',
        'title': 'Advanced Immunization Techniques',
        'description': 'Beyond basics: travel vaccines and special populations',
        'dateAdded': DateTime.now()
            .subtract(const Duration(days: 105))
            .toIso8601String(),
        'ceus': 2.5,
        'price': 49.99,
        'targetAudiences': ['Pharmacists'],
        'topic': 'immunizations',
        'isLive': false,
        'isPrerecordedWebinar': false,
        'isGamifiedCourse': false,
        'isFreeForMembers': false,
      },
      {
        'id': '22',
        'title': 'Medication Therapy Management',
        'description': 'Comprehensive MTM service delivery',
        'dateAdded': DateTime.now()
            .subtract(const Duration(days: 110))
            .toIso8601String(),
        'ceus': 3.0,
        'price': 74.99,
        'targetAudiences': ['Pharmacists'],
        'topic': 'pharmacyAdministration',
        'isLive': false,
        'isPrerecordedWebinar': false,
        'isGamifiedCourse': true,
        'isFreeForMembers': false,
      },
      {
        'id': '23',
        'title': 'Drug Interactions: Advanced Analysis',
        'description': 'Identifying and managing complex interactions',
        'dateAdded': DateTime.now()
            .subtract(const Duration(days: 115))
            .toIso8601String(),
        'ceus': 2.0,
        'price': 54.99,
        'targetAudiences': ['Pharmacists'],
        'topic': 'drugTherapy',
        'isLive': false,
        'isPrerecordedWebinar': false,
        'isGamifiedCourse': false,
        'isFreeForMembers': false,
      },
    ];

    return coursesJson.map(Course.fromJson).toList();
  }
}
