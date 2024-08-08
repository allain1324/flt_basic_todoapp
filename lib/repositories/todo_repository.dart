import 'package:hive/hive.dart';
import 'package:ftl_basic_todoapp/models/todo_model.dart';

class TodoRepository {
  final Box<TodoModel> _todoBox;

  TodoRepository(this._todoBox);

  Future<void> add(TodoModel todo) async {
    await _todoBox.put(todo.id, todo);
  }

  Future<void> update(TodoModel todo) async {
    await _todoBox.put(todo.id, todo);
  }

  Future<void> delete(String id) async {
    await _todoBox.delete(id);
  }

  Future<List<TodoModel>> getAll() async {
    return _todoBox.values.toList();
  }

  Future<void> deleteAll() async {
    await _todoBox.clear();
  }
}