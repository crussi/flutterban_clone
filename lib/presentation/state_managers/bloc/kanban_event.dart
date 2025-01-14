import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../models/models.dart';

part 'kanban_event.freezed.dart';

@freezed
@immutable
class KanbanEvent with _$KanbanEvent {
  const factory KanbanEvent.getColumns() = GetColumns;
  const factory KanbanEvent.addColumn(String title) = AddColumn;
  const factory KanbanEvent.reorderTask(int column, int from, int to) =
      ReorderTask;
  const factory KanbanEvent.reorderColumn(int from, int to) = ReorderColumn;
  const factory KanbanEvent.moveTask(KTileData data, int column) = MoveTask;
  const factory KanbanEvent.addTask(int column, KTask task) = AddTask;
  const factory KanbanEvent.updateTask(int column, KTask task) = UpdateTask;
  const factory KanbanEvent.deleteTask(int column, KTask task) = DeleteTask;
  const factory KanbanEvent.selectTask(int column, KTask task) = SelectTask;
  const factory KanbanEvent.editTask(int column, KTask task) = EditTask;
}
