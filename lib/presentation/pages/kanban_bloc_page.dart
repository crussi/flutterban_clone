import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/models.dart';
import '../state_managers/bloc/kanban_bloc.dart';
import '../widgets/add_column_widget.dart';
import '../widgets/kanban_board.dart';
import '../widgets/progress_indicator.dart';
import 'kanban_board_controller.dart';

class KanbanBlocPage extends StatefulWidget {
  const KanbanBlocPage({super.key});

  @override
  _KanbanBlocPageState createState() => _KanbanBlocPageState();
}

class _KanbanBlocPageState extends State<KanbanBlocPage>
    implements KanbanBoardController {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Personal Kanban'), actions: <Widget>[
        IconButton(
          icon: const Icon(
            Icons.add_circle_outline,
            color: Colors.white,
            size: 24.0,
          ),
          tooltip: 'Add Column',
          onPressed: () {
            _showAddColumn();
            // ScaffoldMessenger.of(context).showSnackBar(
            //     const SnackBar(content: Text('This is a snackbar')));
          },
        ),
        IconButton(
          icon: const Icon(
            Icons.add_box,
            color: Colors.white,
            size: 24.0,
          ),
          tooltip: 'Add Column',
          onPressed: () {
            _showAddColumn();
            // ScaffoldMessenger.of(context).showSnackBar(
            //     const SnackBar(content: Text('This is a snackbar')));
          },
        ),
        IconButton(
          icon: const Icon(
            Icons.add_circle,
            color: Colors.white,
            size: 24.0,
          ),
          tooltip: 'Add Column',
          onPressed: () {
            _showAddColumn();
            // ScaffoldMessenger.of(context).showSnackBar(
            //     const SnackBar(content: Text('This is a snackbar')));
          },
        ),
      ]),
      body: SafeArea(
        child: BlocBuilder<KanbanBloc, KanbanState>(
          builder: (context, state) {
            switch (state.status) {
              case Status.loading:
                return const Center(
                  child: CenteredProgressIndicator(),
                );
              case Status.selectTask:
              case Status.editTask:
              case Status.loaded:
                if (state.columns.isNotEmpty) {
                  return KanbanBoard(
                      controller: this,
                      columns: state.columns,
                      reorderHandler: handleColumnReOrder,
                      addTaskHandler: addTask,
                      updateTaskHandler: updateTask,
                      deleteTaskHandler: deleteTask,
                      selectTaskHandler: selectTask);
                } else {
                  return const SizedBox.shrink();
                }
            }
          },
        ),
      ),
    );
  }

  @override
  void handleTileReOrder(int oldIndex, int newIndex, int column) {
    print(
        'bloc page handleTileReOrder oldIndex: $oldIndex newIndex: $newIndex column: $column');
    context
        .read<KanbanBloc>()
        .add(KanbanEvent.reorderTask(column, oldIndex, newIndex));
  }

  @override
  void handleColumnReOrder(int oldIndex, int newIndex) {
    print(
        'bloc page handleColumnReOrder oldIndex: $oldIndex newIndex: $newIndex');
    context
        .read<KanbanBloc>()
        .add(KanbanEvent.reorderColumn(oldIndex, newIndex));
  }

  @override
  void dragHandler(KTileData data, int index) {
    print('bloc page dragHandler index: $index data: ${data.toString()}');
    context.read<KanbanBloc>().add(KanbanEvent.moveTask(data, index));
  }

  @override
  void addColumn(String title) {
    print('bloc page addColumn title: $title');
    context.read<KanbanBloc>().add(KanbanEvent.addColumn(title));
  }

  @override
  void addTask(int column, KTask task) {
    print('bloc page addTask column: $column title: $task.title');
    context.read<KanbanBloc>().add(KanbanEvent.addTask(column, task));
  }

  @override
  void updateTask(int column, KTask task) {
    print('bloc page editTask column: $column title: $task.title');
    context.read<KanbanBloc>().add(KanbanEvent.updateTask(column, task));
  }

  @override
  void deleteTask(int columnIndex, KTask task) {
    print(
        'bloc page deleteItem columnIndex: $columnIndex task: ${task.toString()}');
    context.read<KanbanBloc>().add(KanbanEvent.deleteTask(columnIndex, task));
  }

  @override
  void selectTask(int columnIndex, KTask task) {
    print(
        'bloc page selectItem columnIndex: $columnIndex task: ${task.toString()}');
    context.read<KanbanBloc>().add(KanbanEvent.selectTask(columnIndex, task));
  }

  void _showAddColumn() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      clipBehavior: Clip.hardEdge,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      builder: (context) => AddColumnForm(
        addColumnHandler: addColumn,
      ),
    );
  }
}
