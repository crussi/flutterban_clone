import '../../models/models.dart';

abstract class KanbanBoardController {
  void deleteItem(int columnIndex, KTask task);
  void handleTileReOrder(int oldIndex, int newIndex, int column);
  void handleColumnReOrder(int oldIndex, int newIndex);
  void dragHandler(KTileData data, int index);
  void addColumn(String title);
  void addTask(String title, int column);
}
