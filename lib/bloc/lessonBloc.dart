import 'dart:async';

import 'package:bloc/data/lesson_service.dart';
import 'package:bloc/models/lesson.dart';

class LessonBloc {
  final lessonStreamController = StreamController.broadcast();

  Stream get getStream => lessonStreamController.stream;

  List<Lesson> getAll() {
    return LessonService.getAll();
  }
}

final lessonbloc = LessonBloc();
