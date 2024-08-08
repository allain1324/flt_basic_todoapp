part of 'todo_bloc.dart';

sealed class TodoEvent extends Equatable {
  const TodoEvent();

  @override
  List<Object> get props => [];
}

class LoadTodo extends TodoEvent {}

class AddTodo extends TodoEvent {
  final TodoModel todo;

  const AddTodo(this.todo);

  @override
  List<Object> get props => [todo];
}

class UpdateTodo extends TodoEvent {
  final TodoModel todo;

  const UpdateTodo(this.todo);

  @override
  List<Object> get props => [todo];
}

class DeleteTodo extends TodoEvent {
  final String id;

  const DeleteTodo(this.id);

  @override
  List<Object> get props => [id];
}
