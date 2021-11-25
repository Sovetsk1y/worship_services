import 'package:freezed_annotation/freezed_annotation.dart';

part 'song_failure.freezed.dart';

@freezed
abstract class SongFailure with _$SongFailure {
  const factory SongFailure.server() = _Server;
}
