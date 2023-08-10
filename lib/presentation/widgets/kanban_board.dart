import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import '../../models/column.dart';
import '../pages/kanban_board_controller.dart';
import 'add_column_widget.dart';
import 'column_widget.dart';

Widget proxyDecorator(Widget child, int index, Animation<double> animation) {
  return AnimatedBuilder(
    animation: animation,
    builder: (BuildContext context, Widget? child) {
      final double animValue = Curves.easeInOut.transform(animation.value);
      final double elevation = lerpDouble(0, 6, animValue)!;
      return Material(
        elevation: elevation,
        color: Colors.transparent,
        shadowColor: Colors.black.withOpacity(0.10),
        borderRadius: BorderRadius.circular(10.0),
        child: child,
      );
    },
    child: child,
  );
}

class KanbanBoard extends StatefulWidget {
  final KanbanBoardController controller;
  final List<KColumn> columns;
  final Function reorderHandler;
  final Function addTaskHandler;

  const KanbanBoard(
      {super.key,
      required this.controller,
      required this.columns,
      required this.reorderHandler,
      required this.addTaskHandler});

  @override
  State<KanbanBoard> createState() => _KanbanBoardState();
}

class _KanbanBoardState extends State<KanbanBoard> {
  final ScrollController _scrollController = ScrollController();
  final TextEditingController _textController = TextEditingController();
  final uuid = const Uuid();

  @override
  void dispose() {
    _scrollController.dispose();
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ReorderableListView(
      proxyDecorator: proxyDecorator,
      scrollController: _scrollController,
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.all(16),

      children: [
        // Loop through the list and create a widget for each item
        // implement add column: widget.columns.length + 1
        for (int index = 0; index < widget.columns.length; index++)
          Container(
            //key: ValueKey(widget.columns[index]),
            key: Key(uuid.v4()),
            margin: const EdgeInsets.all(10),
            child: KanbanColumn(
              column: widget.columns[index],
              index: index,
              dragHandler: widget.controller.dragHandler,
              reorderHandler: widget.controller.handleTileReOrder,
              addTaskHandler: _showAddTask,
              dragListener: _dragListener,
              deleteItemHandler: widget.controller.deleteItem,
            ),
          ),
      ],
      // This function is called when an item is dragged to a new position
      onReorder: (oldIndex, newIndex) {
        setState(() {
          // Update the order of the list
          if (newIndex > oldIndex) {
            newIndex -= 1;
          }
          //implement reorderHandler
          if (newIndex < widget.columns.length) {
            widget.reorderHandler(oldIndex, newIndex);
          }
        });
      },
    );
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
        addColumnHandler: widget.controller.addColumn,
      ),
    );
  }

  // void _showAddTask(int index) {
  //   showModalBottomSheet(
  //     context: context,
  //     isScrollControlled: true,
  //     backgroundColor: Colors.white,
  //     clipBehavior: Clip.hardEdge,
  //     shape: const RoundedRectangleBorder(
  //       borderRadius: BorderRadius.only(
  //         topLeft: Radius.circular(10),
  //         topRight: Radius.circular(10),
  //       ),
  //     ),
  //     builder: (context) => AddTaskForm(
  //       addTaskHandler: (String title) {
  //         widget.controller.addTask(title, index);
  //       },
  //     ),
  //   );
  // }

  void _showAddTask(int index) {
    showDialog(
      context: context,
      builder: (context) {
        return Form(
          child: AlertDialog(
            title: const Text(
              'Add Task',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w700,
                color: Colors.black54,
              ),
            ),
            content: Container(
              width: 400.0,
              height: 200.0,
              margin: const EdgeInsets.symmetric(vertical: 8.0),
              child: TextFormField(
                autofocus: true,
                decoration: const InputDecoration(
                  hintText: 'Task Title',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Please enter a title';
                  }
                  return null;
                },
                controller: _textController,
              ),
            ),
            actions: [
              MaterialButton(
                height: 45.0,
                minWidth: 90.0,
                color: Colors.grey,
                textColor: Colors.white,
                onPressed: () {
                  Navigator.of(context).pop();
                },
                splashColor: Colors.black12,
                child: const Text("Cancel"),
              ),
              MaterialButton(
                height: 45.0,
                minWidth: 90.0,
                color: Theme.of(context).primaryColor,
                textColor: Colors.white,
                onPressed: () {
                  if (_textController.text.isNotEmpty) {
                    Navigator.of(context).pop();
                    widget.addTaskHandler(_textController.text.trim(), index);
                  }
                },
                splashColor: Colors.black12,
                child: const Text("Add"),
              )
            ],
          ),
        );
      },
    ).then((value) => _textController.clear());
  }

  void _dragListener(DragUpdateDetails details) {
    if (details.localPosition.dx > MediaQuery.of(context).size.width - 40) {
      _scrollController.jumpTo(_scrollController.offset + 10);
    } else if (details.localPosition.dx < 20) {
      _scrollController.jumpTo(_scrollController.offset - 10);
    }
  }
}

/*
class _KanbanBoardStateX extends State<KanbanBoard> {
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      controller: _scrollController,
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.all(16),
      itemCount: widget.columns.length + 1,
      separatorBuilder: (_, __) => const SizedBox(width: 16),
      itemBuilder: (context, index) {
        if (index == widget.columns.length) {
          return AddColumnButton(
            addColumnAction: _showAddColumn,
          );
        } else {
          return KanbanColumn(
            column: widget.columns[index],
            index: index,
            dragHandler: widget.controller.dragHandler,
            reorderHandler: widget.controller.handleReOrder,
            addTaskHandler: _showAddTask,
            dragListener: _dragListener,
            deleteItemHandler: widget.controller.deleteItem,
          );
        }
      },
    );
  }
*/

