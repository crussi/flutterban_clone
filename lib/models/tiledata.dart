import 'package:freezed_annotation/freezed_annotation.dart';

import 'task.dart';

part 'tiledata.freezed.dart';

@freezed
class KTileData with _$KTileData {
  const factory KTileData({
    required int from,
    required KTask task,
  }) = _KTileData;
}
