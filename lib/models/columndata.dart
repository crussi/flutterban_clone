import 'package:freezed_annotation/freezed_annotation.dart';

import 'column.dart';

part 'columndata.freezed.dart';

@freezed
class KColumnData with _$KColumnData {
  const factory KColumnData({
    required int from,
    required KColumn column,
  }) = _KColumnData;
}
