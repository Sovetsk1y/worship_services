import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:worhip_service/domain/song_library/entity/song_list_item.dart';
import 'package:worhip_service/domain/song_library/failure/song_failure.dart';
import 'package:worhip_service/domain/song_library/repository/song_repository.dart';

part 'song_library_state.dart';
part 'song_library_cubit.freezed.dart';

@injectable
class SongLibraryCubit extends Cubit<SongLibraryState> {
  final SongRepository _repository;

  SongLibraryCubit(this._repository) : super(SongLibraryState.initial());

  Future<void> getSongs() async {
    emit(SongLibraryState.loading());
    final songsOrFailure = await _repository.getSongLibrary();
    songsOrFailure.fold(
      (failure) {
        emit(SongLibraryState.failed(failure: failure));
      },
      (songs) {
        emit(SongLibraryState.retrieved(songs: songs));
      },
    );
  }
}
