import 'package:course_package/src/models/models.dart';

/// Mock data for courses. In a real application,
/// this would come from an API or database.
final courses = [
  CourseItem(
    id: 1,
    testNumber: 'CS101',
    testName: 'Fundamentals of Computer Science',
    testNameShort: 'CS Fundamentals',
    credits: 3,
    uan: 'UAN-CS-001',
    dateAdded: DateTime.now().subtract(const Duration(days: 60)),
    startDate: DateTime.now().add(const Duration(days: 7)),
    expires: DateTime.now().add(const Duration(days: 180)),
    description:
        'This course provides an introduction to the fundamental concepts of '
        'computer science, including algorithms, data structures, '
        'and programming languages.',
    difficulty: 'beginner',
    isFreeForMembers: true,
  ),
  CourseItem(
    id: 2,
    testNumber: 'ML401',
    testName: 'Advanced Machine Learning',
    testNameShort: 'Adv ML',
    credits: 4,
    uan: 'UAN-ML-402',
    dateAdded: DateTime.now().subtract(const Duration(days: 45)),
    startDate: DateTime.now().add(const Duration(days: 14)),
    expires: DateTime.now().add(const Duration(days: 365)),
    description:
        'Explore deep learning, neural networks, and AI techniques for '
        'solving complex problems in various domains.',
    difficulty: 'advanced',
  ),
  CourseItem(
    id: 3,
    testNumber: 'WEB202',
    testName: 'Web Development with React',
    testNameShort: 'React Dev',
    credits: 3,
    uan: 'UAN-WEB-203',
    dateAdded: DateTime.now().subtract(const Duration(days: 30)),
    startDate: DateTime.now().add(const Duration(days: 3)),
    expires: DateTime.now().add(const Duration(days: 120)),
    description:
        'Learn to build modern, responsive web applications using React, '
        'hooks, and state management libraries.',
    difficulty: 'intermediate',
  ),
  CourseItem(
    id: 4,
    testNumber: 'CS201',
    testName: 'Data Structures and Algorithms',
    testNameShort: 'DSA',
    credits: 4,
    uan: 'UAN-CS-201',
    dateAdded: DateTime.now().subtract(const Duration(days: 75)),
    startDate: DateTime.now().add(const Duration(days: 21)),
    expires: DateTime.now().add(const Duration(days: 240)),
    description:
        'Master essential data structures and algorithmic techniques for '
        'efficient problem-solving and coding interviews.',
    difficulty: 'intermediate',
  ),
  CourseItem(
    id: 5,
    testNumber: 'MOB301',
    testName: 'Mobile App Development with Flutter',
    testNameShort: 'Flutter Dev',
    credits: 3,
    uan: 'UAN-MOB-305',
    dateAdded: DateTime.now().subtract(const Duration(days: 20)),
    startDate: DateTime.now().add(const Duration(days: 5)),
    expires: DateTime.now().add(const Duration(days: 150)),
    description:
        'Build beautiful, natively compiled applications for mobile, web, and '
        'desktop from a single codebase using Flutter.',
    difficulty: 'intermediate',
  ),
  CourseItem(
    id: 6,
    testNumber: 'PY100',
    testName: 'Introduction to Python Programming',
    testNameShort: 'Python Intro',
    credits: 2,
    uan: 'UAN-PY-100',
    dateAdded: DateTime.now().subtract(const Duration(days: 90)),
    startDate: DateTime.now().add(const Duration(days: 1)),
    expires: DateTime.now().add(const Duration(days: 90)),
    description:
        'Start your programming journey with Python, covering basics, control '
        'flow, functions, and object-oriented concepts.',
    difficulty: 'beginner',
  ),
  CourseItem(
    id: 7,
    testNumber: 'CLD350',
    testName: 'Cloud Computing with AWS',
    testNameShort: 'AWS Cloud',
    credits: 4,
    uan: 'UAN-CLD-351',
    dateAdded: DateTime.now().subtract(const Duration(days: 55)),
    startDate: DateTime.now().add(const Duration(days: 28)),
    expires: DateTime.now().add(const Duration(days: 300)),
    description:
        'Learn to design, deploy, and manage scalable applications on Amazon '
        'Web Services cloud infrastructure.',
    difficulty: 'advanced',
  ),
  CourseItem(
    id: 8,
    testNumber: 'DB150',
    testName: 'Database Design and SQL',
    testNameShort: 'DB & SQL',
    credits: 3,
    uan: 'UAN-DB-152',
    dateAdded: DateTime.now().subtract(const Duration(days: 40)),
    startDate: DateTime.now().add(const Duration(days: 10)),
    expires: DateTime.now().add(const Duration(days: 180)),
    description:
        'Understand relational database concepts, normalization, and write '
        'efficient SQL queries for data manipulation.',
    difficulty: 'beginner',
  ),
  CourseItem(
    id: 9,
    testNumber: 'SEC250',
    testName: 'Cybersecurity Fundamentals',
    testNameShort: 'Cybersecurity',
    credits: 3,
    uan: 'UAN-SEC-251',
    dateAdded: DateTime.now().subtract(const Duration(days: 35)),
    startDate: DateTime.now().add(const Duration(days: 15)),
    expires: DateTime.now().add(const Duration(days: 210)),
    description:
        'Learn security principles, threat detection, encryption, and best '
        'practices for protecting digital assets.',
    difficulty: 'intermediate',
  ),
  CourseItem(
    id: 10,
    testNumber: 'DVO400',
    testName: 'DevOps and CI/CD Pipelines',
    testNameShort: 'DevOps',
    credits: 4,
    uan: 'UAN-DVO-401',
    dateAdded: DateTime.now().subtract(const Duration(days: 25)),
    startDate: DateTime.now().add(const Duration(days: 20)),
    expires: DateTime.now().add(const Duration(days: 270)),
    description:
        'Master DevOps practices, continuous integration, continuous '
        'deployment, and infrastructure automation tools.',
    difficulty: 'advanced',
  ),
];
