import 'package:hive/hive.dart';

part 'todo_model.g.dart';

@HiveType(typeId: 0)
class TodoModel extends HiveObject {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final String description;

  @HiveField(3)
  late bool isCompleted;

  TodoModel({
    required this.id,
    required this.title,
    required this.description,
    required this.isCompleted,
  });
}
