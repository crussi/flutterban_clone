import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../models/models.dart';

part 'kanban_state.freezed.dart';

enum Status { loading, loaded, selectTask, editTask }

@freezed
abstract class KanbanState with _$KanbanState {
  const factory KanbanState({
    @Default([]) List<KColumn> columns,
    required Status status,
    KTask? selectedTask,
  }) = _KanbanState;

  factory KanbanState.initial() {
    print('KanbanState initial');
    return const KanbanState(
        columns: [], status: Status.loading, selectedTask: null);
  }

  factory KanbanState.loading() {
    print('KanbanState loading');
    return const KanbanState(
        columns: [], status: Status.loading, selectedTask: null);
  }

  factory KanbanState.loaded(List<KColumn> projects) {
    print('KanbanState loaded projectslength: ${projects.length}');
    return KanbanState(
        columns: projects, status: Status.loaded, selectedTask: null);
  }

  factory KanbanState.selectTask(List<KColumn> projects, KTask? task) {
    print('KanbanState selectTask selectedTask: ${task?.title}');
    return KanbanState(
        columns: projects, status: Status.selectTask, selectedTask: task);
  }

  factory KanbanState.editTask(List<KColumn> projects, KTask? task) {
    print('KanbanState editTask selectedTask: ${task?.title}');
    return KanbanState(
        columns: projects, status: Status.editTask, selectedTask: task);
  }
}
