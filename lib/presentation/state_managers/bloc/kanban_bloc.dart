import 'package:bloc/bloc.dart';

import '../../../data/data.dart';
import '../../../models/models.dart';
import 'kanban_event.dart';
import 'kanban_state.dart';
export 'kanban_event.dart';
export 'kanban_state.dart';

int getCurrentTimeInMilliseconds() {
  return DateTime.now().millisecondsSinceEpoch;
}

class KanbanBloc extends Bloc<KanbanEvent, KanbanState> {
  List<KColumn> columns = Data.getColumns();

  KanbanBloc() : super(KanbanState.initial()) {
    on<KanbanEvent>((event, emit) {
      final currentState = state.copyWith();
      emit(const KanbanState(status: Status.loading));
      event.when(
        getColumns: () => emit(
          currentState.copyWith(columns: columns, status: Status.loaded),
        ),
        addColumn: (title) {
          print('addColumn title: $title');
          final updatedColumns = currentState.columns;
          updatedColumns.add(KColumn(
            title: title,
            children: List.of([]),
          ));
          emit(
            currentState.copyWith(
              columns: updatedColumns,
              status: Status.loaded,
            ),
          );
        },
        reorderTask: (column, from, to) {
          //print(getCurrentTimeInMilliseconds());
          print('reorderTask column: $column from: $from to: $to');
          if (from != to) {
            //print('from != to ... reorder');
            final updatedColumns = currentState.columns;
            final task = columns[column].children[from];
            //print('b4 remove ${updatedColumns[column].children.toString()}');
            updatedColumns[column].children.remove(task);
            //print('af remove ${updatedColumns[column].children.toString()}');
            updatedColumns[column].children.insert(to, task);
            //print('af insert ${updatedColumns[column].children.toString()}');
            emit(
              currentState.copyWith(
                columns: updatedColumns,
                status: Status.loaded,
              ),
            );
          }
        },
        reorderColumn: (int from, int to) {
          //print(getCurrentTimeInMilliseconds());
          print('reorderColumn from: $from to: $to');
          if (from != to) {
            //print('from != to ... reorder');
            final updatedColumns = currentState.columns;
            final column = updatedColumns.removeAt(from);
            updatedColumns.insert(to, column);
            emit(
              currentState.copyWith(
                columns: updatedColumns,
                status: Status.loaded,
              ),
            );
          }
        },
        moveTask: (data, column) {
          print('moveTask column: $column data: ${data.toString()}');
          final updatedColumns = currentState.columns;
          updatedColumns[data.from].children.remove(data.task);
          updatedColumns[column].children.add(data.task);
          emit(
            currentState.copyWith(
              columns: updatedColumns,
              status: Status.loaded,
            ),
          );
        },
        addTask: (column, task) {
          print('addTask column: $column title: $task.title');
          final updatedColumns = currentState.copyWith().columns;
          updatedColumns[column].children.add(task);
          final newState = state.copyWith(
              columns: List.of(updatedColumns), status: Status.loaded);
          emit(newState);
        },
        updateTask: (column, task) {
          print('updateTask column: $column task: ${task.toString()}');
          final updatedColumns = currentState.columns;

          // Find the index of the old task in the column by matching its id
          final index = updatedColumns[column]
              .children
              .indexWhere((oldTask) => oldTask.id == task.id);
          // Replace the old task with the new one
          updatedColumns[column]
              .children
              .replaceRange(index, index + 1, [task]);

          emit(
            currentState.copyWith(
              columns: updatedColumns,
              status: Status.loaded,
            ),
          );
        },
        deleteTask: (column, task) {
          print('deleteTask column: $column task: ${task.toString()}');
          final updatedColumns = currentState.columns;
          updatedColumns[column].children.remove(task);
          emit(
            currentState.copyWith(
              columns: updatedColumns,
              status: Status.loaded,
            ),
          );
        },
      );
    });
  }
}
