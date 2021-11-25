import 'package:freezed_annotation/freezed_annotation.dart';

part 'song_list_item.freezed.dart';

@freezed
abstract class SongListItem with _$SongListItem {
  factory SongListItem({
    required String id,
    required String title,
  }) = _SongListItem;
}
