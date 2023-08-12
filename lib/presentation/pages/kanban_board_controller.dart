import '../../models/models.dart';

abstract class KanbanBoardController {
  void handleTileReOrder(int oldIndex, int newIndex, int column);
  void handleColumnReOrder(int oldIndex, int newIndex);
  void dragHandler(KTileData data, int index);
  void addColumn(String title);
  void addTask(int column, KTask task);
  void updateTask(int column, KTask task);
  void deleteTask(int columnIndex, KTask task);
}
