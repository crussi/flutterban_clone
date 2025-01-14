import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';
import '../../misc/enums.dart';
import '../../misc/extensions.dart';
import '../../models/column.dart';
import '../../models/task.dart';
import '../pages/kanban_board_controller.dart';
import '../state_managers/bloc/kanban_bloc.dart';
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
  final Function updateTaskHandler;
  final Function deleteTaskHandler;
  final Function selectTaskHandler;

  const KanbanBoard(
      {super.key,
      required this.controller,
      required this.columns,
      required this.reorderHandler,
      required this.addTaskHandler,
      required this.updateTaskHandler,
      required this.deleteTaskHandler,
      required this.selectTaskHandler});

  @override
  State<KanbanBoard> createState() => _KanbanBoardState();
}

class _KanbanBoardState extends State<KanbanBoard> {
  final ScrollController _scrollController = ScrollController();
  final TextEditingController _textController = TextEditingController();
  // Define a key for the form
  final _formKey = GlobalKey<FormState>();

  // Define controllers for each text field
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _idController = TextEditingController();
  final uuid = const Uuid();
  int? index;
  KTask? task;
  late BuildContext parentContext;

  @override
  void dispose() {
    _scrollController.dispose();
    _textController.dispose();
    _idController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    parentContext = context;
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
              editTaskHandler: _displayEditTask,
              dragListener: _dragListener,
              //deleteItemHandler: widget.controller.deleteTask,
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

  void _displayEditTask(int index, KTask task, ActionEnum action) {
    // Set the initial values from the task object
    this.index = index;
    this.task = task;
    _titleController.text = task.title;
    _descriptionController.text = task.description;
    _idController.text = task.id;
    EditMnuItem? selectedMenu;

    final ButtonStyle saveStyle = ElevatedButton.styleFrom(
      textStyle: const TextStyle(fontSize: 17),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4.0),
      ),
      foregroundColor: Colors.white,
      backgroundColor: Theme.of(context).primaryColor,
      minimumSize: const Size(90.0, 49.0),
    );

    final ButtonStyle cancelStyle = OutlinedButton.styleFrom(
      side: const BorderSide(
        width: 2.0,
        color: Colors.black12,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
    );

    closeDialog() {
      Navigator.pop(context);
    }

    handleOnSelected(EditMnuItem item) {
      handleEditSelect(item, closeDialog);
    }

    showDialog(
      context: parentContext,
      builder: (context) {
        return Dialog(
          child: Form(
            key: _formKey,
            child: SizedBox(
              width: 500.0,
              height: 410.0,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 20.0, right: 20.0, top: 20.0, bottom: 10.0),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "${action.toString().split('.').last.capitalize()} Task",
                              style: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w700,
                                color: Colors.black54,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 10.0),
                        child: EditMenuButton(
                          initialValue: selectedMenu,
                          onSelected: handleOnSelected,
                        ),
                      ),
                    ],
                  ),
                  // Title text field
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 20.0, right: 20.0, top: 10.0, bottom: 5.0),
                    child: TextFormField(
                      autofocus: true,
                      decoration: const InputDecoration(
                        hintText: 'Task Title',
                        border: OutlineInputBorder(),
                        helperText: " ",
                        //helperStyle: TextStyle()
                      ), //hides validation error
                      validator: (value) {
                        if (value?.isEmpty ?? true) {
                          return 'Please enter a title';
                        }
                        return null;
                      },
                      controller: _titleController,
                    ),
                  ),
                  // Description text field
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 20.0, right: 20.0, top: 5.0, bottom: 5.0),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        hintText: 'Task Description',
                        border: OutlineInputBorder(),
                        helperText: " ",
                      ),
                      validator: (value) {
                        if (value?.isEmpty ?? true) {
                          return 'Please enter a description';
                        }
                        return null;
                      },
                      controller: _descriptionController,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 20.0, right: 20.0, top: 5.0, bottom: 5.0),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        hintText: 'Id',
                        border: OutlineInputBorder(),
                        helperText: " ",
                      ),
                      validator: (value) {
                        if (value?.isEmpty ?? true) {
                          return '';
                        }
                        return null;
                      },
                      controller: _idController,
                    ),
                  ), // Buttons row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          width: 90,
                          height: 45,
                          child: OutlinedButton(
                            style: cancelStyle,
                            onPressed: () {
                              // Clear the text fields and close dialog
                              _titleController.clear();
                              _descriptionController.clear();
                              closeDialog();
                            },
                            child: const Text('Cancel'),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 8.0, right: 20.0, top: 8.0, bottom: 8.0),
                        child: ElevatedButton(
                          style: saveStyle,
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              // Save the changes to the task object
                              task.title = _titleController.text.trim();
                              task.description =
                                  _descriptionController.text.trim();
                              if (action == ActionEnum.add) {
                                // Call the addTaskHandler function with the updated task object and index
                                widget.addTaskHandler(index, task);
                              } else if (action == ActionEnum.edit) {
                                widget.updateTaskHandler(index, task);
                              }
                              // Navigate back to the previous screen
                              Navigator.of(context).pop();
                            }
                          },
                          child: const Text('Save'),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );

        //
      },
    );
  }

// Define a function that takes the enum value as a parameter and handles the selection logic
  void handleEditSelect(EditMnuItem item, Function closeParentDialog) {
    switch (item) {
      case EditMnuItem.archive:
        print('archive');
        break;
      case EditMnuItem.copy:
        KTask? newTask = task?.copyWith(id: uuid.v4());
        task = newTask;
        widget.selectTaskHandler(index, task);
        print('copy');
        break;
      case EditMnuItem.delete:
        print('delete');
        // Show a dialog widget with a confirmation message
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text('Delete task'),
              content: const Text('Are you sure you want to delete this task?'),
              actions: [
                // Add a button for yes that calls the deleteTaskHandler
                TextButton(
                  onPressed: () {
                    widget.deleteTaskHandler(index, task);
                    Navigator.of(context).pop();
                    // close the dialog
                    closeParentDialog();
                  },
                  child: const Text('Yes'),
                ),
                // Add a button for no that closes the dialog
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(); // close the dialog
                  },
                  child: const Text('No'),
                ),
              ],
            );
          },
        );
        //Navigator.of(context).pop();
        break;
      case EditMnuItem.reset:
        print('reset');
        break;
      default:
        print('default');
        break;
    }
  }

  void _dragListener(DragUpdateDetails details) {
    if (details.localPosition.dx > MediaQuery.of(context).size.width - 40) {
      _scrollController.jumpTo(_scrollController.offset + 10);
    } else if (details.localPosition.dx < 20) {
      _scrollController.jumpTo(_scrollController.offset - 10);
    }
  }
}

// Define a custom widget that takes the enum values and the onSelected callback as parameters
class EditMenuButton extends StatelessWidget {
  final EditMnuItem? initialValue;
  final void Function(EditMnuItem) onSelected;

  const EditMenuButton({
    Key? key,
    required this.initialValue,
    required this.onSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Use a map to store the enum values and their corresponding text labels
    final Map<EditMnuItem, String> menuItems = {
      EditMnuItem.archive: 'Archive',
      EditMnuItem.copy: 'Copy',
      EditMnuItem.delete: 'Delete',
      EditMnuItem.reset: 'Reset',
    };

    // Use a list comprehension to generate the PopupMenuEntry widgets from the map
    return PopupMenuButton<EditMnuItem>(
      initialValue: initialValue,
      itemBuilder: (context) => [
        for (var entry in menuItems.entries)
          PopupMenuItem<EditMnuItem>(
            value: entry.key,
            child: Text(entry.value),
          ),
      ],
      onSelected: onSelected,
    );
  }
}
