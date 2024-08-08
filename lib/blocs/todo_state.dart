part of 'todo_bloc.dart';

abstract class TodoState extends Equatable {
  const TodoState();

  @override
  List<Object> get props => [];
}

class TodoInitial extends TodoState {}

class TodoLoadInProgress extends TodoState {}

class TodoLoadSuccess extends TodoState {
  final List<TodoModel> todos;

  const TodoLoadSuccess([this.todos = const []]);

  @override
  List<Object> get props => [todos];
}

class TodoLoadFailure extends TodoState {}
