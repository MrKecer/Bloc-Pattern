import 'dart:math';

import 'package:bloc/models/lesson.dart';

class LessonService {
  static List<Lesson> lessons = [];

  LessonService._instince();
  static LessonService _singleton = LessonService._instince();

  factory LessonService() {
    return _singleton;
  }

  static List<Lesson> getAll() {
    lessons.add(Lesson(id: 1, name: "Math", point: 6.0));
    lessons.add(Lesson(id: 2, name: "Fizik", point: 5.0));
    lessons.add(Lesson(id: 3, name: "Biyoloji", point: 4.0));
    lessons.add(Lesson(id: 4, name: "Kimya", point: 3.0));
    lessons.add(Lesson(id: 5, name: "Edebiyat", point: 6.0));
    return lessons;
  }
}
