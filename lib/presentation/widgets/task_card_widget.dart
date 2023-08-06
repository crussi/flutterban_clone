import 'package:flutter/material.dart';

import '../../models/models.dart';
import '../../utils/theme.dart';
// import 'taks_menu.widget.dart';
// import 'task_text_widget.dart';

class TaskCard extends StatelessWidget {
  final KTask task;
  final int columnIndex;
  final Function deleteItemHandler;
  final Function(DragUpdateDetails) dragListener;

  const TaskCard({
    super.key,
    required this.task,
    required this.columnIndex,
    required this.dragListener,
    required this.deleteItemHandler,
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
            ));
      },
    );
  }
}
