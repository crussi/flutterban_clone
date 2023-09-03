import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../misc/enums.dart';
import '../../models/models.dart';
import '../../utils/theme.dart';
import '../state_managers/bloc/kanban_bloc.dart';

class TaskCard extends StatelessWidget {
  final KTask task;
  final int columnIndex;
  //final Function deleteItemHandler;
  final Function editTaskHandler;
  final Function(DragUpdateDetails) dragListener;

  const TaskCard({
    super.key,
    required this.task,
    required this.columnIndex,
    required this.dragListener,
    //required this.deleteItemHandler,
    required this.editTaskHandler,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext _, BoxConstraints constraints) {
        return Container(
            height: 75,
            clipBehavior: Clip.hardEdge,
            margin: const EdgeInsets.symmetric(vertical: 6.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Draggable<KTileData>(
              onDragUpdate: dragListener,
              feedback: Material(
                color: task.themeColor,
                borderRadius: BorderRadius.circular(10.0),
                child: Container(
                  height: 75,
                  width: constraints.maxWidth,
                  //alignment: Alignment.centerLeft,
                  //padding: const EdgeInsets.only(left: 16),
                  child: ListTile(
                    dense: true,
                    title: Text(
                      task.title,
                      style: const TextStyle(
                        color: darkGrey,
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(task.description,
                        style: const TextStyle(
                          color: darkGrey,
                          fontSize: 13.0,
                          fontWeight: FontWeight.w500,
                        )),
                    isThreeLine: true,
                  ),
                ),
              ),
              childWhenDragging: Container(color: Colors.black12),
              data: KTileData(from: columnIndex, task: task),
              child: GestureDetector(
                onDoubleTap: () {
                  //editTaskHandler(columnIndex, task, ActionEnum.edit);
                  BlocProvider.of<KanbanBloc>(context)
                      .add(KanbanEvent.editTask(columnIndex, task));
                },
                child: Container(
                  //alignment: Alignment.centerLeft,
                  color: task.themeColor,
                  child: ListTile(
                    dense: true,
                    title: Text(
                      task.title,
                      style: const TextStyle(
                        color: darkGrey,
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(task.description,
                        style: const TextStyle(
                          color: darkGrey,
                          fontSize: 13.0,
                          fontWeight: FontWeight.w500,
                        )),
                    isThreeLine: true,
                  ),
                ),
              ),
            ));
      },
    );
  }
}

class TaskEditDialog extends StatelessWidget {
  const TaskEditDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<KanbanBloc, KanbanState>(
      listener: (context, state) {
        if (state.status == Status.editTask) {
          final selectedTask = state.selectedTask;
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text('Edit Task'),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Title: ${selectedTask?.title}'),
                    Text('Description: ${selectedTask?.description}'),
                  ],
                ),
              );
            },
          );
        }
      },
      child: Container(),
    );
  }
}
