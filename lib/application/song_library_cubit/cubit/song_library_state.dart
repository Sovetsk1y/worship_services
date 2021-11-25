part of 'song_library_cubit.dart';

@freezed
class SongLibraryState with _$SongLibraryState {
  const factory SongLibraryState.initial() = _Initial;
  const factory SongLibraryState.loading() = _Loading;
  const factory SongLibraryState.retrieved(
      {required Iterable<SongListItem> songs}) = _Retrieved;
  const factory SongLibraryState.failed({required SongFailure failure}) =
      _Failed;
}
