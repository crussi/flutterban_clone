import 'dart:ui';

import 'package:flutter/material.dart';

import '../../models/models.dart';
import 'card_column.dart';
import 'task_card_widget.dart';

class KanbanColumn extends StatelessWidget {
  final KColumn column;
  final int index;
  final Function dragHandler;
  final Function reorderHandler;
  final Function addTaskHandler;
  final Function(DragUpdateDetails) dragListener;
  final Function deleteItemHandler;

  const KanbanColumn({
    super.key,
    required this.column,
    required this.index,
    required this.dragHandler,
    required this.reorderHandler,
    required this.addTaskHandler,
    required this.dragListener,
    required this.deleteItemHandler,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        CardColumn(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                _buildButtonNewTask(index),
                //_buildTitleColumn(),
                _buildListItemsColumn(),
              ],
            ),
          ),
        ),
        Positioned.fill(
          child: DragTarget<KTileData>(
            onWillAccept: (data) {
              return true;
            },
            onLeave: (data) {},
            onAccept: (data) {
              if (data.from == index) {
                return;
              }
              dragHandler(data, index);
            },
            builder: (context, accept, reject) {
              return const SizedBox();
            },
          ),
        ),
      ],
    );
  }

  Widget proxyDecorator(Widget child, int index, Animation<double> animation) {
    return AnimatedBuilder(
      animation: animation,
      builder: (BuildContext context, Widget? child) {
        final double animValue = Curves.easeInOut.transform(animation.value);
        final double elevation = lerpDouble(0, 6, animValue)!;
        return Material(
          elevation: elevation,
          color: Colors.transparent,
          shadowColor: Colors.black.withOpacity(0.50),
          borderRadius: BorderRadius.circular(10.0),
          child: child,
        );
      },
      child: child,
    );
  }

  Widget _buildListItemsColumn() {
    return Expanded(
      child: ReorderableListView(
        //buildDefaultDragHandles: false,
        proxyDecorator: proxyDecorator,
        onReorderEnd: (index) => {print('onReorderEnd index: $index')},
        onReorderStart: (index) => {print('onReorderStart index: $index')},
        onReorder: (oldIndex, newIndex) {
          print('onReorder oldIndex: $oldIndex newIndex: $newIndex');
          //On most reorderablelistview reorder events
          //the newIndex is +2 greater than oldIndex
          //for some reason it's only +1 greater.  Only
          //adjust when +2 greater.
          if (oldIndex < newIndex - 1) {
            newIndex -= 1;
          }

          if (newIndex < column.children.length) {
            reorderHandler(oldIndex, newIndex, index);
          }
        },
        children: [
          for (final task in column.children)
            TaskCard(
              key: ValueKey(task),
              task: task,
              columnIndex: index,
              dragListener: dragListener,
              deleteItemHandler: deleteItemHandler,
            )
        ],
      ),
    );
  }

  // Widget _buildTitleColumn() {
  //   return Padding(
  //     padding: const EdgeInsets.all(8.0),
  //     child: Text(
  //       column.title,
  //       style: const TextStyle(
  //         fontSize: 20,
  //         color: Colors.black,
  //         fontWeight: FontWeight.w700,
  //       ),
  //     ),
  //   );
  // }

  //"Add task" button at bottom of listview
  Widget _buildButtonNewTask(int index) {
    return ListTile(
      dense: true,
      onTap: () {
        addTaskHandler(index);
      },
      trailing: const Tooltip(
          message: 'Add Task',
          child: Icon(
            Icons.add_circle_outline,
            color: Colors.black45,
            size: 24.0,
          )),
      title: Text(
        column.title,
        style: const TextStyle(
          fontSize: 20,
          color: Colors.black,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
